package com.theman.reservation;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/reservation")
@RestController
public class ReservationRestController {

	@PostMapping("/create")
	public Map<String, Object> reservationCreate(
			@RequestParam("reservationDate") Date reservationDate,
			@RequestParam("reservationTime") String reservationTime,
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("serviceType") String serviceType,
			@RequestParam("reservationPassword") String reservationPassword) {
		// date 가공 -> 
		
		// db insert
		
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
