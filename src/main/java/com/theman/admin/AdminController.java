package com.theman.admin;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.util.StringUtils;
import com.theman.admin.bo.AdminBO;
import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;
import com.theman.reservation.model.ReservationCheck;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private AdminBO adminBO;
	
	/**
	 * 관리자 예약확인 화면
	 * @param model
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/reservation_check_view")
	public String reservationCheckView(Model model,
			@RequestParam(value="date", required = false) String date) throws ParseException {
		if (!StringUtils.isNullOrEmpty(date)) {
			List<ReservationCheck> reservationCheckList = adminBO.getReservationCheckListByDate(date);
			model.addAttribute("reservationCheckList", reservationCheckList);
			model.addAttribute("pickDate", date);
		}
		model.addAttribute("viewName", "admin/reservation_check");
		return "template/layout_admin";
	}
	
	/**
	 * 관리자 휴무관리 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/holiday_check_view")
	public String holidayCheckView(Model model) {
		model.addAttribute("viewName", "admin/holiday_check");
		return "template/layout_admin";
	}
	
	/**
	 * 관리자 메뉴관리 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/menu_update_view")
	public String menuUpdateView(Model model) {
		List<ServiceType> menuTypeList = adminBO.getMenuType();
		List<Menu> menuList = adminBO.getMenu();
		
		model.addAttribute("menuTypeList", menuTypeList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("viewName", "admin/menu_update");
		return "template/layout_admin";
	}
}
