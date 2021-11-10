package com.theman.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.theman.admin.bo.AdminBO;
import com.theman.admin.model.CalendarVO;
import com.theman.reservation.model.ReservationDetail;

@RequestMapping("/admin")
@RestController
public class AdminRestController {

	@Autowired
	private AdminBO adminBO;
	
	/**
	 * 메뉴중 큰 타입 업데이트
	 * @param menuList
	 * @return
	 */
	@PostMapping("/menu_type_update")
	public Map<String, Object> menuTypeUpdate(
			@RequestParam("menuList[]") List<String> menuList) {
		
		// db update
		adminBO.updateMenuType(menuList);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 메뉴 추가(단일)
	 * @param typeId
	 * @param specificType
	 * @param price
	 * @param requiredTime
	 * @return
	 */
	@PostMapping("/menu_insert")
	public Map<String, Object> menuInsert(
			@RequestParam("typeId") int typeId,
			@RequestParam("specificType") String specificType,
			@RequestParam("price") int price,
			@RequestParam("requiredTime") int requiredTime) {
		// db insert
		adminBO.insertSpecificMenu(typeId, specificType, price, requiredTime);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 메뉴 삭제(단일)
	 * @param id
	 * @return
	 */
	@PostMapping("/menu_delete")
	public Map<String, Object> menuDelete(
			@RequestParam("menuId") int id) {
		// db delete
		adminBO.deleteSpeicificMenu(id);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 메뉴 디테일 업데이트
	 * @param id
	 * @param typeId
	 * @param specificType
	 * @param price
	 * @param requiredTime
	 * @return
	 */
	@PostMapping("/menu_update")
	public Map<String, Object> menuUpdate(
			@RequestParam("menuId") int id,
			@RequestParam("typeId") int typeId,
			@RequestParam("specificType") String specificType,
			@RequestParam("price") int price,
			@RequestParam("requiredTime") int requiredTime) {
		// db update
		adminBO.updateSpecificMenu(id, typeId, specificType, price, requiredTime);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 휴무 조회
	 * @return
	 */
	@PostMapping("/holiday/select")
	public List<CalendarVO> selectHolidayList() {
		return adminBO.getHolidayList();
	}
	
	/**
	 * 휴무 
	 * @param targetDate
	 * @return
	 */
	@PostMapping("/holiday/update")
	public Map<String, Object> holidayUpdate(@RequestParam("date") Date targetDate) {
		
		// db update
		adminBO.updateHoliday(targetDate);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 예약된 사람 클리시 자세한 정보
	 * @param id
	 * @return
	 */
	@PostMapping("/reservation_detail")
	public Map<String, Object> getReservationDetail(
			@RequestParam("reservationId") int id) {
		ReservationDetail reservationDetail = adminBO.getReservationDetailById(id);
		
		Map<String, Object> result = new HashMap<>();
		result.put("reservationDetail", reservationDetail);
		return result;
	}
	
	/**
	 * 예약 상태 변경
	 * @param id
	 * @param status
	 * @param request
	 * @return
	 */
	@PostMapping("/reservation_update") 
	public Map<String, Object> updateReservation(
			@RequestParam("reservationId") int id,
			@RequestParam("status") String status,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		
		adminBO.updateReservationStatus(id, name, status);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
}
