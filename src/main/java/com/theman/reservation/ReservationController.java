package com.theman.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {

	@RequestMapping("/reservation")
	public String reservation(Model model) {
		model.addAttribute("viewName", "reservation/reservation");
		return "template/layout";
	}
}
