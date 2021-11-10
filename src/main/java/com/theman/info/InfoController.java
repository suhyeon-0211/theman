package com.theman.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theman.menu.bo.MenuBO;
import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;

@Controller
public class InfoController {

	@Autowired
	private MenuBO menuBO;
	
	/**
	 * 메인 info화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/info")
	public String info(Model model) {
		List<ServiceType> menuTypeList = menuBO.getType();
		List<Menu> menuList = menuBO.getMenu();
		
		model.addAttribute("menuTypeList", menuTypeList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("viewName", "info/info");
		return "template/layout";
	}
}
