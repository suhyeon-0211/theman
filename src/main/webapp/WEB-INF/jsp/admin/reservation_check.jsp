<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-center" id="reservationCheckBox">
		<div id="datePick" class="mx-2">
			<div id="dateTitle">
			<!-- datePicker로 변경해도 될것같음 -->
			<!-- 각 버튼들은 input이나 select로 변경하는게 나아보이기도함 -->
				<h1 class="text-center font-ELAND-NICE">날짜</h1>
			</div>
			<div id="date" class="font-nixgon">
				<input type="text" class="form-control" id="datepicker">
			</div>
		</div>
		<div id="detailPick" class="mx-2">
			<div id="detailTitle">
				<h1 class="text-center font-ELAND-NICE">예약자 확인</h1>
			</div>
			<div id="detail" class="font-nixgon">
				<c:if test="${not empty reservationCheckList}">
				<c:forEach items="${reservationCheckList}" var="reservationCheck">
					<fmt:formatDate value="${reservationCheck.reservation.reservationDateTime}" pattern="HH:mm" var="date"/>
					<c:if test="${reservationCheck.reservation.status ne '예약완료'}">
						<button type="button" class="btn d-inline-block w-100 reservation-detail-btn" data-reservation-id="${reservationCheck.reservation.id}" style="background-color: gray;">${date} - ${reservationCheck.reservation.name}</button>
					</c:if>
					<c:if test="${reservationCheck.reservation.status eq '예약완료'}">
						<button type="button" class="btn d-inline-block w-100 reservation-detail-btn" data-reservation-id="${reservationCheck.reservation.id}">${date} - ${reservationCheck.reservation.name}</button>
					</c:if>
				</c:forEach>
				</c:if>
				<!-- <button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button> -->
			</div>
		</div>
	</div>
</div>

<div class="my-5">
	<h1 class="text-center font-ELAND-NICE">예약상세</h1>
	<div class="d-flex justify-content-center">
		<table class="table font-nixgon border text-center font-weight-bold">
			<tr>
				<th>이름</th>
				<td class="text-left" id="nameTb"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td class="text-left" id="phoneNumberTb"></td>
			</tr>
			<tr>
				<th>예약메뉴</th>
				<td class="text-left" id="reservationMenuTb"></td>
			</tr>
			<tr>
				<th>예약일시</th>
				<td class="text-left" id="reservationDateTimeTb"></td>
			</tr>
			<tr>
				<th>예약현황</th>
				<td class="text-left d-flex">
					<select class="form-control" id="reservationStatus">
						<option>예약완료</option>
						<option>예약취소</option>
						<option>보류</option>
						<option>노쇼</option>
						<option>완료</option>
					</select>
					<button type="button" class="btn" id="submitReservationStatusBtn">적용</button>
				</td>
			</tr>
		</table>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		$('#datepicker').datepicker({
			//showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
			//buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 
			//buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. 
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
			nextText: '다음 달', // next 아이콘의 툴팁. 
			prevText: '이전 달', // prev 아이콘의 툴팁. 
			numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			yearRange: 'c-10:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. 
			showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
			currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널 
			closeText: '닫기', // 닫기 버튼 패널 
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식. 
			showAnim: "slide", //애니메이션을 적용한다. 
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일의 한글 형식. 
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식. 
		});
		
		$('#datepicker').on('change', function() {
			let date = $(this).val();
			location.href="/admin/reservation_check_view?date="+date;
		});
		
		$('.reservation-detail-btn').on('click', function() {
			let reservationId = $(this).data('reservation-id');
			
			$.ajax({
				type: 'post'
				, url: '/admin/reservation_detail'
				, data: {'reservationId' : reservationId}
				, success: function(data) {
					$('#nameTb').text(data.reservationDetail.reservation.name);
					$('#phoneNumberTb').text(data.reservationDetail.reservation.phoneNumber);
					$('#reservationMenuTb').text(data.reservationDetail.menu.type + "(" + data.reservationDetail.menu.specificType + ")");
					$('#reservationDateTimeTb').text(data.reservationDetail.dateStr + ", " + data.reservationDetail.requiredTimeStr);
					$('#reservationStatus option').each(function() {
						if($(this).val() == data.reservationDetail.reservation.status) {
							$(this).prop('selected', true);
						}
					});
					$('#submitReservationStatusBtn').data('reservation-id', data.reservationDetail.reservation.id);
				}
				, error: function(e) {
					alert("다시 시도해주세요");
				}
			});
		});
		
		$('#submitReservationStatusBtn').on('click', function() {
			let reservationId = $(this).data('reservation-id');
			let status = $('#reservationStatus option:selected').val();
			alert(status);
			$.ajax({
				type: 'post'
				, url: '/admin/reservation_update'
				, data: {'reservationId' : reservationId, 'status' : status}
				, success : function(data) {
					if (data.result == 'success') {
						location.reload(true);
					} else {
						alert("다시 시도해주세요")
					}
				}
				, error : function(e) {
					alert("관리자에게 문의해주세요");
				}
			})
		});
	});
</script>