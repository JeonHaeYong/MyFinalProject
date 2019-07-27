<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="overlayer"></div>
<div class="loader">
	<div class="spinner-border text-primary" role="status">
		<span class="sr-only">Loading...</span>
	</div>
</div>
<div class="site-wrap">
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-body"></div>
	</div>

	<header class="site-navbar js-sticky-header site-navbar-target"
		role="banner" style="height: 71px; z-index: 1000;">
		<div class="container top_menu_container">
			<div class="row  align-items-center">
				<div id="site_logo_col" class="col-6 col-xl-2">
					<h1 class="mb-0 site-logo">
						<a href="/" class="h2 mb-0" style="font-family:Gamja Flower;"><img src="/resources/images/doglogo2.png" width="80px"><strong>라온</strong>펫</a>
					</h1>
				</div>
				<div class="col-8 col-xl-10  d-none d-xl-block pr-0">
					<nav class="site-navigation position-relative text-right pl-0"
						role="navigation">
						<ul	class="site-menu main-menu js-clone-nav ml-0 mr-0 pl-0 d-none d-lg-block">

							<li><a href="toAbandoned?currentPage=1" class="nav-link">유기동물</a></li>
							<li><a href="toDisappearList?currentPage=1" class="nav-link">실종신고</a></li>

							<li><a href="toReviewList" class="nav-link">재회</a></li>
							<li><a href="freeMarket?currentPage=1&category=all"
								class="nav-link">무료나눔</a></li>
							<li><a href="/oxQuiz" class="nav-link">Fun</a></li>
							<li><a id="donation_link" href="donation" class="nav-link">후원하기</a></li>
							<li>
								<a id="notice_link" href="notice-view-page"	class="nav-link ">공지사항</a>
							</li>
							<li>
								<div class="border-right d-none d-xl-block">
									<a href="javascirpt:void(0)" class="nav-link invisible">1</a>
								</div>
								<div class="border-top d-xl-none">
									<a href="javascirpt:void(0)" class="nav-link invisible">1</a>
								</div>
							</li>
							<c:choose>
								<c:when test="${id eq null}">
									<li><a href="javascript:void(0)" data-toggle="modal" data-target="#loginmodal" class="login-btn nav-link">로그인</a></li>
<!-- 									<li><input type="button" data-toggle="modal" -->
<!-- 										data-target="#loginmodal" class="login-btn nav-link" value="로그인"> -->
<!-- 									</li> -->
									<li><a href="join" class="nav-link pl-0 pr-0">회원가입</a></li>
								</c:when>
								<c:otherwise>
									<li>
										<c:choose>
												<c:when test="${type ==3}">
													<input type="button" id="logout" value="로그아웃">
												</c:when>
												<c:otherwise>
													<a href="/logout" class="nav-link "><input class="logoutBtn" type="button" value="로그아웃"></a>
												</c:otherwise>
										</c:choose>
									</li>
									<li>
										<a id="mypage_link" href="toMyPage" class="nav-link pl-0 pr-0">마이페이지
											<span class="position-relative">
												<img src="/mypage/msg.png" style="width: 27px;height: 27px;">
												<span class="position-relative badge badge-danger" style="top:-10px; right:10px; font-size: 13px;">
												<!-- 메세지갯수 -->
												<c:if test="${msg >=50 }">50+</c:if>
												<c:if test="${msg < 50 }">${msg }</c:if>
												</span>
											</span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>

				<div class="col-6 d-inline-block d-xl-none ml-md-0 py-3"
					style="position: relative; top: 3px;">
					<a href="#" class="site-menu-toggle js-menu-toggle float-right"><span
						class="icon-menu h3"></span></a>
				</div>
			</div>
		</div>

	</header>
