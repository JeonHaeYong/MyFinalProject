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
	margin-top: 5%;
}
#mypage_link
{
	color: #EC7357 !important;
	font-weight: 600 !important;
}



.selected_menu_btns {
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
	color: white !important;
	background-color: #9c2c2c !important;
}
.menu_btns{
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
}
.menu_btns:hover{
	color: white !important;
	background-color: #9c2c2c !important;
}


.my_buttons {
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
	background-color: #EC7357;
	color: white !important;
}
.my_buttons:hover{
	background-color: #9c2c2c !important;
}

.selected_btn{
	color: #EC7357 !important;
	font-weight: 600 !important;
}

</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->


	<section class="site-section bg-light block-13">

	<div id="container" class="container">





		<div id="menu_row" class="row justify-content-center">

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-member" class="btn menu_btns">회원 관리</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-item" class="btn menu_btns">무료 나눔 물품 승인</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn menu_btns">무료 나눔 거래 내역</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-donation" class="btn menu_btns">월 별 후원금 및 전달 기관</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-quiz" class="btn selected_menu_btns">퀴즈 당첨자</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-chart" class="btn menu_btns">통계</a>
			</div>

		</div>






		<div id="contents_row" class="row justify-content-center mt-5">

			<div class="col-12">

				<div class="row justify-content-center mt-5">
					
					<div class="col-6 col-md-6 col-lg-4 text-center my-1"><h3>번호</h3></div>
					<div class="col-6 col-md-6 col-lg-4 text-center my-1"><h3>포인트</h3></div>
					<div class="col-4 col-md-4 col-lg-4 text-center my-1"><h3>아이디</h3></div>
					
				</div>
				
				
				<div class="row justify-content-center my-1">

					<div id="search_result_div" class="col-12 col-md-12 col-lg-12 text-center my-1"></div>

				</div>

			</div>

		</div>





		<div class="row justify-content-center">

			<div class="col-12 col-md-12 col-lg-12 text-center my-5">

				<a href="admin-quiz-random">데이터 업데이트</a>

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
		myAjax("1");
		
		$(document).on("click", "#search_btn,.navi_btns", function()
		{
			myAjax(this.name);
		})
		
		function myAjax(btnName)
		{
			$.ajax
	    	({
	    		url: "admin-quiz-search",
	    		type: "POST",
	    		dataType: "JSON",
	    		data:
	    		{
	    			page: btnName
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		
	    		var array = response.array;
	    		
	    		$("#search_result_div").empty();
	    		
	    		for(var i = 1 ; i <= array.length ; i++)
	    		{
					var $row = $('<div class="row justify-content-center my-1 id_row"></div>');
					var $seqCol = $('<div class="col-6 col-md-6 col-lg-4 text-center my-1">'+(response.seq*1+i)+'</div>');
	    			var $pointCol = $('<div class="col-6 col-md-6 col-lg-4 text-center my-1">'+array[i-1].point+'</div>');
	    			var $idCol = $('<div class="col-6 col-md-6 col-lg-4 text-center my-1">'+array[i-1].id+'</div>');
	    			$row.append($seqCol).append($pointCol).append($idCol);
	    			$("#search_result_div").append($row);
	    		}
	    		
				var $naviRow = $('<div id="navi_row" class="row justify-content-center mb-1 mt-3"></div>');
	    		
	    		if(response.needPrev)
	    		{
// 	    			var $prevBtn = $('<input class="btn btn-danger my_navi_btns navi_btns mx-1" type="button" value=" < " name="'+(response.startNavi-1)+'">');
					var $prevBtn = $('<input class="btn btn-link navi_btns mx-1" type="button" value=" < " name="'+(response.startNavi-1)+'">');

	    			$naviRow.append($prevBtn);
	    		}
	    		
	    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
	    		{
	    			
// 	    			if(i == response.currentPage)
// 	    			{
// 		    			var $naviBtn = $('<input class="btn btn-danger selected_btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
// 	    			}
// 	    			else
// 	    			{
// 		    			var $naviBtn = $('<input class="btn btn-danger my_navi_btns navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
// 	    			}
				
					if(i == response.currentPage)
	    			{
		    			var $naviBtn = $('<input class="btn btn-link selected_btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
	    			}
	    			else
	    			{
		    			var $naviBtn = $('<input class="btn btn-link navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
	    			}

	    			$naviRow.append($naviBtn);
	    		}
	    		
	    		if(response.needNext)
	    		{
// 	    			var $nextBtn = $('<input class="btn btn-danger my_navi_btns navi_btns mx-1" type="button" value=" > " name="'+(response.endNavi+1)+'">');
	    			var $nextBtn = $('<input class="btn btn-link navi_btns mx-1" type="button" value=" > " name="'+(response.endNavi+1)+'">');
	    			$naviRow.append($nextBtn);
	    		}
	    		
	    		$("#search_result_div").append($naviRow);
	    		
	    		
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
		}
    })
    
    onload = function()
    {
		
    };
</script>
</html>