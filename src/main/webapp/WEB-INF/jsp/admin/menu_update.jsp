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
				    <option selected>Choose...</option>
			  		<c:forEach items="${menuTypeList}" var="menuType">
			  		<option>${menuType}</option>
        			</c:forEach>
			  	</select>
			  	<button class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#typeControlModal" id="updateBtn">수정</button>
			</div>
			<div class="input-group type-change-box">
				<label class="input-group-text">구체적인 내용</label>
				<input type="text" class="form-control">
			</div>
			<div class="input-group type-change-box">
				<label class="input-group-text">가격</label>
				<input type="text" class="form-control">
			</div>
			<div class="input-group type-change-box">
				<label class="input-group-text">걸리는 시간(분)</label>
				<input type="text" class="form-control">
			</div>
			<button type="button" class="btn btn-success w-100">저장</button>
		</div>
	</div>
</div>

<!-- Modal -->
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
      	<c:forEach items="${menuTypeList}" var="menuType">
      	<div class="input-group">
	        <input type="text" class="form-control" value="${menuType}">
	        <button type="button" class="btn btn-danger modal-del-btn">삭제</button>
       	</div>
        </c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="exitModal">닫기</button>
        <button type="button" class="btn btn-primary" id="modalSaveBtn">저장</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function() {
		
		$('#exitModal').on('click', function() {
			location.reload(true);
		});
		
		$('#modalAddBtn').on('click', function() {
			$('.modal-body').append('<div class="input-group"><input type="text" class="form-control"><button type="button" class="btn btn-danger modal-del-btn">삭제</button></div>');
			
		});
			$('.modal-del-btn').on('click', function() {
				$(this).parent('div').remove();
			});
		
	});
</script>