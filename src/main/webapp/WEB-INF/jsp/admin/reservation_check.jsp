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
		$('#datepicker').datepicker({
			showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
			//buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 
			buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. 
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
			nextText: '다음 달', // next 아이콘의 툴팁. 
			prevText: '이전 달', // prev 아이콘의 툴팁. 
			numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			yearRange: 'c-10:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. 
			showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
			currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널 
			closeText: '닫기', // 닫기 버튼 패널 
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식. 
			showAnim: "slide", //애니메이션을 적용한다. 
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일의 한글 형식. 
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식. 
		});
		
		$('#datepicker').on('change', function() {
			let date = $(this).val();
		
		})
	});
</script>