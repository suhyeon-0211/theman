package com.theman.reservation;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
}
