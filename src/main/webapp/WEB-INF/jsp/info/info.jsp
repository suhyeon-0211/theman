<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="centerLogo" class="d-flex align-items-center justify-content-center">
	<div>
		<div id="themanLogo">
			<img alt="centerLogo" src="/static/images/theman-04.svg">
		</div>
		<div id="reservation" class="d-flex justify-content-center mt-3">
			<a href="/reservation" id="toReservation" class="btn text-light font-ELAND-NICE mr-2">예약하기</a>
			<a href="/reservation/check_view" id="toReservationCheckView" class="btn text-light font-ELAND-NICE ml-2">예약확인</a>
		</div>
	</div>
</div>
<%-- <div id="introduce">
	<div id="smallLogo" class="d-flex justify-content-center">
		<img alt="smallLogo" src="/static/images/더맨-로고-8c623e.svg" class="mt-4">
	</div>
	<div id="text" class="d-flex justify-content-center">
		<small>남성 컷트를 전문으로 하는 더맨 남성컷 입니다.</small>
	</div>
	
	<div id="images" class="justify-content-center flex-column flex-lg-row">
		<img src="" alt="storeImage">
		<img src="" alt="storeImage">
		<img src="" alt="storeImage">
	</div>
	
</div> --%>
<jsp:include page="../menu/menu.jsp"></jsp:include>
<div id="reservationStatus" class="text-center py-5">
	<h1>주간 예약 현황</h1>
	<small>예약 불가는 붉은 글씨로 표시됩니다.</small>
	<div class="justify-content-center d-lg-flex font-weight-bold">
			<div class="status-margin">
				<h3 class="weekday-font">월</h3>
				<div class="weekday p-3" id="0">
					<span class="sharp-time">10:00</span>
					<span>10:30</span><br>
					<span class="sharp-time">11:00</span>
					<span>11:30</span><br>
					<span class="sharp-time">12:00</span>
					<span>12:30</span><br>
					<span class="sharp-time">13:00</span>
					<span>13:30</span><br>
					<span class="sharp-time">14:00</span>
					<span>14:30</span><br>
					<span class="sharp-time">15:00</span>
					<span>15:30</span><br>
					<span class="sharp-time">16:00</span>
					<span>16:30</span><br>
					<span class="sharp-time">17:00</span>
					<span>17:30</span><br>
					<span class="sharp-time">18:00</span>
					<span>18:30</span><br>
					<span class="sharp-time">19:00</span>
					<span>19:30</span><br>
				</div>
			</div>
			<div class="status-margin">
				<h3 class="weekday-font">수</h3>
				<div class="weekday p-3 wednesday" id="2">
					<span class="sharp-time">10:00</span>
					<span>10:30</span><br>
					<span class="sharp-time">11:00</span>
					<span>11:30</span><br>
					<span class="sharp-time">12:00</span>
					<span>12:30</span><br>
					<span class="sharp-time">13:00</span>
					<span>13:30</span><br>
					<span class="sharp-time">14:00</span>
					<span>14:30</span><br>
					<span class="sharp-time">15:00</span>
					<span>15:30</span><br>
					<span class="sharp-time">16:00</span>
					<span>16:30</span><br>
					<span class="sharp-time">17:00</span>
					<span>17:30</span><br>
					<span class="sharp-time">18:00</span>
					<span>18:30</span><br>
					<span class="sharp-time">19:00</span>
					<span>19:30</span><br>
				</div>
			</div>
			<div class="status-margin">
				<h3 class="weekday-font">목</h3>
				<div class="weekday p-3 thursday" id="3">
					<span class="sharp-time">10:00</span>
					<span>10:30</span><br>
					<span class="sharp-time">11:00</span>
					<span>11:30</span><br>
					<span class="sharp-time">12:00</span>
					<span>12:30</span><br>
					<span class="sharp-time">13:00</span>
					<span>13:30</span><br>
					<span class="sharp-time">14:00</span>
					<span>14:30</span><br>
					<span class="sharp-time">15:00</span>
					<span>15:30</span><br>
					<span class="sharp-time">16:00</span>
					<span>16:30</span><br>
					<span class="sharp-time">17:00</span>
					<span>17:30</span><br>
					<span class="sharp-time">18:00</span>
					<span>18:30</span><br>
					<span class="sharp-time">19:00</span>
					<span>19:30</span><br>
				</div>
			</div>
			<div class="status-margin">
				<h3 class="weekday-font">금</h3>
				<div class="weekday p-3 friday" id="4">
					<span class="sharp-time">10:00</span>
					<span>10:30</span><br>
					<span class="sharp-time">11:00</span>
					<span>11:30</span><br>
					<span class="sharp-time">12:00</span>
					<span>12:30</span><br>
					<span class="sharp-time">13:00</span>
					<span>13:30</span><br>
					<span class="sharp-time">14:00</span>
					<span>14:30</span><br>
					<span class="sharp-time">15:00</span>
					<span>15:30</span><br>
					<span class="sharp-time">16:00</span>
					<span>16:30</span><br>
					<span class="sharp-time">17:00</span>
					<span>17:30</span><br>
					<span class="sharp-time">18:00</span>
					<span>18:30</span><br>
					<span class="sharp-time">19:00</span>
					<span>19:30</span><br>
				</div>
			</div>
			<div class="status-margin">
				<h3 class="holiday-font">토</h3>
				<div class="holiday p-3 saturday" id="5">
					<span class="sharp-time">10:00</span>
					<span>10:30</span><br>
					<span class="sharp-time">11:00</span>
					<span>11:30</span><br>
					<span class="sharp-time">12:00</span>
					<span>12:30</span><br>
					<span class="sharp-time">13:00</span>
					<span>13:30</span><br>
					<span class="sharp-time">14:00</span>
					<span>14:30</span><br>
					<span class="sharp-time">15:00</span>
					<span>15:30</span><br>
					<span class="sharp-time">16:00</span>
					<span>16:30</span><br>
					<span class="sharp-time">17:00</span>
					<span>17:30</span><br>
					<span class="sharp-time">18:00</span>
					<span>18:30</span><br>
					<span class="sharp-time">19:00</span>
					<span>19:30</span><br>
				</div>
			</div>
			<div class="status-margin">
				<h3 class="holiday-font">일</h3>
				<div class="holiday p-3 sunday" id="6">
					<span class="sharp-time">10:00</span>
					<span>10:30</span><br>
					<span class="sharp-time">11:00</span>
					<span>11:30</span><br>
					<span class="sharp-time">12:00</span>
					<span>12:30</span><br>
					<span class="sharp-time">13:00</span>
					<span>13:30</span><br>
					<span class="sharp-time">14:00</span>
					<span>14:30</span><br>
					<span class="sharp-time">15:00</span>
					<span>15:30</span><br>
					<span class="sharp-time">16:00</span>
					<span>16:30</span><br>
					<span class="sharp-time">17:00</span>
					<span>17:30</span><br>
					<span class="sharp-time">18:00</span>
					<span>18:30</span><br>
					<span class="sharp-time">19:00</span>
					<span>19:30</span><br>
				</div>
			</div>
		</div>
	<a href="/reservation" id="toReservation" class="btn text-white">예약하기</a>
