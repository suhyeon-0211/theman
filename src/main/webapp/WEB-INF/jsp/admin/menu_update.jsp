<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="text-center">
	<h1 class="mb-4">메뉴 수정</h1>
	<div class="d-flex justify-content-center">
		<div id="menuChangeBox">
			<div class="input-group type-change-box">
			  	<label class="input-group-text" for="typeSelect">시술 타입</label>
			  	<select class="form-control" id="typeSelect">
				    <option selected value="0">Choose...</option>
			  		<c:forEach items="${menuTypeList}" var="menuType">
			  		<option value="${menuType.id}">${menuType.type}</option>
        			</c:forEach>
			  	</select>
			  	<button class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#typeControlModal" id="menuTypeUpdateBtn">수정</button>
			</div>
			<div class="input-group type-change-box">
				<label class="input-group-text">구체적인 내용</label>
				<input type="text" class="form-control" id="specificType">
			</div>
			<div class="input-group type-change-box">
				<label class="input-group-text">가격</label>
				<input type="text" class="form-control" id="price">
			</div>
			<div class="input-group type-change-box">
				<label class="input-group-text">걸리는 시간(분)</label>
				<input type="text" class="form-control" id="requiredTime">
			</div>
			<button type="button" class="btn btn-success w-100" id="saveBtn">저장</button>
		</div>
	</div>
</div>
<div id="menu" class="d-flex justify-content-center my-5">
	<div id="specificMenu">
		<h3>MENU</h3>
		<div class="d-lg-flex text-center justify-content-between border border-4 border-dark" id="specificMenus">
			<c:forEach items="${menuTypeList}" var="menuType">
				<div class="specific-menu">
					<h5>${menuType.type}</h5>
					<hr>
				<c:forEach items="${menuList}" var="menu">
					<c:if test="${menuType.type eq menu.type}">
					<div class="specific-menu-introduce">
						<span class="menu-type">${menu.type}</span>(
						<span class="menu-specific-type">${menu.specificType}</span>)
						-
						<span class="menu-price">${menu.price}</span><br>
						<span class="text-start menu-required-time">${menu.requiredTime}</span>분
						<button type="button" class="btn btn-warning ml-3 menu-update-btn" data-toggle="modal" data-target="#specificTypeControlModal" data-type-id="${menuType.id}" data-menu-id="${menu.id}">수정</button>
					</div>
					</c:if>
				</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- 메뉴 수정 Modal -->
<div class="modal fade" id="typeControlModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">시술 타입</h5>
      </div>
      <div class="modal-body">
      	<div class="d-flex justify-content-end">
      		<button type="button" class="btn btn-primary" id="modalAddBtn">추가</button>
      	</div>
      	<div id="menuTypeUpdateBox">
	      	<c:forEach items="${menuTypeList}" var="menuType">
	      	<div class="input-group">
		        <input type="text" class="form-control" value="${menuType.type}">
		        <button type="button" class="btn btn-danger modal-del-btn">삭제</button>
	       	</div>
	        </c:forEach>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="modalTypeSaveBtn">저장</button>
      </div>
    </div>
  </div>
</div>

