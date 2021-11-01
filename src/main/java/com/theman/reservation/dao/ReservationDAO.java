package com.theman.reservation.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.theman.reservation.model.Reservation;

@Repository
public interface ReservationDAO {
	public void insertReservation(
			@Param("serviceId") int serviceId, 
			@Param("reservationDateTime") Date reservationDateTime, 
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber, 
			@Param("reservationPassword") String reservationPassword);
	public void updateReservationStatusById(int id);
	public void insertReservationCancelLog(
			@Param("id") int id,
			@Param("isAdmin") boolean isAdmin);
	public List<Reservation> selectReservationListByPhoneNumberAndReservationPassword(
			@Param("phoneNumber") String phoneNumber,
			@Param("reservationPassword") String reservationPassword);
	public List<Reservation> selectReservationListByDate(Date date);
}
