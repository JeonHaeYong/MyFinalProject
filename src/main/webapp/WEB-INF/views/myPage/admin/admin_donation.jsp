<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

.log_navi_btns {
font-family: 'Gamja Flower', cursive !important;
background-color:#FDD69270;
color:#754F44;
}
.log_navi_btns:hover {
background-color:#FDD692;
font-weight:bold;
}
.selected_log_btn{
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
			
			
			
			
			
			<div id="menu_row" class="row justify-content-center">

				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-member" class="btn menu_btns">회원 관리</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-item" class="btn menu_btns">무료 나눔 물품 승인</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-paylog" class="btn menu_btns">무료 나눔 거래 내역</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-donation" class="btn selected_menu_btns">월 별 후원금 및 전달 기관</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-quiz" class="btn menu_btns">퀴즈 당첨자</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-chart" class="btn menu_btns">통계</a>
				</div>
				
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-msg" class="btn menu_btns">관리자쪽지함</a>
				</div>
	
			</div>
			
			
			
			
			
			<div class="row justify-content-center">

				<div class="col-12 col-md-12 col-lg-12 text-center my-5">

					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-12 text-center my-3">
						
							<h2>후원 업체 등록</h2>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>후원 업체명</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="name_text" class="form-control" type="text">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>제목</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="title_text" class="form-control" type="text">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>설명</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<textarea id="explanation_text" class="form-control" rows="5"></textarea>
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>사진1</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="image1_file" class="form-control" name="image1" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>사진2</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="image2_file" class="form-control" name="image2" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>사진3</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="image3_file" class="form-control" name="image3" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>좌측 하단 사진</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="left_file" class="form-control" name="left" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>우측 하단 사진</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="right_file" class="form-control" name="right" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>목표 금액</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="goalmoney_text" class="form-control" type="text">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>시작 날짜</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-4 text-center my-1">
						
							<input id="startdate_text" class="form-control" type="date">
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>종료 날짜</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-4 text-center my-1">
						
							<input id="enddate_text" class="form-control" type="date">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-12 text-center my-5">
						
							<input id="submit_btn" class="btn my_buttons" type="button" value="후원 업체 등록">
						
						</div>
						
					</div>
					
				</div>

			</div>
			
			
			<div class="row justify-content-center">

				<div class="col-12 col-md-12 col-lg-12 text-center my-5">
					
					<div class="row justify-content-center">
					
						<div class="col-12 col-md-12 col-lg-12 text-center my-3">
							
							<h2>등록 정보 조회 및 변경</h2>
							
						</div>
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>등록 번호</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_seq_text" class="form-control" type="text" readonly>
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>후원 업체명</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_name_text" class="form-control" type="text">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>제목</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_title_text" class="form-control" type="text">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>설명</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<textarea id="select_explanation_text" class="form-control" rows="5"></textarea>
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>사진1</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_image1_file" class="form-control" name="image1" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>사진2</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_image2_file" class="form-control" name="image2" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>사진3</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_image3_file" class="form-control" name="image3" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>좌측 하단 사진</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_left_file" class="form-control" name="left" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>우측 하단 사진</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_right_file" class="form-control" name="right" type="file">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>목표 금액</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_goalmoney_text" class="form-control" type="text">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>현재 모금 금액</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
						
							<input id="select_currentmoney_text" class="form-control" type="text" readonly>
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>시작 날짜</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-4 text-center my-1">
						
							<input id="select_startdate_text" class="form-control" type="date">
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
						
							<label>종료 날짜</label>
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-4 text-center my-1">
						
							<input id="select_enddate_text" class="form-control" type="date">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div id="search_result_div" class="col-12 col-md-12 col-lg-12 text-center my-3">
						
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-12 text-center my-3">
						
							<input id="update_btn" class="btn my_buttons" type="button" value="등록 정보 변경">
						
						</div>
						
						<div class="col-12 col-md-12 col-lg-12 text-center my-3">
								
							<input id="search_btn" class="btn my_buttons" name="1" type="button" value="검색">
								
						</div>
						
					</div>
					
				</div>

			</div>
			
			<div class="row justify-content-center">
				
				<div class="col-12 col-md-12 col-lg-12 text-center my-3">
					
					<div class="row justify-content-center">
					
						<div class="col-12 col-md-12 col-lg-12 text-center my-3">
							
							<h2>월 별 후원금 검색</h2>
							
						</div>
						
					</div>
					
					<div class="row justify-content-center">
					
						<div id="log_result_div" class="col-12 col-md-12 col-lg-12 text-center my-3">
							
						</div>
						
						<div class="col-12 col-md-12 col-lg-12 text-center my-3">
							
							<input id="log_btn" class="btn my_buttons" name="1" type="button" value="월 별 후원금 검색">
							
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
	$(function()
    {
		//페이지 로딩 후 검색 결과가 바로 보이게 실행
		myAjax("1");
		logAjax("1");
		
		//테스트용 시작
		$("#name_text").val("후원 업체 명");
		$("#title_text").val("제목입니다");
		$("#explanation_text").val("설명 설명");
		$("#goalmoney_text").val("1000000");
		$("#startdate_text").val("2019-07-01");
		$("#enddate_text").val("2019-07-30");
		//테스트용 끝
		
	    $("#submit_btn").on("click", function()
		{
	    	var $form = $('<form></form>');
	        $form.attr('action', 'admin-donation-insert');
	        $form.attr('method', 'POST');
	        $form.attr('enctype', 'multipart/form-data');
	        $form.appendTo('body');
	         
	        
	        
	        var $name = $('<input type="hidden" name="name">');
	        $name.val($("#name_text").val());
	        
	        var $title = $('<input type="hidden" name="title">');
	        $title.val($("#title_text").val());
	        
	        var $explanation = $('<input type="hidden" name="explanation">');
	        $explanation.val($("#explanation_text").val().replace(/(?:\r\n|\r|\n)/g, "<br>"));
	        
			var $image1 = $("#image1_file");
			var $image2 = $("#image2_file");
			var $image3 = $("#image3_file");
			
			var $left = $("#left_file");
			var $right = $("#right_file");

	        
	        var $goalmoney = $('<input type="hidden" name="goalmoney">');
	        $goalmoney.val($("#goalmoney_text").val());
	        
	        var $startdate = $('<input type="hidden" name="startdate">');
	        $startdate.val($("#startdate_text").val());
	        
	        var $enddate = $('<input type="hidden" name="enddate">');
	        $enddate.val($("#enddate_text").val());
	        
	        $form.append($name).append($title).append($explanation)
	        .append($image1).append($image2).append($image3)
	        .append($goalmoney).append($startdate).append($enddate)
	        .append($left).append($right);
	        
	        $form.submit();
		});
	    
	    
	    $(document).on("click", "#search_btn, .navi_btns", function()
		{
	    	myAjax(this.name);	    	
		});
	    
	    $("#update_btn").on("click", function()
		{
	    	if($("#select_seq_text").val() != "")
	    	{
	    		var $form = $('<form></form>');
		        $form.attr('action', 'admin-donation-update');
		        $form.attr('method', 'POST');
		        $form.attr('enctype', 'multipart/form-data');
		        $form.appendTo('body');
		         
		        
		        var $seq = $('<input type="hidden" name="seq">');
		        $seq.val($("#select_seq_text").val());
		        
		        var $name = $('<input type="hidden" name="name">');
		        $name.val($("#select_name_text").val());
		        
		        var $title = $('<input type="hidden" name="title">');
		        $title.val($("#select_title_text").val());
		        
		        var $explanation = $('<input type="hidden" name="explanation">');
		        $explanation.val($("#select_explanation_text").val().replace(/(?:\r\n|\r|\n)/g, "<br>"));
		        
				var $image1 = $("#select_image1_file");
				var $image2 = $("#select_image2_file");
				var $image3 = $("#select_image3_file");
				
				var $left = $("#select_left_file");
				var $right = $("#select_right_file");

		        
		        var $goalmoney = $('<input type="hidden" name="goalmoney">');
		        $goalmoney.val($("#select_goalmoney_text").val());
		        
		        var $startdate = $('<input type="hidden" name="startdate">');
		        $startdate.val($("#select_startdate_text").val());
		        
		        var $enddate = $('<input type="hidden" name="enddate">');
		        $enddate.val($("#enddate_text").val());
		        
		        $form.append($seq).append($name).append($title).append($explanation)
		        .append($image1).append($image2).append($image3)
		        .append($goalmoney).append($startdate).append($enddate)
		        .append($left).append($right);
		        
		        $form.submit();
	    	}
	    	else
	    	{
	    		alert("검색 후 변경하세요")
	    	}
		});
	    
	    function myAjax(btnName)
	    {
	    	$.ajax
	    	({
	    		url: "admin-donation-search",
	    		type: "POST",
	    		dataType: "JSON",
	    		data:
	    		{
	    			page: btnName
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		$("#search_result_div").empty();
	    		
// 	    		console.log(response);
	    		
	    		$("#select_seq_text").val(response.seq);
	    		$("#select_name_text").val(response.name);
	    		$("#select_title_text").val(response.title);
	    		$("#select_explanation_text").val(response.explanation.replace(/(<br>)/g, "\n"));
	    		$("#select_goalmoney_text").val(response.goalmoney);
	    		$("#select_currentmoney_text").val(response.currentmoney);
	    		$("#select_startdate_text").val(response.startdate);
	    		$("#select_enddate_text").val(response.enddate);
	    		
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
	    		
	    		
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
	    }
	    

	    
		$(document).on("click", "#log_btn, .log_navi_btns", function()
		{
	    	logAjax(this.name);	    	
		});
		
	    function logAjax(btnName)
	    {
	    	$.ajax
	    	({
	    		url: "admin-donation-log",
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
	    		
	    		if(array.length != 0)
	    		{
	    			$("#log_result_div").empty();
		    		
	    			var $menu_row = $('<div class="row justify-content-center my-1 id_row"></div>');
	    			var $menu_timeCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-1"><h3>연/월</h3></div>');
	    			var $menu_nameCol = $('<div class="col-4 col-md-4 col-lg-6 text-center my-1"><h3>기관 명</h3></div>');
	    			var $menu_donationCol = $('<div class="col-4 col-md-4 col-lg-4 text-center my-1"><h3>후원 금액</h3></div>');
	    			$menu_row.append($menu_timeCol).append($menu_nameCol).append($menu_donationCol);
	    			$("#log_result_div").append($menu_row);
	    			
		    		for(var i = 1 ; i <= array.length ; i++)
		    		{
						var $row = $('<div class="row justify-content-center my-1 id_row"></div>');
		    			var $timeCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-1">'+array[i-1].time+'</div>');
		    			var $nameCol = $('<div class="col-4 col-md-4 col-lg-6 text-center my-1">'+array[i-1].name+'</div>');
		    			var $donationCol = $('<div class="col-4 col-md-4 col-lg-4 text-center my-1">'+array[i-1].donation+'</div>');
		    			$row.append($timeCol).append($nameCol).append($donationCol);
		    			$("#log_result_div").append($row);
		    		}
		    		
					var $naviRow = $('<div id="navi_row" class="row justify-content-center mb-1 mt-3"></div>');
		    		
		    		if(response.needPrev)
		    		{
						var $prevBtn = $('<input class="btn log_navi_btns mx-1" type="button" value=" < " name="'+(response.startNavi-1)+'">');

		    			$naviRow.append($prevBtn);
		    		}
		    		
		    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
		    		{
		    			
						if(i == response.currentPage)
		    			{
			    			var $naviBtn = $('<input class="btn selected_log_btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
		    			}
		    			else
		    			{
			    			var $naviBtn = $('<input class="btn log_navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');
		    			}

		    			$naviRow.append($naviBtn);
		    		}
		    		
		    		if(response.needNext)
		    		{
		    			var $nextBtn = $('<input class="btn log_navi_btns mx-1" type="button" value=" > " name="'+(response.endNavi+1)+'">');
		    			$naviRow.append($nextBtn);
		    		}
		    		
		    		$("#log_result_div").append($naviRow);
	    		}
	    		else
	    		{
	    			var $row = $('<div class="row justify-content-center my-1"></div>');
	    			var $noResultCol = $('<div class="col-6 col-md-6 col-lg-12 text-center my-1"><h3>검색 결과가 없습니다.</h3></div>');
	    			$row.append($noResultCol);
	    			$("#log_result_div").append($row);
	    		}

	    	})
	    }
	    
    });
    
    onload = function()
    {
		
    };
</script>
</html>