<!-- 메뉴 수정 Modal -->
<div class="modal fade" id="specificTypeControlModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">메뉴 수정</h5>
      </div>
      <div class="modal-body">
      	<div class="input-group type-change-box">
		  	<label class="input-group-text" for="modalTypeSelect">시술 타입</label>
		  	<select class="form-control" id="modalTypeSelect">
		  		<c:forEach items="${menuTypeList}" var="menuType">
		  		<option value="${menuType.id}">${menuType.type}</option>
	    		</c:forEach>
		  	</select>
		</div>
		<div class="input-group type-change-box">
			<label class="input-group-text">구체적인 내용</label>
			<input type="text" class="form-control" name="specificType">
		</div>
		<div class="input-group type-change-box">
			<label class="input-group-text">가격</label>
			<input type="text" class="form-control" name="price">
		</div>
		<div class="input-group type-change-box">
			<label class="input-group-text">걸리는 시간(분)</label>
			<input type="text" class="form-control" name="requiredTime">
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="modalMenuDelBtn">삭제</button>
        <button type="button" class="btn btn-primary" id="modalMenuUpdateBtn">수정</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function() {
		// 모달을 종료했을때 페이지 새로고침
		$('#exitModal').on('click', function() {
			location.reload(true);
		});
		
		// 모달에 추가 버튼 눌렀을 시 input 추가
		$('#modalAddBtn').on('click', function() {
			$('#menuTypeUpdateBox').append('<div class="input-group"><input type="text" class="form-control"><button type="button" class="btn btn-danger modal-del-btn">삭제</button></div>');
		});
		
		// 모달에서 삭제버튼 클릭시 해당 열 삭제
		$(document).on('click', '.modal-del-btn', function() {
			$(this).parent('div').remove();
		});
		
		// 모달에서 저장버튼 클릭시 db저장
		$('#modalTypeSaveBtn').on('click', function() {
			let menuList = new Array();
			// 리스트에 값 추가
			$('#menuTypeUpdateBox input').each(function(index, item) {
				menuList.push($(item).val());
			});
			console.log(menuList);
			// 유효성 검사
			if (menuList.length <= 0) {
				alert('적어도 하나 이상은 추가해야합니다.');
				return;
			}
			for (var value of menuList) {
				if (value == '') {
					alert('내용을 입력하세요');
					return;
				}
			}
			
			let sendData = {'menuList' : menuList};
			console.log(sendData);
			
			$.ajax({
				type : 'post'
				, url : '/admin/menu_type_update'
				, data : sendData
				, success : function(data) {
					if (data.result == 'success') {
						location.reload(true);
					} else {
						alert('메뉴가 수정되지 않았습니다. 다시 시도해주세요');
					}
				}
				, error : function(e) {
					alert('메뉴가 수정되지 않습니다. 관리자에게 문의해주세요' + e);
				}
			});
		});
		
		// 저장버튼 클릭시 메뉴추가
		$('#saveBtn').on('click', function() {
			// 유효성 검사
			let typeId = $('#typeSelect option:selected').val();
			if (typeId == '0') {
				alert("시술타입을 선택해주세요");
				return;
			}
			let specificType = $('#specificType').val().trim();
			if (specificType == '') {
				alert('구체적인 타입을 입력해주세요');
				return;
			}
			
			let price = $('#price').val().trim();
			if (price == '') {
				alert('가격을 입력해주세요');
				return;
			}
			
			let requiredTime = $('#requiredTime').val().trim();
			if(requiredTime == '') {
				alert('걸리는 시간을 입력해주세요');
				return;
			}
			
			if (isNaN(typeId) || isNaN(price) || isNaN(requiredTime)) {
				alert("가격과 걸리는시간은 정수를 입력해야합니다.");
				return;
			}
			
			// ajax 통신
			$.ajax({
				type: 'post'
				, url: '/admin/menu_insert'
				, data: {
					'typeId' : typeId
					, 'specificType' : specificType
					, 'price' : price
					, 'requiredTime' : requiredTime
				}
				, success : function(data) {
					if (data.result == 'success') {
						alert("추가가 완료되었습니다.");
						location.reload(true);
					} else {
						alert("메뉴가 추가되지 않습니다. 다시 시도해주세요");
					}
				}
				, error : function(e) {
					alert("메뉴가 추가되지 않습니다. 관리자에게 문의해주세요");
				}
			});
		});
		
		$('.menu-update-btn').on('click', function() {
			let specificType = $(this).siblings('.menu-specific-type').text();
			let price = $(this).siblings('.menu-price').text();
			let requiredTime = $(this).siblings('.menu-required-time').text();
			let typeId = $(this).data('type-id');
			$('#modalTypeSelect').val(typeId).attr('selected', 'selected');
			$('input[name=specificType]').val(specificType);
			$('input[name=price]').val(price);
			$('input[name=requiredTime]').val(requiredTime);
			
			let menuId = $(this).data('menu-id');
			$('h5').data('menu-id', menuId);
		});
		
		$('#modalMenuDelBtn').on('click', function() {
			let menuId = $('h5').data('menu-id');
			
			$.ajax({
				type : 'post'
				, url : '/admin/menu_delete'
				, data : {'menuId' : menuId}
			, success : function(data) {
				if (data.result == 'success') {
					alert("삭제가 완료되었습니다.");
					location.reload(true);
				} else {
					alert("삭제가 완료되지 않았습니다. 다시 시도해주세요");
				}
			}
			, error : function(e) {
				alert("삭제되지 않습니다. 관리자에게 문의해주세요");
			}
			})
		});
		
		$('#modalMenuUpdateBtn').on('click', function() {
			let menuId = $('h5').data('menu-id');
			let typeId = $('#modalTypeSelect option:selected').val();
			let specificType = $('input[name=specificType]').val().trim();
			if (specificType == '') {
				alert('구체적인 타입을 입력해주세요');
				return;
			}
			
			let price = $('input[name=price]').val().trim();
			if (price == '') {
				alert('가격을 입력해주세요');
				return;
			}
			
			let requiredTime = $('input[name=requiredTime]').val().trim();
			if(requiredTime == '') {
				alert('걸리는 시간을 입력해주세요');
				return;
			}
			
			if (isNaN(typeId) || isNaN(price) || isNaN(requiredTime)) {
				alert("가격과 걸리는시간은 정수를 입력해야합니다.");
				return;
			}
			
			// ajax 통신
			$.ajax({
				type: 'post'
				, url: '/admin/menu_update'
				, data: {
					'menuId' : menuId
					,'typeId' : typeId
					, 'specificType' : specificType
					, 'price' : price
					, 'requiredTime' : requiredTime
				}
				, success : function(data) {
					if (data.result == 'success') {
						alert("수정이 완료되었습니다.");
						location.reload(true);
					} else {
						alert("메뉴가 수정되지 않습니다. 다시 시도해주세요");
					}
				}
				, error : function(e) {
					alert("메뉴가 수정되지 않습니다. 관리자에게 문의해주세요");
				}
			});
		})
	});
</script>