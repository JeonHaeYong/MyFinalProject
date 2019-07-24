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


.my_buttons, .navi_btns {
font-family: 'Gamja Flower', cursive !important;
background-color:#FDD69270;
color:#754F44;
}
.my_buttons:hover , .navi_btns:hover {
background-color:#FDD692;
font-weight:bold;
}
.selected_btn{
font-family: 'Gamja Flower', cursive !important;
color:#754F44;
background-color:#FDD692;
font-weight:bold;
}
	
</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->


	<section class="site-section bg-light block-13">

		<div id="container" class="container">

			<div class="row justify-content-center">
				
				<div class="col-2 col-md-2 col-lg-2 text-center my-1"><h3>글 번호</h3></div>
				<div class="col-6 col-md-6 col-lg-6 text-center my-1"><h3>제목</h3></div>
				<div class="col-2 col-md-2 col-lg-2 text-center my-1"><h3>작성 일자</h3></div>
				<div class="col-2 col-md-2 col-lg-2 text-center my-1"><h3>조회수</h3></div>
				
				<div id="contents_div" class="col-12 col-md-12 col-lg-12 text-center my-5">
					
				</div>
				
				<div class="col-12 col-md-12 col-lg-12 text-right my-1">
					<input id="write_btn" class="btn my_buttons mx-1" type="button" value="글 작성">
				</div>
				
				<div class="col-12 col-md-12 col-lg-12 text-center my-5">
					<a href="notice-write-random">데이터 삽입</a>
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
		$(document).on("click", ".navi_btns", function()
		{
			$.ajax
	    	({
	    		url: "notice-view-do",
	    		type: "POST",
	    		dataType: "JSON",
	    		data:
	    		{
	    			page: this.name
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		$("#contents_div").empty();
	    		
	    		var array = response.array;
	    		
	    		for(var i = 1 ; i <= array.length ; i++)
	    		{
					var $row = $('<div class="row justify-content-center my-1"></div>');
					var $seqCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1">'+array[i-1].seq+'</div>');
					var $titleCol = $('<div class="col-6 col-md-6 col-lg-6 text-center my-1"><a href=notice-detail-page?seq='+array[i-1].seq+'>'+array[i-1].title+'</a></div>');
	    			var $writeTimeCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1">'+array[i-1].write_time+'</div>');
	    			var $viewCountCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1">'+array[i-1].view_count+'</div>');
	    			$row.append($seqCol).append($titleCol).append($writeTimeCol).append($viewCountCol);
	    			$("#contents_div").append($row);
	    		}
	    		
	    		var $naviRow = $('<div id="navi_row" class="row justify-content-center my-5"></div>');
	    		
	    		if(response.needPrev)
	    		{
	    			var $prevBtn = $('<input class="btn navi_btns navi_btns mx-1" type="button" value="이전" name="'+(response.startNavi-1)+'">');
	    			$naviRow.append($prevBtn);
	    		}
	    		
	    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
	    		{
	    			
	    			if(i == response.currentPage)
	    			{
		    			var $naviBtn = $('<input class="btn selected_btn mx-1" type="button" value="'+i+'" name="'+i+'">');

	    			}
	    			else
	    			{
		    			var $naviBtn = $('<input class="btn navi_btns navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

	    			}
	    			$naviRow.append($naviBtn);
	    		}
	    		
	    		if(response.needNext)
	    		{
	    			var $nextBtn = $('<input class="btn navi_btns navi_btns mx-1" type="button" value="이후" name="'+(response.endNavi+1)+'">');
	    			$naviRow.append($nextBtn);
	    		}
	    		
	    		$("#contents_div").append($naviRow);
	    		
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
		});
		
		$("#write_btn").on("click", function()
		{
			location.href = "notice-write-page";
		});
		
		
    });
    
    onload = function()
    {
		
    };
</script>
<script>
	$(function()
    {
		$.ajax
    	({
    		url: "notice-view-do",
    		type: "POST",
    		dataType: "JSON",
    		data:
    		{
    			page: '1'
    		}
    	})
    	.done(function(response)
    	{
    		var array = response.array;
    		
			for(var i = 1 ; i <= array.length ; i++)
	    	{
				var $row = $('<div class="row justify-content-center tb-border my-1"></div>');
				var $seqCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1">'+array[i-1].seq+'</div>');
	    		var $titleCol = $('<div class="col-6 col-md-6 col-lg-6 text-center my-1"><a href=notice-detail-page?seq='+array[i-1].seq+'>'+array[i-1].title+'</a></div>');
	    		var $writeTimeCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1">'+array[i-1].write_time+'</div>');
	    		var $viewCountCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1">'+array[i-1].view_count+'</div>');
	    		$row.append($seqCol).append($titleCol).append($writeTimeCol).append($viewCountCol);
	    		$("#contents_div").append($row);
	    	}
    		
    		var $naviRow = $('<div id="navi_row" class="row justify-content-center my-5"></div>');
    		
    		if(response.needPrev)
    		{
    			var $prevBtn = $('<input class="btn navi_btns navi_btns mx-1" type="button" value="이전" name="'+(response.startNavi-1)+'">');
    			$naviRow.append($prevBtn);
    		}
    		
    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
    		{
    			
    			if(i == response.currentPage)
    			{
	    			var $naviBtn = $('<input class="btn selected_btn mx-1" type="button" value="'+i+'" name="'+i+'">');

    			}
    			else
    			{
	    			var $naviBtn = $('<input class="btn navi_btns navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

    			}
    			$naviRow.append($naviBtn);
    		}
    		
    		if(response.needNext)
    		{
    			var $nextBtn = $('<input class="btn navi_btns navi_btns mx-1" type="button" value="이후" name="'+(response.endNavi+1)+'">');
    			$naviRow.append($nextBtn);
    		}
    		
    		$("#contents_div").append($naviRow);
    		
    	})
    	.fail(function()
    	{
    		alert("error");
    	});
		
    });
</script>
</html>