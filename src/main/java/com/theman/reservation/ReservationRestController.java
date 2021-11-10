package com.theman.reservation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.theman.reservation.bo.ReservationBO;
import com.theman.reservation.model.ReservationTimeStatus;

@RequestMapping("/reservation")
@RestController
public class ReservationRestController {

	@Autowired
	private ReservationBO reservationBO;
	
	/**
	 * 예약하기
	 * @param date
	 * @param menuId
	 * @param time
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@PostMapping("/create")
	public Map<String, Object> reservationCreate(
			@RequestParam("date") String date,
			@RequestParam("menuId") int menuId,
			@RequestParam("time") String time,
			HttpServletRequest request) throws ParseException {
		
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		String phoneNumber = (String) session.getAttribute("phoneNumber");
		String reservationPassword = (String) session.getAttribute("reservationPassword");
		
		// date 가공 -> String date 와 time 을 합쳐 dateTime 만들기
		String dateTime = date + " " + time;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		Date localDate = sdf.parse(dateTime);
		
		// db insert
		reservationBO.insertReservation(menuId, localDate, name, phoneNumber, reservationPassword);
		
		// 결과
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 예약취소
	 * @param reservationId
	 * @param request
	 * @return
	 */
	@PutMapping("/update")
	public Map<String, Object> reservationUpdate(@RequestParam("reservationId") int reservationId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		String status = "예약취소";
		reservationBO.updateReservationStatusById(reservationId, name, status);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 예약하기 화면 비회원 로그인
	 * @param name
	 * @param phoneNumber
	 * @param reservationPassword
	 * @param request
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> reservationSignIn(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("reservationPassword") String reservationPassword,
			HttpServletRequest request) {
		// 비회원 로그인된 정보 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("phoneNumber", phoneNumber);
		session.setAttribute("reservationPassword", reservationPassword);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 예약확인화면 비회원 로그인
	 * @param phoneNumber
	 * @param reservationPassword
	 * @param request
	 * @return
	 */
	@PostMapping("/check")
	public Map<String, Object> reservationCheck(
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("reservationPassword") String reservationPassword,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("phoneNumber", phoneNumber);
		session.setAttribute("reservationPassword", reservationPassword);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 예약현황 가져오기
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	@PostMapping("/status")
	public Map<String, Object> reservationCheck(@RequestParam("date") String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd (EEE)");
		Date targetDate = sdf.parse(date);
		Date today = new Date();
		List<String> todayHourList = new ArrayList<>();
		if (sdf.format(targetDate).equals(sdf.format(today))) {
			todayHourList = reservationBO.getTimeIfIsToday();
		}
		List<ReservationTimeStatus> reservationTimeStatusList = reservationBO.getReservationTimeStatusListByDate(targetDate);
		
		Map<String, Object> result = new HashMap<>();
		result.put("reservationResult", reservationTimeStatusList);
		result.put("todayHourList", todayHourList);
		return result;
	}
}
