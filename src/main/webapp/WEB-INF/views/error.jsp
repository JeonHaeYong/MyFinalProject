<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라온펫 - 에러</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap&subset=korean" rel="stylesheet">
<style>
	body, h1{
		font-family: 'Gamja flower';
	}
	.myJumbo{
		background-color: white;
		padding-top: 0px;
	}
	#jumboImg{
		width: 100%;
		max-height: 600px;
	}
	p{
		font-size: 25px;
	}
	a{
		text-decoration: none;
		color: black;
	}
	a:hover{
		color: black;
	}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="d-flex justify-content-center">
		<h1 class="mb-0 site-logo">
			<a href="/" class="h2 mb-0" style="font-family:Gamja Flower; font-size:25px"><img src="/resources/images/doglogo2.png" width="80px"><strong>라온</strong>펫</a>
		</h1>
	</div>
	<div class="jumbotron myJumbo pr-0 pl-0 pb-0 mb-0">
		<img src="/resources/images/error.png" id="jumboImg">
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<p style="font-size: 60px;">ERROR</p>
			</div>
			<div class="col-12 d-flex justify-content-center">
				<c:choose>
					<c:when test="${errorMsg!=null }">
						<p>${errorMsg }
					</c:when>
					<c:otherwise>
						<p>알수없는 문제가 발생하였습니다.
					</c:otherwise>
				</c:choose>
				<br>관리자에게 문의하세요.<br>laonpetAdmin@gmail.com</p>
			</div>
		</div>
	</div>

	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
	
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
	<script>
		$(function(){
			history.pushState(null, null, location.href);
			window.onpopstate = function(event) {
				history.go(1);
			};
			// 뒤로가기 방지
			window.history.forward(1);
			//새로고침, 뒤로가기 막기
			document.onkeydown = function(e) {
				key = (e) ? e.keyCode : event.keyCode;
				if (key == 8 || key == 116) {
					if (e) {
						e.preventDefault();
					} else {
						event.keyCode = 0;
						event.returnValue = false;
					}
				}
			}
		});
	</script>
</body>
</html>