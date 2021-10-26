package com.theman.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {

	@RequestMapping("/reservation/sign_in_view")
	public String reservationSignInView(Model model) {
		model.addAttribute("viewName", "reservation/sign_in");
		return "template/layout";
	}
	
	@RequestMapping("/reservation")
	public String reservation(Model model) {
		model.addAttribute("viewName", "reservation/reservation");
		return "template/layout";
	}
	
	@RequestMapping("/reservation/check_view")
	public String reservationCheckView(Model model) {
		model.addAttribute("viewName", "reservation/check");
		return "template/layout";
	}
}
