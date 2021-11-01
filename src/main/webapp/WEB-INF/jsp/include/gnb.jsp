<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-between align-items-center mt-3 mx-lg-5">
	<div id="logo">
		<a href="/info">
			<img src="/static/images/더맨-로고-131313.svg" alt="logo">
		</a>
	</div>
	<nav id="navMenu" class="font-nixgon" >
		<ul class="nav d-flex justify-content-center">
			<li class="nav-item"><a class="nav-link text-dark" href="/info">Info</a></li>
			<li class="nav-item"><a class="nav-link text-dark" href="/menu">Menu</a></li>
			<li class="nav-item"><a class="nav-link text-dark" href="/reservation">Reservation</a></li>
			<li class="nav-item"><a class="nav-link text-dark" href="/reservation/check_view">Reservation Check</a></li>
		</ul>
	</nav>
	<div id="sign">
		<c:if test="${not empty name}">
			<span class="font-nixgon">${name}님 환영합니다.</span>
			<a href="/user/sign_out" class="text-dark font-nixgon">로그아웃</a>
			<c:if test="${name eq 'admin' }">
			<a href="/admin/reservation_check_view" class="text-dark font-nixgon">관리화면으로</a>
			</c:if>
		</c:if>
		<c:if test="${empty name}">
			<a href="/user/sign_in_view" class="text-dark font-nixgon">로그인</a>
		</c:if>
	</div>
</div>