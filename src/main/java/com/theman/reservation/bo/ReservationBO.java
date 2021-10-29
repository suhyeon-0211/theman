package com.theman.reservation.bo;

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

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private MenuBO menuBO;
	
	public void insertReservation(int serviceId, Date reservationDateTime, String name, String phoneNumber, String reservationPassword) {
		reservationDAO.insertReservation(serviceId, reservationDateTime, name, phoneNumber, reservationPassword);
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
}
