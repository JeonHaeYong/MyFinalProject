<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지 - 무료 나눔 거래 내역</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
#container *
{
	font-family: 'SeoulNamsanM';
}
.menu_header
{
	font-family: 'Gamja Flower', cursive !important;
	font-size: 35px;
	border-bottom: 1px solid gray;
	color : #B45F04;
	font-weight: 600;
}




#menu_row > div > a{
	font-size: 22px;
}
.selected_menu_btns {
	font-family: 'Gamja Flower', cursive !important;
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
	background-color:#FDD69270;
	color:#754F44;
	font-weight:bold !important;
}
.menu_btns{
	font-family: 'Gamja Flower', cursive !important;
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
	color:#754F44;
}
.menu_btns:hover{
	background-color:#FDD692;
	font-weight:bold !important;
	color:#754F44;
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
	
		<section class="site-section block-13">

		<div id="container" class="container">
		
			<div class="row justify-content-center">
				
				<div class="col-2 my-auto">
			
					<div id="menu_row" class="row justify-content-center">
						
						<div class="col-6 col-md-4 col-lg-12 text-center my-3">
							<h2 class="menu_header my-1">관리자 메뉴</h2>
						</div>
						
						<div class="col-6 col-md-4 col-lg-12 text-center px-1">
							<a href="admin-member" class="btn menu_btns">회원 관리</a>
						</div>
			
						<div class="col-6 col-md-4 col-lg-12 text-center px-1">
							<a href="admin-item" class="btn menu_btns">무료 나눔 물품 승인</a>
						</div>
			
						<div class="col-6 col-md-4 col-lg-12 text-center px-1">
							<a href="admin-paylog" class="btn selected_menu_btns">무료 나눔 거래 내역</a>
						</div>
			
						<div class="col-6 col-md-4 col-lg-12 text-center px-1">
							<a href="admin-donation" class="btn menu_btns">월 별 후원금 및 전달 기관</a>
						</div>
			
						<div class="col-6 col-md-4 col-lg-12 text-center px-1">
							<a href="admin-quiz" class="btn menu_btns">퀴즈 당첨자</a>
						</div>
			
						<div class="col-6 col-md-4 col-lg-12 text-center px-1">
							<a href="admin-chart" class="btn menu_btns">통계</a>
						</div>
						
						<div class="col-6 col-md-4 col-lg-12 text-center px-1">
							<a href="admin-msg" class="btn menu_btns">관리자쪽지함</a>
						</div>
						
						<div class="col-12 text-center px-1">
							<a href="admin-pwChange" class="btn menu_btns">비밀번호변경</a>
						</div>
						
					</div>
				
				</div>
				
				
				
				<div class="col-1"></div>
				
				
				
				<div class="col-9">
				
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-3 text-center my-auto">
							
							<select id="condition_select" class="custom-select">
								<option value="buyer-like">구매자</option>
								<option value="seller-like">판매자</option>
								<option value="buyer-equal">구매자(정확한 아이디)</option>
								<option value="seller-equal">판매자(정확한 아이디)</option>
								<option value="date">날짜</option>
							</select>
							
						</div>
						
						<div class="col-8 col-md-8 col-lg-7 text-center my-auto">
							
							<input id="search_text" class="form-control" type="text" placeholder="검색할 키워드를 입력하세요(없을 시 전체)">
							
						</div>
						
						<div class="col-4 col-md-4 col-lg-2 text-center my-auto">
							
							<input id="search_btn" class="btn my_buttons" name="1" type="button" value="검색">
							
						</div>
						
					</div>
					
					<div class="row justify-content-center mt-5">
						
						<div id="search_result_div" class="col-12 col-md-12 col-lg-12 text-center my-1"></div>
						
					</div>
					
					
					
					
					
					
					<div class="row justify-content-center">
						
						<div class="col-12 text-center my-5">
							
							<a href="admin-paylog-insert">데이터 입력</a>
							
						</div>
						
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
		keyword = $("#search_text").val();
		search("");
		
		$("#condition_select").on("change", function()
		{
			changeTypeDate();
		});
	    
		$(document).on("click", "#search_btn", function()
		{
			keyword = $("#search_text").val();
			search(this.name);
		})
		$(document).on("click", ".navi_btns", function()
		{
			search(this.name);
		})
		
		function changeTypeDate()
		{
			
			$("#search_text").val("");
			
			if($("#condition_select").val() == "date")
			{
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth() + 1;
				var yyyy = today.getFullYear();
				
				if(dd < 10)
				{
					dd = '0' + dd;
				} 
				if(mm < 10)
				{
					mm = '0' + mm;
				} 
				
				$("#search_text").attr("type", "date");
				$("#search_text").attr("max", yyyy + "-" + mm + "-" + dd);
			}
			else
			{
				$("#search_text").attr("type", "text");
			}
			
			
		}
		
		
		var keyword;
		function search(btnName)
		{
			
// 			console.log(btnName);
// 			console.log(keyword);
// 			console.log($("#condition_select").val());
			
			$.ajax
	    	({
	    		url: "admin-paylog-search",
	    		type: "POST",
	    		dataType: "JSON",
	    		data:
	    		{
	    			page: btnName
	    			,keyword: keyword
	    			,condition: $("#condition_select").val()
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		
	    		$("#search_result_div").empty();
	    		
	    		var array = response.array;
	    		
	    		if(array.length != 0)
	    		{
	    			var $menu_row = $('<div class="row justify-content-center my-3 id_row"></div>');
	    			var $menu_seqCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-3"><h3>번호</h3></div>');
	    			var $menu_buyerCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-3"><h3>구매자</h3></div>');
	    			var $menu_nameCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-3"><h3>상품명</h3></div>');
	    			var $menu_priceCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-3"><h3>결제금액</h3></div>');
	    			var $menu_sellerCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-3"><h3>판매자</h3></div>');
	    			var $menu_timeCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-3"><h3>일시</h3></div>');
	    			$menu_row.append($menu_seqCol).append($menu_buyerCol).append($menu_nameCol).append($menu_priceCol).append($menu_sellerCol).append($menu_timeCol);
	    			$("#search_result_div").append($menu_row);
		    		
		    		
		    		for(var i = 1 ; i <= array.length ; i++)
		    		{
						var $row = $('<div class="row justify-content-center my-1 id_row"></div>');
		    			var $seqCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-1">'+array[i-1].seq+'</div>');
		    			var $buyerCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-1">'+array[i-1].buyer+'</div>');
		    			var $nameCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-1">'+array[i-1].name+'</div>');
		    			var $priceCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-1">'+array[i-1].price+'</div>');
		    			var $sellerCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-1">'+array[i-1].seller+'</div>');
		    			var $timeCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-1">' + array[i-1].time.substring(0, array[i-1].time.length-2) + '</div>');
		    			$row.append($seqCol).append($buyerCol).append($nameCol).append($priceCol).append($sellerCol).append($timeCol);
		    			$("#search_result_div").append($row);
		    			
		    		}
		    		
					var $naviRow = $('<div id="navi_row" class="row justify-content-center mb-1 mt-3"></div>');
		    		
		    		if(response.needPrev)
		    		{
						var $prevBtn = $('<input class="btn navi_btns mx-1" type="button" value=" < " name="'+(response.startNavi-1)+'">');

		    			$naviRow.append($prevBtn);
		    		}
		    		
		    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
		    		{
		    			
						if(i == response.currentPage)
		    			{
			    			var $naviBtn = $('<input class="btn selected_btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
		    			}
		    			else
		    			{
			    			var $naviBtn = $('<input class="btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
		    			}

		    			$naviRow.append($naviBtn);
		    		}
		    		
		    		if(response.needNext)
		    		{
		    			var $nextBtn = $('<input class="btn navi_btns mx-1" type="button" value=" > " name="'+(response.endNavi+1)+'">');
		    			$naviRow.append($nextBtn);
		    		}
		    		
		    		$("#search_result_div").append($naviRow);	
	    		}
	    		else
	    		{
	    			var $row = $('<div class="row justify-content-center my-1"></div>');
	    			var $noResultCol = $('<div class="col-6 col-md-6 col-lg-12 text-center my-1"><h3>검색 결과가 없습니다.</h3></div>');
	    			$row.append($noResultCol);
	    			$("#search_result_div").append($row);
	    		}
	    		
	    		
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});			
		}

</script>
</html>