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


#container
{
	margin-top: 10%;
}
.my_buttons
{
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
}
.no_radius
{
	border-radius: 0px !important;
}

</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

<!-- <div class="row justify-content-center"></div> -->
<!-- <div class="col-12 col-md-12 col-lg-12 text-center my-5"></div> -->
<!-- <div class="row justify-content-center"> -->
<!-- 	<div class="col-12 col-md-12 col-lg-12 text-center my-5"> -->
<!-- 	</div> -->
<!-- </div> -->

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
					<a href="#" class="btn btn-warning my_buttons">공백</a>
				</div>

			</div>
			
			<div id="contents_row" class="row justify-content-center mt-5">
			
				<div class="col-12">
				
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-6 text-center my-auto">
							
							<input id="search_text" class="form-control" type="text">
							
						</div>
						
						<div class="col-4 col-md-4 col-lg-2 text-center my-auto">
							
							<input id="search_btn" class="btn btn-info" type="button" value="검색">
							
						</div>
						
					</div>
					
					<div id="search_result_div" class="row justify-content-center mt-5">
						
						
						
					</div>
				
				</div>
				
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
	    $("#search_btn").on("click", function()
		{
	    	$.ajax
	    	({
	    		url: "admin-member-search",
	    		type: "POST",
	    		dataType: "JSON",
	    		data:
	    		{
	    			id: $("#search_text").val()
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		$("#search_result_div").empty();
	    		for(var i = 1 ; i <= response.length ; i++)
	    		{
// 	    			console.log(response[i-1].id);
	    			var $idCol = $('<div class="col-6 col-md-6 col-lg-6 text-center my-1">'+response[i-1].id+'</div>');
	    			var $checkCol = $('<div class="col-6 col-md-6 col-lg-6 text-center my-1"><input type="checkbox">'+'블랙리스트 등록'+'</div>');
	    			$("#search_result_div").append($idCol);
	    			$("#search_result_div").append($checkCol);
	    		}
	    		var $btnCol = $('<div class="col-12 col-md-12 col-lg-12 text-center my-5"><input class="btn btn-danger no_radius" type="button" value="등록하기"></div>');
	    		$("#search_result_div").append($btnCol);
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
		});
    });
    
	
	
    onload = function()
    {
		
    };
</script>
</html>