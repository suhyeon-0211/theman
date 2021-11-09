package com.theman.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	//private Logger logger = LoggerFactory.getLogger(PermissionInterceptor.class);
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws IOException {
		logger.info("[### preHandle]" + request.getRequestURI());
		
		// 세션을 가져온다
		HttpSession session = request.getSession();
		String phoneNumber = (String) session.getAttribute("phoneNumber");
		
		// URL path를 가져온다.
		String uri = request.getRequestURI();
		
		if (phoneNumber == null && uri.equals("/reservation")) { 
			// 만약 로그인이 되어 있지않고 + /reservation/**=> /reservation/sign_in_view 쪽으로 보낸다. 
			response.sendRedirect("/reservation/sign_in_view"); 
			return false; 
		} else if (phoneNumber == null && uri.startsWith("/admin")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		} else if (phoneNumber == null && uri.startsWith("/reservation/check")) {
			response.sendRedirect("/reservation/check/sign_in_view");
			return false;
		}
		
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView modelAndView) {
		logger.warn("[### postHandle]" + request.getRequestURI());
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object Handler, Exception exception) {
		logger.error("[### afterCompletion]" + request.getRequestURI());
	}
}
