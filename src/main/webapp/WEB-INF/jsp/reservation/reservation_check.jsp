<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center my-3">
	<div class="w-100 text-center">
		<h1 class="font-ELAND-NICE">예약확인</h1>
		<c:forEach items="${reservationCheckList}" var="reservationCheck">
		<div class="d-flex justify-content-center" id="reservationCheckBox">
			<table class="table font-nixgon border">
				<tr>
					<th>이름</th>
					<td class="text-left">${reservationCheck.reservation.name}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td class="text-left">${reservationCheck.reservation.phoneNumber}</td>
				</tr>
				<tr>
					<th>예약메뉴</th>
					<td class="text-left">${reservationCheck.menu.type}(${reservationCheck.menu.specificType})</td>
				</tr>
				<tr>
					<th>예약일시</th>
					<td class="text-left"><fmt:formatDate value="${reservationCheck.reservation.reservationDateTime}" pattern="yyyy-MM-dd (EEE)"/>, <fmt:formatDate value="${reservationCheck.reservation.reservationDateTime}" pattern="HH:mm"/></td>
				</tr>
			</table>
		</div>
		<button type="button" class="btn w-50 reservation-cancel-btn mb-3">예약 취소</button>
		</c:forEach>
		<div class="font-nixgon text-danger my-3 font-weight-bold">
			예약 취소는 예약일 하루 전까지 가능합니다.
		</div>
	</div>
</div>