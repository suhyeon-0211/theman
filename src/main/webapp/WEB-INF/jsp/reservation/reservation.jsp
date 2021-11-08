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
					<c:if test="${!fn:contains(date, '화')}">
					<button type="button" class="btn d-inline-block w-100 datePickBtn font-weight-bold">${date}</button>
					</c:if>
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
						<button type="button" class="btn d-inline-block w-100 typeBtn font-weight-bold">${type.type}</button>
					</c:forEach>
				</div>
				<div id="specificTypePick">
					<c:forEach items="${typeList}" var="type">
						<div id="${type.type}" class="d-none">
							<c:forEach items="${menuList}" var="menu">
								<c:if test="${menu.type eq type.type}">
									<button type="button" class="btn d-inline-block w-100 specificTypeBtn font-weight-bold" data-type-name="${type.type}" data-menu-id="${menu.id}" data-menu-required-time="${menu.requiredTime}">${menu.specificType} - ${menu.requiredTime}분</button>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>				
				</div>
			</div>
		</div>
		<div id="timePick" class="mx-2 overflow-auto">
			<div id="timeTitle">
				<h1 class="text-center font-ELAND-NICE">시간</h1>
			</div>
			<div class="font-nixgon" id="hourBox">
				<c:forEach items="${hourList}" var="hour">
					<%-- <c:if test="${not empty reservationCheckListByDate}">
						<c:forEach items="${reservationCheckListByDate}" var="reservationCheck">
							<fmt:formatDate value="${reservationCheck.reservation.reservationDateTime}" pattern="HH:mm" var="date"/>
							<c:if test="${date eq fn:split(hour, '/') [0]}"></c:if>
						</c:forEach>
					</c:if> --%>
					<c:if test="${empty reservationCheckListByDate}">
						<div class="d-flex">
							<button type="button" class="btn d-inline-block w-50 timeBtn font-weight-bold" data-button-status="first">${fn:split(hour, '/') [0]}</button>
							<button type="button" class="btn d-inline-block w-50 timeBtn font-weight-bold" data-button-status="second">${fn:split(hour, '/') [1]}</button>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div id="reservationStatusBox" class="font-nixgon text-center d-flex flex-column flex-lg-row justify-content-lg-center">
	<div id="dateSpan"></div>
	<div id="menuSpan" class="mx-lg-3"></div>
	<div id="timeSpan"></div>
	<!-- <span id="dateSpan"></span>
	<span id="menuSpan"></span>
	<span id="timeSpan"></span> -->
</div>
<div class="d-flex justify-content-center mb-5">
	<button type="button" class="btn w-100 font-nixgon" id="reservateBtn">예약하기</button>
</div>

<script>
	$(document).ready(function() {
		$('.datePickBtn').on('click', function() {
			// 선택된 날짜, 메뉴, 시간의 배경색 초기화
			$('#datePick').find('button').removeAttr('style');
		    $('#menuPick').find('button').removeAttr('style');
			$('#timePick').find('button').removeAttr('style');
			$('#timePick').find('button').removeAttr('disabled');
			// 클릭시 현재 선택된 요소 배경색 변경
			$(this).css({'background-color' : '#f2e8d5'})
			// 선택된 요소의 값을 아래 요약에 표시 + 메뉴와 시간 초기화
			let date = $(this).text();
			$('#dateSpan').text(date);
			$('#menuSpan').text('');
			$('#timeSpan').text('');
			$.ajax({
				type : 'post'
				, url : '/reservation/status'
				, data : {'date' : date}
				, success : function(data) {
					if (data.result != '') {
						for (let reservationResult of data.result) {
							for (let i = 0; i < 20; i++) {
								if ($('#timePick button:eq('+ i + ')').text() == reservationResult.time) {
									let index = 0;
									for (let j = 0; j < reservationResult.requiredTime; j+=30) {
										$('#timePick button:eq('+ (i + index) + ')').attr('disabled', 'disabled');
										index++;
									}
								}
							}
						}
					}
					$('#timePick').find('button[disabled!=disabled]').css({'background-color': 'white'});
				}
				, error : function(e) {
					alert('관리자에게 문의해주세요');
				}
			});
		});
		
		$('.typeBtn').on('click', function() {
			//선택된 메뉴, 시간 배경색 초기화
			$('#menuPick').find('button').removeAttr('style');
			$('#timePick').find('button').removeAttr('style');
			// 현재 선택된 요소의 배경색 변경
			$(this).css({'background-color' : '#f2e8d5'})
			let type = $(this).text();
			console.log(type);
			$('#' + type).siblings('div').addClass('d-none');
			$('#' + type).removeClass('d-none');
		});
		
		$('.specificTypeBtn').on('click', function() {
			//선택된 메뉴, 시간 배경색 초기화
			$('#specificTypePick').find('button').removeAttr('style');
			$('#timePick').find('button').removeAttr('style');
			// 현재 선택된 요소의 배경색 변경
			$(this).css({'background-color' : '#f2e8d5'})
			let typeName = $(this).data('type-name');
			let menuId = $(this).data('menu-id');
			$('#reservateBtn').data('menu-id', menuId);
			$('#menuSpan').text(typeName + '( ' + $(this).text() + ' )');
			$('#hourBox').data('menu-required-time', $(this).data('menu-required-time'));
			//$('#hourBox').find('button').css({'background-color': 'white'})
		});
		
		$('.timeBtn').on('click', function() {
			//$('#hourBox').find('button').css({'background-color': 'transparent'})
			$('#timePick').find('button').removeAttr('style');
			let menuSpan = $('#menuSpan').text().trim();
			if (menuSpan == '') {
				alert("상세메뉴부터 선택해주세요");
				return;
			}
			let requiredTime = $('#hourBox').data('menu-required-time');
			let timeStack = new Array();
			let target = $(this);
			let index = 0;
			for (let i = 0; i < requiredTime; i+=30) {
				timeStack[index++] = target.text();
				if (target.attr('disabled') == 'disabled') {
					alert("선택할 수 없는 시간대 입니다. 비어있는 시간대를 선택해주세요");
					$('#timePick').find('button').removeAttr('style');
					return;
				}
				target.css({'background-color' : '#f2e8d5'});
				if (target.data('button-status') == 'second') {
					target = target.parent().next().children('button:eq(0)');
				} else {
					target = target.next();
				}
			}
			timeStack[index] = target.text();
			$('#timeSpan').text(timeStack[0] + "분 ~ " + timeStack[timeStack.length-1] + "분");
			
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
			time = time.substring(0,5);
			date = date.substring(0,10);
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