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

#mypage_link {
	color: #EC7357 !important;
	font-weight: 600 !important;
}

.my_buttons {
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
	background-color: #EC7357 !important;
}

.selected_my_buttons {
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
	background-color: black !important;
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
				<a href="admin-member" class="btn btn-danger my_buttons">회원 관리</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn btn-danger selected_my_buttons">무료 나눔 물품 승인</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn btn-danger my_buttons">무료 나눔 거래 내역</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-donation" class="btn btn-danger my_buttons">월 별 후원금 및 전달 기관</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="#" class="btn btn-danger my_buttons">퀴즈 당첨자</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-chart" class="btn btn-danger my_buttons">통계</a>
			</div>

		</div>






		<div id="contents_row" class="row justify-content-center mt-5">

			<div class="col-12">

				<div class="row justify-content-center">

					<div class="col-8 col-md-8 col-lg-6 text-center my-auto">

						<input id="search_text" class="form-control" type="text">

					</div>

					<div class="col-4 col-md-4 col-lg-2 text-center my-auto">

						<input id="search_btn" class="btn btn-info my_buttons" name="1" type="button" value="검색">

					</div>

				</div>
				
				
				<div class="row justify-content-center mt-5">
					<div class="col-6 col-md-6 col-lg-2 text-center my-1">판매 등록 번호</div>
					<div class="col-4 col-md-4 col-lg-3 text-center my-1">상품 명</div>
					<div class="col-4 col-md-4 col-lg-2 text-center my-1">상품 가격</div>
					<div class="col-4 col-md-4 col-lg-3 text-center my-1">판매자</div>
					<div class="col-2 col-md-2 col-lg-2 text-center my-1"><input id="permission_all_btn" type="checkbox">모두 체크</div>
				</div>
				
				
				<div class="row justify-content-center my-1">

					<div id="search_result_div" class="col-12 col-md-12 col-lg-12 text-center my-1"></div>

				</div>



				<div class="row justify-content-center">

					<div class="col-8 col-md-8 col-lg-6 text-center my-5"></div>

					<div class="col-4 col-md-4 col-lg-2 text-center my-5">

						<input id="reg_btn" class="btn btn-danger my_buttons" type="button" value="등록하기">

					</div>

				</div>

			</div>

		</div>





		<div class="row justify-content-center">

			<div class="col-12 col-md-12 col-lg-12 text-center my-5">

				<a href="admin-item-insert">데이터 삽입</a>

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
		$(document).on("click", "#permission_all_btn", function()
		{
			$("#search_result_div input[type=checkbox]").prop("checked", true);
		})
		
		$("#reg_btn").on("click", function()
		{
			var $check = $(".permission_check");
			var seq = "";
			
	    	for(var i = 1 ; i <= $check.length ; i++)
	    	{
	    		if($check.eq(i-1).prop("checked") == true)
	    		{
	    			seq = seq + " " + $check.eq(i-1).attr("name");
	    		}
	    	}
			
			$.ajax
	    	({
	    		url: "admin-item-permission",
	    		type: "POST",
	    		data:
	    		{
	    			items: seq
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		if(response == "Y")
	    		{
	    			alert("성공");
	    			myAjax("1");
	    			$("#permission_all_btn").prop("checked", false);
	    		}
	    		else
	    		{
	    			alert("실패");
	    		}
	    	});
		})
		
		$(document).on("click", "#search_btn,.navi_btns", function()
		{
			myAjax(this.name);
		})
		
		function myAjax(btnName)
		{
			$.ajax
	    	({
	    		url: "admin-item-search",
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
	    			var $seqCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-1">'+array[i-1].seq+'</div>');
	    			var $nameCol = $('<div class="col-4 col-md-4 col-lg-3 text-center my-1">'+array[i-1].name+'</div>');
	    			var $priceCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-1">'+array[i-1].price+'</div>');
	    			var $sellerCol = $('<div class="col-4 col-md-4 col-lg-3 text-center my-1">'+array[i-1].seller+'</div>');
	    			var $checkCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1"><input class="permission_check" name="'+array[i-1].seq+'" type="checkbox">'+'거래 승인'+'</div>');
	    			$row.append($seqCol).append($nameCol).append($priceCol).append($sellerCol).append($checkCol);
	    			$("#search_result_div").append($row);
	    		}
	    		
				var $naviRow = $('<div id="navi_row" class="row justify-content-center mb-1 mt-3"></div>');
	    		
	    		if(response.needPrev)
	    		{
	    			var $prevBtn = $('<input class="btn btn-danger my_navi_btns navi_btns mx-1" type="button" value="이전" name="'+(response.startNavi-1)+'">');
	    			$naviRow.append($prevBtn);
	    		}
	    		
	    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
	    		{
	    			
	    			if(i == response.currentPage)
	    			{
		    			var $naviBtn = $('<input class="btn btn-danger selected_btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

	    			}
	    			else
	    			{
		    			var $naviBtn = $('<input class="btn btn-danger my_navi_btns navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

	    			}
	    			$naviRow.append($naviBtn);
	    		}
	    		
	    		if(response.needNext)
	    		{
	    			var $nextBtn = $('<input class="btn btn-danger my_navi_btns navi_btns mx-1" type="button" value="이후" name="'+(response.endNavi+1)+'">');
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