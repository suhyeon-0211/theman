package com.theman.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {

	@RequestMapping("/info")
	public String info(Model model) {
		model.addAttribute("viewName", "info/info");
		return "template/layout";
	}
}
