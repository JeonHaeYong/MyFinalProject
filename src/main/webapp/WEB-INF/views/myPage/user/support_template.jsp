<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row donation_List">
	<c:forEach var="dto" items="${dpList }">
		<div class="col-12 row mt-2 mb-1">
			<div class="col-4 text-truncate">${dto.donation_name }</div>
			<div class="col-2 text-truncate">${dto.donation }원</div>
			<div class="col-4 text-truncate">${dto.donated_time }</div>
			<div class="col-2 text-truncate">${dto.donate_type }</div>
		</div>
	</c:forEach>
</div>
<div class="row mt-3">
	<div class="col-12 d-flex justify-content-center" id="naviBox">
		<c:if test="${pageNavi.needPrev == 1 }">
			<a class="btn navi" href="toMyPage_support?currentPage=${pageNavi.startNavi - 1}">&laquo;</a>
		</c:if>
		<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
			<a class="btn navi" href="toMyPage_support?currentPage=${pageNavi.currentPage - 1}">&lt;</a>
		</c:if>
		<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
			<a class="btn navi" href="toMyPage_support?currentPage=${i }" class="pageNum">${i}</a>
		</c:forEach>
		<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
			<a class="btn navi" href="toMyPage_support?currentPage=${pageNavi.currentPage + 1}">&gt;</a>
		</c:if>
		<c:if test="${pageNavi.needNext == 1 }">
			<a class="btn navi" href="toMyPage_support?currentPage=${pageNavi.endNavi + 1}">&raquo;</a>
		</c:if>
	</div>
</div>