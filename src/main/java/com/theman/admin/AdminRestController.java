package com.theman.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.theman.admin.bo.AdminBO;

@RequestMapping("/admin")
@RestController
public class AdminRestController {

	@Autowired
	private AdminBO adminBO;
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		if(adminBO.isCorrectIdAndPassword(loginId, password)) {
			result.put("result", "success");
		}
		
		return result;
	}
}
