<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				type: 'post'
				, url: '/reservation/check'
				, data: {
					'phoneNumber' : phoneNumber
					, 'reservationPassword' : reservationPassword
				}
				, success : function(data) {
					if (data.result == 'success') {
						location.href="/reservation/check_view";
					} else {
						alert("예약 정보가 없습니다.");
					}
				}
				, error : function(e) {
					alert("예약확인에 실패했습니다. 관리자에게 문의해주세요");
				}
			});
		});
	});
</script>