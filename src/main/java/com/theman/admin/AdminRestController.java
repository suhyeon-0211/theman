package com.theman.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.theman.admin.bo.AdminBO;
import com.theman.admin.model.CalendarVO;

@RequestMapping("/admin")
@RestController
public class AdminRestController {

	@Autowired
	private AdminBO adminBO;
	
	@PostMapping("/menu_type_update")
	public Map<String, Object> menuTypeUpdate(
			@RequestParam("menuList[]") List<String> menuList) {
		
		// db update
		adminBO.updateMenuType(menuList);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
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
	
	@PostMapping("/menu_delete")
	public Map<String, Object> menuDelete(
			@RequestParam("menuId") int id) {
		// db delete
		adminBO.deleteSpeicificMenu(id);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
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
	
	@PostMapping("/holiday/select")
	public List<CalendarVO> selectHolidayList() {
		return adminBO.getHolidayList();
	}
	
	@PostMapping("/holiday/update")
	public Map<String, Object> holidayUpdate(@RequestParam("date") Date targetDate) {
		
		// db update
		adminBO.updateHoliday(targetDate);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
}
