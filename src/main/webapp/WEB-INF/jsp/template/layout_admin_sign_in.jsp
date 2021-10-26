<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
    <!-- AJAX를 사용하기 위해 slim 아닌 풀버전의 jquery로 교체 -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/static/css/layout_admin_style.css" style="text/css">
</head>
<body>
	<div>
		<section class="contents_1">
			<div class="d-flex justify-content-between align-items-center mt-3 mx-lg-5">
				<div id="logo">
					<a href="/info">
						<img src="/static/images/더맨-로고-131313.svg" alt="logo">
					</a>
				</div>
				<nav id="navMenu" class="font-nixgon" >
					<ul class="nav d-flex justify-content-center">
						<li class="nav-item"><a class="nav-link text-dark" href="/info">Info</a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="/menu">Menu</a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="/reservation">Reservation</a></li>
					</ul>
				</nav>
				<div id="sign">
					<a href="/admin/sign_in_view" class="text-dark font-nixgon">로그인</a>
				</div>
			</div>

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
							, url: '/admin/sign_in'
							, data: {'loginId' : loginId, 'password' : password}
							, success : function(data) {
								if(data.result == "success") {
									location.href="/admin/reservation_check_view";
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
		</section>
	</div>
</body>
</html>