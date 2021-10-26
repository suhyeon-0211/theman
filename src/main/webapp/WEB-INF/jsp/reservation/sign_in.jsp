<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="reservationSignIn" class="text-center d-flex justify-content-center my-5">
	<div class="content1">
		<h1 class="font-ELAND-NICE">예약</h1>
		<table class="table table-bordered font-nixgon">
			<tr>
				<th class="table-dark">이름</th>
				<td><input type="text" class="form-control" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
				<th class="table-dark">전화번호</th>
				<td><input type="text" class="form-control" placeholder="전화번호를 입력해주세요"></td>
			</tr>
			<tr>
				<th class="table-dark">비밀번호</th>
				<td><input type="text" class="form-control" placeholder="숫자 4자리로 입력해주세요"></td>
			</tr>
		</table>
		<button type="button" class="font-nixgon btn btn-link text-dark w-100" id="reservationSignInBtn">확인</button>
	</div>
</div>
<hr id="reservationHr">
<div id="reservationCheck" class="d-flex justify-content-center text-center my-5">
	<div class="content2">
		<h1 class="font-ELAND-NICE">예약 확인</h1>
		<div class="input-group font-nixgon my-2">
			<input type="text" class="form-control" placeholder="전화번호">
		</div>
		<div class="input-group font-nixgon my-2">
			<input type="text" class="form-control" placeholder="비밀번호">
		</div>
		<button type="button" class="font-nixgon btn w-100" id="reservationCheckBtn">로그인</button>
	</div>
</div>