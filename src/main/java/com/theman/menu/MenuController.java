package com.theman.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theman.menu.bo.MenuBO;
import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;

@Controller
public class MenuController {

	@Autowired
	private MenuBO menuBO;
	
	@RequestMapping("/menu")
	public String menu(Model model) {
		List<ServiceType> menuTypeList = menuBO.getType();
		List<Menu> menuList = menuBO.getMenu();
		
		model.addAttribute("menuTypeList", menuTypeList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("viewName", "menu/menu");
		return "template/layout";
	}
}
