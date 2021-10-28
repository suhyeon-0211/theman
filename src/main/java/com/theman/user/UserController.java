package com.theman.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/sign_in_view")
	public String userSignInView(Model model) {
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout_sign";
	}
	
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("name");
		session.removeAttribute("phoneNumber");
		session.removeAttribute("reservationPassword");
		return "redirect:/info";
	}
}
