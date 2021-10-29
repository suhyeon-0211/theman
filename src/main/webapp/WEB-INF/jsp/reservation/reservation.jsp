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
						<button type="button" class="btn d-inline-block w-100 typeBtn">${type.type}</button>
					</c:forEach>
				</div>
				<div id="specificTypePick">
					<c:forEach items="${typeList}" var="type">
						<div id="${type.type}" class="d-none">
							<c:forEach items="${menuList}" var="menu">
								<c:if test="${menu.type eq type.type}">
									<button type="button" class="btn d-inline-block w-100 specificTypeBtn" data-type-name="${type.type}" data-menu-id="${menu.id}">${menu.specificType}</button>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>				
					<%-- <div>
						<c:forEach items="${menuList}" var="menu">
						<button type="button" class="btn d-inline-block w-100">${menu.specificType}</button>
						</c:forEach>
					</div> --%>
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
					<button type="button" class="btn d-inline-block w-50 timeBtn">${fn:split(hour, '/') [0]}</button>
					<button type="button" class="btn d-inline-block w-50 timeBtn">${fn:split(hour, '/') [1]}</button>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div id="reservationStatusBox" class="font-nixgon text-center">
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
		
		$('.typeBtn').on('click', function() {
			let type = $(this).text();
			console.log(type);
			$('#' + type).siblings('div').addClass('d-none');
			$('#' + type).removeClass('d-none');
		});
		
		$('.specificTypeBtn').on('click', function() {
			let typeName = $(this).data('type-name');
			let menuId = $(this).data('menu-id');
			$('#reservateBtn').data('menu-id', menuId);
			$('#menuSpan').text(typeName + ' - ' + $(this).text());
		});
		
		$('.timeBtn').on('click', function() {
			$('#timeSpan').text($(this).text() + "분");
		});
		
		$('#reservateBtn').on('click', function() {
			let date = $('#dateSpan').text();
			if (date == '') {
				alert("날짜를 선택해주세요");
				return;
			}
			let menu = $('#menuSpan').text();
			if (menu == '') {
				alert("메뉴를 선택해주세요");
				return;
			}
			let time = $('#timeSpan').text();
			if (time == '') {
				alert("시간을 선택해주세요");
				return;
			}
			
			let menuId = $(this).data('menu-id');
			console.log(menuId);
						
			$.ajax({
				type: 'post'
				, url: '/reservation/create'
				, data: {
					'date' : date
					, 'menuId' : menuId
					, 'time' : time
				}
				, success : function(data) {
					if (data.result == 'success') {
						alert("예약이 완료되었습니다.");
						location.href = "/reservation/check_view";
					} else {
						alert("예약이 완료되지 않았습니다. 다시 시도해주세요");
					}
				}
				, error : function(e) {
					alert('예약이 완료되지 않았습니다. 관리자에게 문의해주세요');
				}
			});
			
		});
	});

</script>