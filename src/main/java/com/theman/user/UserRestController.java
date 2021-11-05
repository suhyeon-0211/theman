package com.theman.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.theman.admin.bo.AdminBO;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private AdminBO adminBO;
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		if(adminBO.isCorrectIdAndPassword(loginId, password)) {
			result.put("result", "success");
			session.setAttribute("name", "admin");
			session.setAttribute("phoneNumber", "0000");
		}
		
		return result;
	}
}
