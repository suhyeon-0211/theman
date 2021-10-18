package com.theman.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theman.admin.bo.AdminBO;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private AdminBO adminBO;
	
	@RequestMapping("/sign_in_view")
	public String signInView() {
		return "template/layout_admin_sign_in";
	}
	
	@RequestMapping("/reservation_check_view")
	public String reservationCheckView(Model model) {
		model.addAttribute("viewName", "admin/reservation_check");
		return "template/layout_admin";
	}
	
	@RequestMapping("/holiday_check_view")
	public String holidayCheckView(Model model) {
		model.addAttribute("viewName", "admin/holiday_check");
		return "template/layout_admin";
	}
	
	@RequestMapping("/menu_update_view")
	public String menuUpdateView(Model model) {
		List<String> menuTypeList = adminBO.getMenuType();
		
		model.addAttribute("menuTypeList", menuTypeList);
		model.addAttribute("viewName", "admin/menu_update");
		return "template/layout_admin";
	}
}