</div>
<div id="direction" class="d-flex justify-content-center">
	<div class="d-lg-flex">
		<div id="map"></div>
		<div id="introductionOfStore" class="px-2 px-lg-0">
			<h1 class="font-ELAND-NICE text-center display-5">오시는 길</h1>
			<div class="font-nixgon introduction-margin">
				인천 계양구 효성동 21-47 단비교회 건녀편(미니스톱 건물)
			</div>
			<div class="font-nixgon introduction-margin">
				Tel. 070 7788 9068					
			</div>
			<div class="font-nixgon introduction-margin">
				<p>
					OPEN	10:00<br>
					CLOSE	20:00
				</p>
			</div>
			<div class="d-flex justify-content-center font-nixgon introduction-margin">
				<div id="wayToStore">
					<a href="https://map.kakao.com/link/to/더맨,37.5335599,126.715615" target="_blank">길찾기 &gt;</a>
				</div>
				<div id="mapView">
					<a href="https://map.kakao.com/link/map/더맨,37.5335599,126.715615" target="_blank">지도보기 &gt;</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$.ajax({
				type: 'get'
				, url: '/info/select'
				, success: function(data) {
					if (data.result != '') {
						console.log(data.reservationTimeStatus);
						for (let i = 0; i < 7; i++) {
							for (let reservationResult of data.reservationTimeStatus[i]) {
								for (let j = 0; j < 20; j++) {
									if ($('#' + i + ' span:eq('+ j + ')').text() == reservationResult.time) {
										console.log($('#' + i + ' span:eq('+ j + ')').text() + "first");
										let index = 0;
										for (let z = 0; z < reservationResult.requiredTime; z+=30) {
											console.log($('#' + i + ' span:eq('+ (j + index) + ')').text() + "second");
											$('#' + i + ' span:eq('+ (j + index) + ')').css('color', '#f26457');
											index++;
										}
									}
								}
							}
						}
					}
				}
				, error: function(e) {
					alert("로드 실패 관리자에게 문의해주세요");
				}
			});
		});
		// 지도 출력
		var mapContainer = document.getElementById('map');
		var options = {
				center : new kakao.maps.LatLng(37.5335599, 126.715615),
				level : 2
		};
		var map = new kakao.maps.Map(mapContainer, options);
		
		// 지도에 마커 표시
		var markerPosition = new kakao.maps.LatLng(37.5335599, 126.715615);
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		marker.setMap(map);
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
	</script>
</div>
			