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
		selectable: true, // 달력 일자 드래그 설정가능
		nowIndicator: true, // 현재 시간 마크
		dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		locale: 'ko', // 한국어 설정
		eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
		console.log(obj);
		},
		eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
		console.log(obj);
		},
		eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
		console.log(obj);
		},
		select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
		var title = prompt('Event Title:');
		if (title) {
		calendar.addEvent({
		title: title,
		start: arg.start,
		end: arg.end,
		allDay: arg.allDay
		})
		}
		calendar.unselect()
		}
		});
		// 캘린더 랜더링
		calendar.render();
	});
</script>
