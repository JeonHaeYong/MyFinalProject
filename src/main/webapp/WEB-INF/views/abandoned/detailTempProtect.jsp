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

<style>
table {
	width: 760px;
}

#animalPhoto {
	position: absolute;
	right: 20px;
	top: 55px;
	z-index: 1;
}

th {
	background-color: #f7f7f7;
	border-bottom: 1px solid #cfcfcf;
	text-align: center;
	padding: 5px;
}

td {
	border-bottom: 1px solid #cfcfcf;
	padding-left: 10px;
}

#toList {
	text-align: center;
}

#btnToList {
	background-color: #EC7357;
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
}
</style>

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
						<a href="listTempProtect?=currentPage=1">임시보호중</a>
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
				<div class="col-lg-9 col-md-9 col-sm-12 col-12 row">
					<div id="animalPhoto">
						<img src="" style="width: 200px; height: 150px">
					</div>

					<table class="table">
						<tbody>
							<tr>
							</tr>

							<tr>
								<th scope="row" style="width: 18%">제목</th>
								<td>${dto.title }</td>
							</tr>
							<tr>
								<th scope="row">시도</th>
								<td>${dto.sido }</td>
							</tr>
							<tr>
								<th scope="row">시군구</th>
								<td>${dto.sigungu }</td>
							</tr>
							<tr>
								<th scope="row">발견 장소</th>
								<td>${dto.place }</td>
							</tr>
							<tr>
								<th scope="row">발견 날짜</th>
								<td><fmt:formatDate value="${dto.findDate }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<th scope="row">품종</th>
								<td>${dto.type }</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>${dto.sex }</td>
							</tr>
							<tr>
								<th scope="row">색깔</th>
								<td>${dto.color }</td>
							</tr>
							<tr>
								<th scope="row">특징</th>
								<td>${dto.feat }</td>
							</tr>
							<tr>
								<th scope="row">연락처</th>
								<td>${dto.phone }</td>
							</tr>

						</tbody>
					</table>
					<div style="margin:auto">
						<button type="button" id="btnToList" class="btn btn-sm"
							onclick="goBack();">목록</button>
					</div>
				</div>
			</div>
	</section>

	<!-- ----Footerë¶ë¶ìëë¤^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function goBack() {
			window.history.back();
		}
	</script>
</body>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
</html>