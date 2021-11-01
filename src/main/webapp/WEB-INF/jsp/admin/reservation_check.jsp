<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h1 class="text-center font-ELAND-NICE">메뉴</h1>
			</div>
			<div id="detail" class="font-nixgon">
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
				<button type="button" class="btn d-inline-block w-100">10월 24일</button>
			</div>
		</div>
	</div>
</div>

<div class="my-5">
	<h1 class="text-center font-ELAND-NICE">예약상세</h1>
	<div class="d-flex justify-content-center">
		<table class="table font-nixgon border text-center">
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
			<tr>
				<th>예약현황</th>
				<td class="text-left d-flex">
					<select class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
					<button type="button" class="btn">적용</button>
				</td>
			</tr>
		</table>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#datepicker').datepicker();
	});
</script>