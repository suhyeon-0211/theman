package com.theman.admin.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theman.menu.bo.MenuBO;

@Service
public class AdminBO {
	
	@Autowired
	private MenuBO menuBO;
	
	public boolean isCorrectIdAndPassword(String loginId, String password) {
		String standardId = "admin";
		String standardPassword = "admin";
		return (standardId.equals(loginId) && standardPassword.equals(password));
	}
	
	public List<String> getMenuType() {
		return menuBO.getType();
	}
	
	
}
