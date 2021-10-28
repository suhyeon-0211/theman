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
		Integer userId = (Integer) session.getAttribute("userId");
		
		// URL path를 가져온다.
		String uri = request.getRequestURI();
		
		/*
		 * if (userId != null && uri.startsWith("/user")) { // 만약 로그인이 되어 있으면 + /user =>
		 * post쪽으로 보낸다. response.sendRedirect("/info"); return false; } else if (userId
		 * == null && uri.startsWith("/admin")) { // 만약 로그인이 안되어 있으면 + /post -> user쪽으로
		 * 보낸다. response.sendRedirect("/info"); return false; }
		 */
		
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
