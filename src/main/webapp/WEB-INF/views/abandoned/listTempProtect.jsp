<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"
	rel="stylesheet">
<link rel="stylesheet" href="resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$("#write").on("click", function() {
			location.href = "writeTempProtect";
		});
	});
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----ì¬ê¸°ê¹ì§ ê³ ì  Headerìëë¤----------------------------------------------------------------------------------------------------------- -->
	<section class="site-section bg-light block-13">
		<div class="container">

			<div class="row">
				<!--작은 메뉴랑 게시판목록이랑 나누는 row-->
				<div class="col-lg-2 col-md-2 col-sm-12 col-12 menu-bar">
					<!--작은 메뉴바-->
					<div class="menu">MENU</div>
					<div>
						<a href="toAbandoned?currentPage=1">유기동물조회</a>
					</div>
					<div>
						<a href="listTempProtect?currentPage=1">임시보호중</a>
					</div>
					<div>
						<a href="">동물병원 조회</a>
					</div>
					<div>
						<a href="">보호센터 조회</a>
					</div>
				</div>

				<div class="col-1">
					<!--메뉴바랑 리스트 사이 빈 공간-->
				</div>

				<div class="col-lg-8 col-md-8 col-sm-12 col-12 row">
					<c:forEach var="dto" items="${list}">

						<div class="card myCard col-lg-4 col-md-4 col-sm-12">
							<a href="detailTempProtect?seq=${dto.seq }"><img
								src="${dto.imagePath }" class="card-img-top" alt="..."
								style="width: 211px; height: 150px"></a>
							<div class="card-body">

								<p class="card-text">
									<label class="title"><strong>제목</strong> </label><label
										class="content">${dto.title}</label><br> <label
										class="title"><strong>발견날짜 </strong> </label><label
										class="content"><fmt:formatDate
											value="${dto.findDate }" pattern="yyyy-MM-dd" /></label> <br>
									<label class="title"><strong>시도 </strong></label><label
										class="content">${dto.sido }</label><br> <label
										class="title"><strong>시군구</strong></label><label
										class="content">${dto.sigungu }</label><br> <label
										class="title"><strong>발견 장소 </strong></label><label
										class="content">${dto.place }</label><br> <label
										class="title"><strong>품종 </strong></label><label
										class="content">${dto.type }</label><br>
								</p>
							</div>
						</div>

					</c:forEach>
					<input type="button" id="write" value="글  작성">
				</div>
			</div>
		</div>
	</section>
	<!-- ----Footerë¶ë¶ìëë¤^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script src="resources/js/jquery-ui.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.countdown.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/jquery.fancybox.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/isotope.pkgd.min.js"></script>
	<script src="resources/js/main.js"></script>
</body>


</html>