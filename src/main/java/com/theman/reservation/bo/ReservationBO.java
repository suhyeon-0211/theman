package com.theman.reservation.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theman.menu.bo.MenuBO;
import com.theman.menu.model.Menu;
import com.theman.reservation.dao.ReservationDAO;
import com.theman.reservation.model.Reservation;
import com.theman.reservation.model.ReservationCheck;
import com.theman.reservation.model.ReservationDetail;
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
	
	public void updateReservationStatusById(int reservationId, String name, String status) {
		boolean isAdmin = false;
		if (name.equals("admin")) {
			isAdmin = true;
		}
		reservationDAO.updateReservationStatusById(reservationId, status);
		if (status.equals("예약취소")) {
			reservationDAO.insertReservationCancelLog(reservationId, isAdmin);
		}
	}
	
	public boolean existReservationInfo(String phoneNumber, String reservationPassword) {
		return reservationDAO.existReservationInfo(phoneNumber, reservationPassword);
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
	
	public Reservation getReservationById(int id) {
		return reservationDAO.selectReservationById(id);
	}
	
	public ReservationDetail getReservationDetailById(int id) {
		
		Reservation reservation = getReservationById(id);
		
		ReservationDetail reservationDetail = new ReservationDetail();
		reservationDetail.setReservation(reservation);
		reservationDetail.setMenu(menuBO.getMenuById(reservation.getServiceId()));
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd(EEE)");
		Date date = reservationDetail.getReservation().getReservationDateTime();
		reservationDetail.setDateStr(sdf2.format(date));
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		String reservationDateTimeStr = sdf1.format(date);
		
		List<String> timeList = new ArrayList<>();
		for (int i = 0; i < reservationDetail.getMenu().getRequiredTime(); i+= 30) {
			calendar.add(Calendar.MINUTE, 30);
			timeList.add(sdf1.format(calendar.getTime()));
		}
		reservationDateTimeStr = reservationDateTimeStr + " ~ " + timeList.get(timeList.size() - 1);
		reservationDetail.setRequiredTimeStr(reservationDateTimeStr);
		return reservationDetail;
	}
	
	public Map<Integer, List<ReservationTimeStatus>> getReservationCheckListByThisWeek() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, 2-calendar.get(Calendar.DAY_OF_WEEK));
		Map<Integer, List<ReservationTimeStatus>> reservationTimeStatusMap = new HashMap<>();
		for(int i = 0; i < 7; i++) {
			Date targetDate = calendar.getTime();
			List<ReservationTimeStatus> reservationTimeStatusList = getReservationTimeStatusListByDate(targetDate);
			reservationTimeStatusMap.put(i, reservationTimeStatusList);
			calendar.add(Calendar.DATE, 1);
		}
		return reservationTimeStatusMap;
	}
	
	public List<String> getTimeIfIsToday() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		
		Date today = new Date();
		
		Calendar todayCal = Calendar.getInstance();
		todayCal.set(Calendar.HOUR, 550);
		todayCal.set(Calendar.MINUTE, 0);
		
		List<String> todayHourList = new ArrayList<>();
		
		for (int i = 0; i < 20; i++) {
			if (today.before(todayCal.getTime())) {
				todayHourList.add(sdf.format(todayCal.getTime()));
			} else {
				break;
			}
			todayCal.add(Calendar.MINUTE, 30);
		}
		return todayHourList;
	}
}
