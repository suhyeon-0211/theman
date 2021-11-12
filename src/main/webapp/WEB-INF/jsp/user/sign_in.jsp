<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center" id="signInInput">
	<div class="w-100 d-flex justify-content-center">
		<div class="w-50" id="inputBox">
			<div class="input-group" id="idBox">
				<input type="text" id="loginId" class="form-control" placeholder="아이디">
			</div>
			<div class="input-group" id="pwBox">
				<input type="password" id="password" class="form-control" placeholder="비밀번호">
			</div>
			<button type="button" class="btn w-100 mt-3" id="signInBtn">로그인</button>
			<button type="button" class="btn w-100 mt-3 d-none" id="signUpBtn">회원가입</button>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#signInBtn').on('click', function() {
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val().trim();
			if (loginId == '') {
				alert("아이디를 입력하세요");
				return;
			}
			if (password == '') {
				alert("비밀번호를 입력하세요");
				return;
			}
			
			$.ajax({
				type: 'post'
				, url: '/user/sign_in'
				, data: {'loginId' : loginId, 'password' : password}
				, success : function(data) {
					if(data.result == "success") {
						location.href="/info";
					} else {
						alert("아이디 또는 비밀번호를 다시 입력하세요");
					}
				}
				, error : function(e) {
					alert("로그인 실패 - 관리자에게 문의해주세요");
				}
			});
		});
	});
</script>