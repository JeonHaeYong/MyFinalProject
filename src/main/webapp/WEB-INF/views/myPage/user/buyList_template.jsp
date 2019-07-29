<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row buyList_contents ajaxRow">
	<c:if test="${buyList.size() == 0 }">
		<div class="col-12 row mt-2 mb-1">
			구매 내역이 없습니다.
		</div>
	</c:if>
	<c:forEach var="dto" items="${buyList }">
		<div class="col-12 row mt-2 mb-1">
			<div class="col-5 text-truncate"><a class="itemName" href="item?seq=${dto.item_seq }">${dto.item_name}</a></div>
			<div class="col-2 text-truncate">${dto.item_price }</div>
			<div class="col-3 text-truncate">${dto.pay_date }</div>
			<div class="col-2 text-truncate"><a class="sendMsg_btn" data-toggle="modal" data-target="#msg_modal" data-whatever="@mdo" href="javascript(0)">${dto.seller }</a></div>
		</div>
	</c:forEach>
</div>
<div class="row mt-3 ajaxRow">
	<div class="col-12 d-flex justify-content-center" id="naviBox">
		<c:if test="${pageNavi.needPrev == 1 }">
			<a class="btn navi mx-1" href="#goTop" value="${pageNavi.startNavi - 1}">&laquo;</a>
		</c:if>
		<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
			<a class="btn navi mx-1" href="#goTop" value="${pageNavi.currentPage - 1}">&lt;</a>
		</c:if>
		<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
			<a class="btn navi mx-1" href="#goTop" value="${i }" class="pageNum">${i}</a>
		</c:forEach>
		<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
			<a class="btn navi mx-1" href="#goTop" value="${pageNavi.currentPage + 1}">&gt;</a>
		</c:if>
		<c:if test="${pageNavi.needNext == 1 }">
			<a class="btn navi mx-1" href="#goTop" value="${pageNavi.endNavi + 1}">&raquo;</a>
		</c:if>
	</div>
</div>