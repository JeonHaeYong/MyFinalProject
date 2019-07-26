<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="row m-3 ajaxRow">
			<div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                <div class="row menu-box">
                    <div class="col-12 s-menu">M E N U</div>
                    <div class="col-12 "><a name="s-menu" href="freeMarket">무료나눔<c:if test="${type == 4}"><br>관리자모드</c:if></a></div>
                </div>
            </div>
<!--             <div class="col-1"></div> -->
            <div class="col-lg-10 col-md-9 col-12 d-flex justify-content-center mb-4">
				<div class="row cardBox">
					<c:if test="${itemList.size() == 0 }">
						<div class="col-12 m-3"><h3>등록된 상품이 없습니다.</h3></div> 
					</c:if>
					<c:if test="${sessionScope.type == 4 }">
						<div class="col-12 custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="allCheck" name="items" value="${dto.cart_seq }">
							<label class="custom-control-label" for="allCheck">전체선택</label>
						</div>
					</c:if>
					<c:forEach var="dto" items="${itemList }">
						<div class="col-lg-4 col-md-6 col-12 p-0">
							<c:if test="${sessionScope.type == 4 }">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input itemCheck" id="customCheck${status.count }" name="items" value="${dto.cart_seq }">
									<label class="custom-control-label" for="customCheck${status.count }"></label>
								</div>
							</c:if>
							<div class="card myCard mb-3">
								<img class="card-img-top cardImg" src="${dto.imagePath1 }" alt="Card image" soldout="${dto.soldout }">
								<div class="card-body">
									<div class="itemName text-wrap text-truncate">
										<h4 class="card-title"><a href="item?currentPage=${pageNavi.currentPage }&category=${category }&seq=${dto.seq }" class="detail">
											<c:if test="${dto.soldout == 'y' }">[판매완료] </c:if>${dto.name }
										</a></h4>
									</div>
									<div style="height: 42px;">
										<p class="badge badge-pill categoryBadge" category="${dto.category }"></p>
										<p class="card-text price">${dto.price } 원</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row mb-3 ajaxRow">
			<div class="col-2"></div>
			<div class="col-10 d-flex justify-content-center" id="naviBox">
				<c:if test="${pageNavi.needPrev == 1 }">
					<a class="btn navi" href="#conta" value="${pageNavi.startNavi - 1}">&laquo;</a>
				</c:if>
				<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
					<a class="btn navi" href="#conta" value="${pageNavi.currentPage - 1}">&lt;</a>
				</c:if>
				<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
					<a class="btn navi" href="#conta" class="pageNum" value="${i }">${i}</a>
				</c:forEach>
				<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
					<a class="btn navi" href="#conta" value="${pageNavi.currentPage + 1}">&gt;</a>
				</c:if>
				<c:if test="${pageNavi.needNext == 1 }">
					<a class="btn navi" href="#conta" value="${pageNavi.endNavi + 1}">&raquo;</a>
				</c:if>
			</div>
		</div>