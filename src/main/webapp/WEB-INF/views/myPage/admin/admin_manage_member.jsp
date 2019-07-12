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
					
					<div class="row justify-content-center mt-5">
						
						<div id="search_result_div" class="col-12 col-md-12 col-lg-12 text-center my-1"></div>
						
					</div>
					
					
					
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-6 text-center my-5">
							
							<input id="reason_text" class="form-control" type="text" placeholder="계정 정지 사유를 입력하세요">
							
						</div>
						
						<div class="col-4 col-md-4 col-lg-2 text-center my-5">
							
							<input id="black_btn" class="btn btn-danger no_radius" type="button" value="등록하기">
							
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-6 text-center my-5">
							
							<input id="release_id_text" class="form-control" type="text" placeholder="차단 해제할 아이디를 입력하세요">
							
						</div>
							
						<div class="col-4 col-md-4 col-lg-2 text-center my-5">
								
							<input id="release_btn" class="btn btn-danger no_radius" type="button" value="해제하기">
								
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
					var $row = $('<div class="row justify-content-center my-1"></div>');
	    			var $idCol = $('<div class="col-6 col-md-6 col-lg-4 text-center my-1">'+response[i-1].id+'</div>');
	    			var $statusCol = $('<div class="col-4 col-md-4 col-lg-2 text-center my-1">'+response[i-1].status+'</div>');
	    			var $checkCol = $('<div class="col-2 col-md-2 col-lg-2 text-center my-1"><input class="black_check" name="'+response[i-1].id+'" type="checkbox">'+'블랙리스트 등록'+'</div>');
	    			$row.append($idCol).append($statusCol).append($checkCol);
	    			$("#search_result_div").append($row);
	    			
	    			if(i == 20)
	    			{
	    				break;
	    			}
	    		}
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
		});
	    
	    $("#black_btn").on("click", function()
		{
	    	var reasonValue = $("#reason_text").val();
	    	var $checkboxClass = $(".black_check"); 
	    	var checkboxNumber = $checkboxClass.length;
	    	
	    	var id = "";
	    	
	    	for(var i = 1 ; i <= checkboxNumber ; i++)
	    	{
	    		if($checkboxClass.eq(i-1).prop("checked") == true)
	    		{
	    			id = id + " " + $checkboxClass.eq(i-1).attr("name");
	    		}
	    	}
	    	
	    	var $form = $('<form></form>');
	        $form.attr('action', 'admin-member-black');
	        $form.attr('method', 'POST');
	        $form.appendTo('body');
	         
	        var idArr = $('<input type="hidden" value="'+id+'" name="id">');
	     	var blackReason = $('<input type="hidden" value="'+reasonValue+'" name="reason">')
	        $form.append(idArr).append(blackReason);
	        $form.submit();
		
	       	 
	    	
		});
	    
	    $("#release_btn").on("click", function()
		{
	    	var $form = $('<form></form>');
	        $form.attr('action', 'admin-member-release');
	        $form.attr('method', 'POST');
	        $form.appendTo('body');
	         
	        var id = $('<input type="hidden" value="'+$("#release_id_text").val()+'" name="id">');
	        $form.append(id);
	        $form.submit();
	    	
		});
	    
    });
    
	
	
    onload = function()
    {
		
    };
</script>
</html>