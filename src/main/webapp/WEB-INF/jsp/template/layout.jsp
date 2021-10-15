<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>더맨</title>
	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <!-- AJAX를 사용하기 위해 slim 아닌 풀버전의 jquery로 교체 -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/static/css/total_style.css" style="text/css">
</head>
<body>
	<div class="container-fluid">
		<header>
			<div class="d-flex justify-content-between align-items-center mt-3">
				<div id="logo">
					<img src="/static/images/filled-heart-icon.png" width="50">
				</div>
				<nav>
					<ul class="nav justify-content-center flex-column flex-lg-row">
						<li class="nav-item"><a class="nav-link" href="/info">Info</a></li>
						<li class="nav-item"><a class="nav-link" href="/menu">Menu</a></li>
						<li class="nav-item"><a class="nav-link" href="/reservation">Reservation</a></li>
					</ul>
				</nav>
				<div id="sign">
					<a href="#">로그인</a>			
				</div>
			</div>
		</header>
		<section class="contents"></section>
		<footer></footer>
	</div>
</body>
</html>