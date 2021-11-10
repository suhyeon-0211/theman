package com.theman.reservation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theman.holiday.bo.HolidayBO;
import com.theman.menu.bo.MenuBO;
import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;
import com.theman.reservation.bo.ReservationBO;
import com.theman.reservation.model.ReservationCheck;
import com.theman.reservation.model.ReservationDetail;

@Controller
public class ReservationController {

	@Autowired
	private MenuBO menuBO;
	
	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	private HolidayBO holidayBO;
	
	/**
	 * 예약화면 비회원 로그인
	 * @param model
	 * @return
	 */
	@RequestMapping("/reservation/sign_in_view")
	public String reservationSignInView(Model model) {
		model.addAttribute("viewName", "reservation/reservation_sign_in");
		return "template/layout";
	}
	
	/**
	 * 예약화면으로 이동 및 날짜 시간 리스트 뿌리기
	 * @param model
	 * @return
	 */
	@RequestMapping("/reservation")
	public String reservation(Model model) {
		// 오늘부터 앞으로 10일까지의 날짜 리스트에 담는다.
		List<String> dateList = new ArrayList<>();
		List<String> hourList = new ArrayList<>();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd (EEE)");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		Calendar day = Calendar.getInstance();
		Calendar hour = Calendar.getInstance();
		hour.set(Calendar.HOUR, 550);
		hour.set(Calendar.MINUTE, 0);
		for (int i = 0; i < 15; i++) {
			if (!holidayBO.existHolidayByCloseDate(day.getTime())) {
				dateList.add(sdf1.format(day.getTime()));
			}
			day.add(Calendar.DATE, 1);
		}
		for (int i = 0; i < 10; i++) {
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
	
	/**
	 * 예약확인 화면
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/reservation/check_view")
	public String reservationCheckView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String phoneNumber = (String) session.getAttribute("phoneNumber");
		String reservationPassword = (String) session.getAttribute("reservationPassword");
		
		List<ReservationCheck> reservationCheckList = reservationBO.getReservationCheckListByPhoneNumberAndReservationPassword(phoneNumber, reservationPassword);
		
		if (!CollectionUtils.isEmpty(reservationCheckList)) {
			session.setAttribute("name", reservationCheckList.get(0).getReservation().getName());		
		}
		
		List<ReservationDetail> reservationDetailList = new ArrayList<>();
		
		List<ReservationDetail> reservationDetailBeforeList = new ArrayList<>();
		
		Date today = new Date();
		
		for (ReservationCheck reservationCheck : reservationCheckList) {
			if (reservationCheck.getReservation().getReservationDateTime().after(today)) {
				reservationDetailList.add(reservationBO.getReservationDetailById(reservationCheck.getReservation().getId()));
			} else {
				reservationDetailBeforeList.add(reservationBO.getReservationDetailById(reservationCheck.getReservation().getId()));
			}
		}
		
		
		model.addAttribute("reservationDetailList", reservationDetailList);
		model.addAttribute("reservationDetailBeforeList", reservationDetailBeforeList);
		model.addAttribute("viewName", "reservation/reservation_check");
		return "template/layout";
	}
	
	/**
	 * 예약확인 화면 비회원 로그인
	 * @param model
	 * @return
	 */
	@RequestMapping("/reservation/check/sign_in_view")
	public String reservationCheckSignInView(Model model) {
		model.addAttribute("viewName", "reservation/reservation_check_sign_in");
		return "template/layout";
	}
	
}
