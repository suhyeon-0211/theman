package com.theman.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theman.menu.bo.MenuBO;

@Controller
public class MenuController {

	@Autowired
	private MenuBO menuBO;
	
	@RequestMapping("/menu")
	public String menu(Model model) {
		model.addAttribute("viewName", "menu/menu");
		return "template/layout";
	}
}
