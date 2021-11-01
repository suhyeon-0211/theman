<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="reservationSignIn" class="text-center d-flex justify-content-center my-5">
	<div class="content1">
		<h1 class="font-ELAND-NICE">예약</h1>
		<table class="table table-bordered font-nixgon">
			<tr>
				<th class="table-dark">이름</th>
				<td><input type="text" class="form-control" placeholder="이름을 입력해주세요" id="name"></td>
			</tr>
			<tr>
				<th class="table-dark">전화번호</th>
				<td><input type="text" class="form-control" placeholder="전화번호를 입력해주세요" id="phoneNumber"></td>
			</tr>
			<tr>
				<th class="table-dark">비밀번호</th>
				<td><input type="text" class="form-control" placeholder="숫자 4자리로 입력해주세요" id="reservationPassword"></td>
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
			<input type="text" class="form-control" id="checkPhoneNumber" placeholder="전화번호">
		</div>
		<div class="input-group font-nixgon my-2">
			<input type="text" class="form-control" id="checkPassword" placeholder="비밀번호">
		</div>
		<button type="button" class="font-nixgon btn w-100" id="reservationCheckBtn">로그인</button>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#reservationSignInBtn').on('click', function() {
			let name = $('#name').val().trim();
			if (name == '') {
				alert("이름을 입력해주세요");
				return;
			}
			let phoneNumber = $('#phoneNumber').val().trim();
			if (phoneNumber == '') {
				alert("전화번호를 입력해주세요");
				return;
			}
			if (isNaN(phoneNumber)) {
				alert("전화번호를 올바르게 입력해주세요");
				return;
			}
			let reservationPassword = $('#reservationPassword').val().trim();
			if (reservationPassword == '') {
				alert("예약 비밀번호를 입력해주세요");
				return;
			}
			if (isNaN(reservationPassword)) {
				alert("예약비밀번호를 올바르게 입력해주세요");
				return;
			}
			if (reservationPassword.toString().length != 4) {
				alert("예약비밀번호는 4자리입니다. 다시 입력해주세요");
				return;
			}
			
			$.ajax({
				type: "post"
				, url : '/reservation/sign_in'
				, data : {
					'name' : name
					, 'phoneNumber' : phoneNumber
					, 'reservationPassword' : reservationPassword
				}
				, success : function(data) {
					if (data.result == 'success') {
						location.href="/reservation";
					} else {
						alert("비회원 로그인에 실패했습니다. 다시 시도해주세요");
					}
				}
				, error : function(e) {
					alert("비회원 로그인에 실패했습니다. 관리자에게 문의해주세요");
				}
			});
		});
		
		$('#reservationCheckBtn').on('click', function() {
			let phoneNumber = $('#checkPhoneNumber').val().trim();
			if (phoneNumber == '') {
				alert("전화번호를 입력해주세요");
				return;
			}
			let reservationPassword = $("#checkPassword").val().trim();
			if (reservationPassword == '') {
				alert("예약 비밀번호를 입력해주세요");
				return;
			}
			
			$.ajax({
				type: "post"
				, url: '/reservation/check'
				, data: {
					'phoneNumber' : phoneNumber
					, 'reservationPassword' : reservationPassword
				}
				, success : function(data) {
					if (data.result == 'success') {
						location.href="/reservation/check_view";
					} else {
						alert("예약확인에 실패했습니다. 다시 시도해주세요");
					}
				}
				, error : function(e) {
					alert("예약확인에 실패했습니다. 관리자에게 문의해주세요");
				}
			});
		});
	});
</script>