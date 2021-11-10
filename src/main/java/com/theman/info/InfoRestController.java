package com.theman.info;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theman.reservation.bo.ReservationBO;
import com.theman.reservation.model.ReservationTimeStatus;

@RestController
public class InfoRestController {

	@Autowired
	private ReservationBO reservationBO;
	
	/**
	 * info 화면 - 예약현황 조회
	 * @return
	 */
	@RequestMapping("/info/select")
	public Map<String, Object> ReservationTimeStatusSelect() {
		Map<String, Object> result = new HashMap<>();
		Map<Integer, List<ReservationTimeStatus>> reservationTimeStatusMap = reservationBO.getReservationCheckListByThisWeek();
		result.put("reservationTimeStatus", reservationTimeStatusMap);
		return result;
	}
}
