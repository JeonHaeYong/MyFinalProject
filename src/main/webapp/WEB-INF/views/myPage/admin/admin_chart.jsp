<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i" rel="stylesheet">
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
#container {
	margin-top: 5%;
}

.my_buttons {
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
}

.no_radius {
	border-radius: 0px !important;
}

.chart_col {
	height: 10%;
}
</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->


	<section class="site-section bg-light block-13">

	<div id="container" class="container">

		<div id="menu_row" class="row justify-content-center">

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-member" class="btn btn-warning my_buttons">회원 관리</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn btn-warning my_buttons">무료 나눔 물품 승인</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn btn-warning my_buttons">무료 나눔 거래 내역</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn btn-warning my_buttons">월 별 후원금 및 전달 기관</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn btn-warning my_buttons">퀴즈 당첨자</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-chart" class="btn btn-warning my_buttons">통계</a>
			</div>

		</div>

		<div class="row justify-content-center mt-5">

			<div class="col-6 text-center my-3 chart_col">1번 영역</div>

			<div class="col-6 text-center my-3 chart_col">2번 영역</div>

		</div>

		<div class="row justify-content-center">

			<div class="col-6 text-center my-3 chart_col">3번 영역</div>

			<div class="col-6 text-center my-3 chart_col">4번 영역</div>

		</div>

	</div>

	</section>



	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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
<script>
	$(function()
    {
		$.ajax
    	({
    		url: "admin-chart-visit",
    		type: "POST",
    		dataType: "JSON"
    	})
    	.done(function(response)
    	{
    		console.log(response.todayVisitCount);
    	})
    	.fail(function()
    	{
    		alert("error");
    	});
    });
    
    onload = function()
    {
	    
    };
</script>
</html>