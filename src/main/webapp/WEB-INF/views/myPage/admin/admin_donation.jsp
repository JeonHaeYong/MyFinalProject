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
}
.menu_btns:hover{
	background-color:#FDD692;
	font-weight:bold !important;
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


</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
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
	
			</div>
			
			
			
			
			
			<div class="row justify-content-center">

				<div class="col-12 col-md-12 col-lg-12 text-center my-5">

					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-12 text-center my-3">
						
							<h2>후원 업체 변경</h2>
						
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
						
							<textarea id="explanation_text" class="form-control"></textarea>
						
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
						
							<h2>사진 변경</h2>
								
						</div>
						
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
								
							<label>좌측 사진</label>
								
						</div>
								
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
								
							<input id="left_file" class="form-control" name="left" type="file">
								
						</div>
								
					</div>
					
					<div class="row justify-content-center">
								
						<div class="col-12 col-md-12 col-lg-2 text-center my-1">
								
							<label>우측 사진</label>
								
						</div>
								
						<div class="col-12 col-md-12 col-lg-10 text-center my-1">
								
							<input id="right_file" class="form-control" name="right" type="file">
								
						</div>
								
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 col-md-12 col-lg-12 text-center my-5">
						
							<input id="image_change_btn" class="btn my_buttons" type="button" value="사진 변경">
						
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
		
		$("#name_text").val("후원 업체 명");
		$("#title_text").val("제목입니다");
		$("#explanation_text").val("설명 설명");
		$("#goalmoney_text").val("1000000");
		$("#startdate_text").val("2019-07-01");
		$("#enddate_text").val("2019-07-30");
		
		
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
			
// 			var check = true;
// 			while(check)
// 			{
// 				if(($image1.val() == "") && ($image2.val() != ""))
// 				{
// 				}
// 			}
	        
	        var $goalmoney = $('<input type="hidden" name="goalmoney">');
	        $goalmoney.val($("#goalmoney_text").val());
	        
	        var $startdate = $('<input type="hidden" name="startdate">');
	        $startdate.val($("#startdate_text").val());
	        
	        var $enddate = $('<input type="hidden" name="enddate">');
	        $enddate.val($("#enddate_text").val());
	        
	        $form.append($name).append($title).append($explanation)
	        .append($image1).append($image2).append($image3)
	        .append($goalmoney).append($startdate).append($enddate);
	        $form.submit();
		});
	    
	    
	    $("#image_change_btn").on("click", function()
		{
	    	var leftValue = $("#left_file").val();
	    	var rightValue = $("#right_file").val();
	    	
	    	var $form = $('<form></form>');
	        $form.attr('action', 'admin-donation-image');
	        $form.attr('method', 'POST');
	        $form.attr('enctype', 'multipart/form-data');
	        $form.appendTo('body');
	        
	        if((leftValue != "") && (rightValue == ""))
	        {
	        	$form.append("#left_file");
	        }
	        else if((leftValue == "") && (rightValue != ""))
	        {
	        	$form.append($("#right_file"));
	        }
	        else if((leftValue != "") && (rightValue != ""))
	        {
	        	$form.append($("#left_file")).append($("#right_file"));
	        }
	        
	        if((leftValue != "") || (rightValue != ""))
	        {
	        	$form.submit();
	        }
		});
	    
	    
    });
    
    onload = function()
    {
		
    };
</script>
</html>