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
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<header class="site-navbar js-sticky-header site-navbar-target"
		role="banner">
		<div class="container">
			<div class="row  align-items-center">
				<div class="col-6 col-xl-2">
					<h1 class="mb-0 site-logo">
						<a href="index.html" class="h2 mb-0"><strong>Dog</strong>Life<span
							class="text-primary">.</span> </a>
					</h1>
				</div>
				<div class="col-12 col-md-10  d-none d-xl-block pr-0">
					<nav class="site-navigation position-relative text-right pl-0"
						role="navigation">
						<ul
							class="site-menu main-menu js-clone-nav mr-0 pl-0 d-none d-lg-block">
							<li><a href="#home-section" class="nav-link">유기동물</a></li>
							<li><a href="#about-section" class="nav-link">임시보호중</a></li>
							<li><a href="#trainers-section" class="nav-link">재회</a></li>
							<li><a href="#pricing-section" class="nav-link">무료나눔</a></li>
							<li><a href="#blog-section" class="nav-link">Fun</a></li>
							<li><a href="#services-section" class="nav-link">후원하기</a></li>
							<li><a href="#contact-section" class="nav-link ">공지사항</a></li>
							<c:choose>
								<c:when test="${id eq null}">
									<li><button type="button" data-toggle="modal"
											data-target="#loginmodal">
											로그인 </button></li>
									<li><a href="join" class="nav-link pl-0 pr-0">회원가입</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/logout" class="nav-link ">
											로그아웃 </a></li>
									<li><a href="#contact-section" class="nav-link pl-0 pr-0 ">마이페이지</a></li>
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