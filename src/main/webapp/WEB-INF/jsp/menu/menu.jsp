<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="menu" class="d-flex justify-content-center my-5">
	<div id="specificMenu">
		<h3>MENU</h3>
		<div class="d-lg-flex text-center justify-content-between border border-4 border-dark" id="specificMenus">
			<c:forEach items="${menuTypeList}" var="menuType">
				<hr id="mobileOnlyHr">
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
					</div>
					</c:if>
				</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</div>