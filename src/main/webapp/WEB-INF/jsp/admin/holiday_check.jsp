<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" id="calendar"></div>

<script>
	$(document).ready(function() {
		
		
		var calendarEl = $('#calendar')[0];
		// full-calendar 생성하기
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: '700px', // calendar 높이 설정
			expandRows: true, // 화면에 맞게 높이 재설정
			initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			nowIndicator: true, // 현재 시간 마크
			locale: 'ko', // 한국어 설정
			selectable: true,
			eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
				console.log(obj);
			},
			eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
				console.log(obj);
			},
			eventSources: [{
				events: function(info, successCallback, failureCallback) {
					$.ajax({
						type: 'post'
						, url: '/admin/holiday/select'
						, success: function(data) {
							successCallback(data);
						}
						, error : function(e) {
							alert("휴무 로딩에 실패하였습니다.");
						}
					});
				}
			}],
			select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
				if (confirm('휴무로 지정 또는 해제하시겠습니까?')) {
					let event = calendar.getEventById(arg.startStr);
					console.log("arg.startStr : "+ arg.startStr)
					if(event == null) {
						calendar.addEvent({
							id: arg.startStr,
							title: '휴무',
							start: arg.start,
							end: arg.end,
							allDay: arg.allDay,
							display: 'background',
							backgroundColor: '#FE2E64'
						})
					} else {
						event.remove();
					}
				}
				calendar.unselect();
			}
		});
		// 캘린더 랜더링
		calendar.render();
	});
</script>
