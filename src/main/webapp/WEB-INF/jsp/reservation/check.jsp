<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center my-3">
	<div class="w-100 text-center">
		<h1 class="font-ELAND-NICE">예약확인</h1>
		<div class="d-flex justify-content-center" id="reservationCheckBox">
			<table class="table font-nixgon border">
				<tr>
					<th>이름</th>
					<td class="text-left">아무개</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td class="text-left">01012341234</td>
				</tr>
				<tr>
					<th>예약메뉴</th>
					<td class="text-left">컷트(기본)</td>
				</tr>
				<tr>
					<th>예약일시</th>
					<td class="text-left">2021-10-22(금), 11:30</td>
				</tr>
			</table>
		</div>
		<button type="button" class="btn w-50" id="reservationCancelBtn">예약 취소</button>
		<div class="font-nixgon text-danger my-3 font-weight-bold">
			예약 취소는 예약일 하루 전까지 가능합니다.
		</div>
	</div>
</div>