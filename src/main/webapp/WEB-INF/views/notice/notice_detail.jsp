<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
#container *
{
	font-family: 'SeoulNamsanM';
}
#mypage_link
{
	color: #EC7357 !important;
	font-weight: 600 !important;
}


.my_buttons{
font-family: 'Gamja Flower', cursive !important;
background-color:#FDD69270;
color:#754F44;
}
.my_buttons:hover {
background-color:#FDD692;
font-weight:bold;
}


.border-lr
{
	border-left: 1px solid #FDD69270;
	border-right: 1px solid #FDD69270;
}
.border-b
{
	border-bottom: 1px solid #FDD69270;
}	


.font-20
{
	font-size: 20px !important;
}
.font-45
{
	font-size: 45px !important;
}

#notice_link
{
	color: #EC7357 !important;
	font-weight: 600 !important;
}

</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->


	<section class="site-section block-13">

		<div id="container" class="container">

			<div class="row justify-content-center mb-5 border-b">

				<div class="col-8 col-md-8 col-lg-8 my-3">

					<h2 class="font-45">${dto.title}</h2>

				</div>
				
				<div class="col-2 col-md-2 col-lg-2 text-center my-3 border-lr font-20">

					${dto.write_time}

				</div>
				
				<div class="col-2 col-md-2 col-lg-2 text-center my-3 font-20">

					${dto.view_count}

				</div>

			</div>
			
			<div class="row justify-content-center mt-5">
			
				<div class="col-12 col-md-12 col-lg-12 my-5 bt font-20">

					${dto.contents}

				</div>
				
			</div>
			
			<div class="row justify-content-center mt-5">
			
				<div class="col-12 col-md-12 col-lg-12 text-right my-5">

					<input id="back_btn" class="btn my_buttons" type="button" value="돌아가기">
					
					<c:if test="${type == 4}">
					
						<input id="update_btn" class="btn my_buttons" type="button" value="수정하기">
						
						<input id="delete_btn" class="btn my_buttons" type="button" value="삭제하기">
						
					</c:if>
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
		$("#back_btn").on("click", function()
		{
// 			history.back();
			location.href = "notice-view-page";
		});
		
		
		
    });
    
    onload = function()
    {
		
    };
</script>
<c:if test="${type == 4}">
<script>

	$("#update_btn").on("click", function()
	{
		location.href = "notice-update-page?seq=${dto.seq}";
	});
	$("#delete_btn").on("click", function()
	{
		location.href = "notice-delete-do?seq=${dto.seq}";
	});

</script>
</c:if>
</html>