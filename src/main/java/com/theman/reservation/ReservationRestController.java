package com.theman.reservation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

@RequestMapping("/reservation")
@RestController
public class ReservationRestController {

	@Autowired
	private ReservationBO reservationBO;
	
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd일 HH:mm분");
		Date localDate = sdf.parse(dateTime);
		
		System.out.println(sdf.format(localDate));
		
		// db insert
		reservationBO.insertReservation(menuId, localDate, name, phoneNumber, reservationPassword);
		
		// 결과
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	@PutMapping("/update")
	public Map<String, Object> reservationUpdate(
			@RequestParam("reservationDate") Date reservationDate,
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("reservationPassword") String reservationPassword) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
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
	
}
