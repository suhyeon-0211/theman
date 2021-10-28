package com.theman.reservation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theman.menu.bo.MenuBO;
import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;

@Controller
public class ReservationController {

	@Autowired
	private MenuBO menuBO;
	
	@RequestMapping("/reservation/sign_in_view")
	public String reservationSignInView(Model model) {
		model.addAttribute("viewName", "reservation/reservation_sign_in");
		return "template/layout";
	}
	
	@RequestMapping("/reservation")
	public String reservation(Model model) {
		// 오늘부터 앞으로 10일까지의 날짜 리스트에 담는다.
		List<String> dateList = new ArrayList<>();
		List<String> hourList = new ArrayList<>();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		Calendar day = Calendar.getInstance();
		Calendar hour = Calendar.getInstance();
		hour.set(Calendar.HOUR, 550);
		hour.set(Calendar.MINUTE, 0);
		for (int i = 0; i < 10; i++) {
			dateList.add(sdf1.format(day.getTime()));
			day.add(Calendar.DATE, 1);
			String st1 = sdf2.format(hour.getTime());
			hour.add(Calendar.MINUTE, 30);
			String st2 = sdf2.format(hour.getTime());
			hourList.add(st1 + "/" + st2);
			hour.add(Calendar.MINUTE, 30);
		}
		
		// 메뉴 리스트 가져오기
		List<ServiceType> typeList = menuBO.getType();
		List<Menu> menuList = menuBO.getMenu();
		
		model.addAttribute("dateList", dateList);
		model.addAttribute("hourList", hourList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("typeList", typeList);
		model.addAttribute("viewName", "reservation/reservation");
		return "template/layout";
	}
	
	@RequestMapping("/reservation/check_view")
	public String reservationCheckView(Model model) {
		model.addAttribute("viewName", "reservation/reservation_check");
		return "template/layout";
	}
}
