<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="d-flex justify-content-center mt-5 mb-3">
	<div class="d-lg-flex justify-content-center" id="reservationBox">
		<div id="datePick" class="mx-2">
			<div id="dateTitle">
			<!-- datePicker로 변경해도 될것같음 -->
			<!-- 각 버튼들은 input이나 select로 변경하는게 나아보이기도함 -->
				<h1 class="text-center font-ELAND-NICE">날짜</h1>
			</div>
			<div id="date" class="font-nixgon">
				<c:forEach items="${dateList}" var="date">
				<button type="button" class="btn d-inline-block w-100 datePickBtn">${date}</button>
				</c:forEach>
			</div>
		</div>
		<div id="menuPick" class="mx-2">
			<div id="menuTitle">
				<h1 class="text-center font-ELAND-NICE">메뉴</h1>
			</div>
			<div class="d-flex justify-content-center font-nixgon">
				<div id="typePick">
					<c:forEach items="${typeList}" var="type">
						<button type="button" class="btn d-inline-block w-100">${type.type}</button>
					</c:forEach>
				</div>
				<div id="specificTypePick">
					<div>
						<c:forEach items="${menuList}" var="menu">
						<button type="button" class="btn d-inline-block w-100">${menu.specificType}</button>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div id="timePick" class="mx-2 overflow-auto">
			<div id="timeTitle">
				<h1 class="text-center font-ELAND-NICE">시간</h1>
			</div>
			<div class="font-nixgon" id="hourBox">
				<c:forEach items="${hourList}" var="hour">
				<div class="d-flex">
					<button type="button" class="btn d-inline-block w-50">${fn:split(hour, '/') [0]}</button>
					<button type="button" class="btn d-inline-block w-50">${fn:split(hour, '/') [1]}</button>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div id="reservationStatusBox" class="font-nixgon text-lg-center">
	<span id="dateSpan"></span>
	<span id="menuSpan"></span>
	<span id="timeSpan"></span>
</div>
<div class="d-flex justify-content-center mb-5">
	<button type="button" class="btn w-100 font-nixgon" id="reservateBtn">예약하기</button>
</div>

<script>
	$(document).ready(function() {
		$('.datePickBtn').on('click', function() {
			console.log($(this).text());
			$('#dateSpan').text($(this).text() + "일");
		});
	});

</script>