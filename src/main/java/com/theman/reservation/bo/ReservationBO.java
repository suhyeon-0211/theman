package com.theman.reservation.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theman.menu.bo.MenuBO;
import com.theman.menu.model.Menu;
import com.theman.reservation.dao.ReservationDAO;
import com.theman.reservation.model.Reservation;
import com.theman.reservation.model.ReservationCheck;
import com.theman.reservation.model.ReservationTimeStatus;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private MenuBO menuBO;
	
	public void insertReservation(int serviceId, Date reservationDateTime, String name, String phoneNumber, String reservationPassword) {
		reservationDAO.insertReservation(serviceId, reservationDateTime, name, phoneNumber, reservationPassword);
	}
	
	public void updateReservationStatusById(int reservationId, String name) {
		boolean isAdmin = false;
		if (name.equals("admin")) {
			isAdmin = true;
		}
		reservationDAO.updateReservationStatusById(reservationId);
		reservationDAO.insertReservationCancelLog(reservationId, isAdmin);
	}
	public List<ReservationCheck> getReservationCheckListByPhoneNumberAndReservationPassword(String phoneNumber, String reservationPassword) {
		List<Reservation> reservationList = reservationDAO.selectReservationListByPhoneNumberAndReservationPassword(phoneNumber, reservationPassword);
		List<ReservationCheck> reservationCheckList = new ArrayList<>();
		for (Reservation reservation : reservationList) {
			Menu menu = menuBO.getMenuById(reservation.getServiceId());
			ReservationCheck reservationCheck = new ReservationCheck();
			reservationCheck.setReservation(reservation);
			reservationCheck.setMenu(menu);
			reservationCheckList.add(reservationCheck);
		}
		return reservationCheckList;
	}
	
	public List<ReservationCheck> getReservationCheckListByDate(Date date) {
		List<Reservation> reservationList = reservationDAO.selectReservationListByDate(date);
		// 여기서 부터 확인
		List<ReservationCheck> reservationCheckList = new ArrayList<>();
		for (Reservation reservation : reservationList) {
			Menu menu = menuBO.getMenuById(reservation.getServiceId());
			ReservationCheck reservationCheck = new ReservationCheck();
			reservationCheck.setReservation(reservation);
			reservationCheck.setMenu(menu);
			reservationCheckList.add(reservationCheck);
		}
		return reservationCheckList;
	}
	
	public List<ReservationTimeStatus> getReservationTimeStatusListByDate(Date date) {
		List<ReservationCheck> reservationCheckList = getReservationCheckListByDate(date);
		List<ReservationTimeStatus> reservationTimeStatusList = new ArrayList<>();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		for (ReservationCheck reservationCheck : reservationCheckList) {
			if (!reservationCheck.getReservation().getStatus().equals("예약완료")) {
				continue;
			}
			ReservationTimeStatus tempReservation = new ReservationTimeStatus();
			String tempDate = sdf1.format(reservationCheck.getReservation().getReservationDateTime());
			String tempTime = sdf2.format(reservationCheck.getReservation().getReservationDateTime());
			tempReservation.setDate(tempDate);
			tempReservation.setTime(tempTime);
			tempReservation.setType(reservationCheck.getMenu().getType());
			tempReservation.setSpecificType(reservationCheck.getMenu().getSpecificType());
			tempReservation.setRequiredTime(reservationCheck.getMenu().getRequiredTime());
			reservationTimeStatusList.add(tempReservation);
		}
		return reservationTimeStatusList;
	}
}
