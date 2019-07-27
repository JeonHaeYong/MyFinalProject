<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후원하기 - ${dto.name }</title>
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
body{
	background-color: white !important;
}
#left_img, #right_img {
	width: 80%;
	height: auto;
}

#donation_link
{
	color: #EC7357 !important;
	font-weight: 600 !important;
}

.c-img
{
	width: 100% !important;
	height: 500px;
	min-height: 300px;
}

#left_img, #right_img{
	width: 100%;
	height: 300px;
}

.my_buttons {
/* 	border-radius: 0px !important; */
/* 	width: 100%; */
/* 	height: 100%; */
	background-color: #EC7357;
	color: white !important;
}
.my_buttons:hover{
	background-color: #9c2c2c !important;
}

.progress
{
	height: 40px;
}
#progress-bar
{
	height: 50px;
}
</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->


	<section class="site-section block-13">

	<div id="container" class="container">
		<c:choose>
		
			<c:when test="${dto.name != null}">
				
				<div class="row justify-content-center">

					<div class="col-12 col-lg-12 my-5">
						
						<div class="row justify-content-center my-5">
						
							<div class="col-12 text-center">
							
								<h1>${dto.name}</h1>
							
							</div>
							
						</div>
						
						<div class="row justify-content-center">
		
							<div class="col-8 text-center">
		
		
								<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
									<div id="carousel-inner" class="carousel-inner">
										
										<c:if test="${dto.image1 != '없음'}">
											<div class="carousel-item" data-interval="3000">
												<img src="${dto.image1}" class="d-block w-100 c-img" alt="...">
											</div>
										</c:if>
										
										<c:if test="${dto.image2 != '없음'}">
											<div class="carousel-item" data-interval="3000">
												<img src="${dto.image2}" class="d-block w-100 c-img" alt="...">
											</div>
										</c:if>
										
										<c:if test="${dto.image3 != '없음'}">
											<div class="carousel-item" data-interval="3000">
												<img src="${dto.image3}" class="d-block w-100 c-img" alt="...">
											</div>
										</c:if>
										
										<c:if test="${ ((dto.image1 == '없음') && (dto.image2 == '없음')) && (dto.image3 == '없음') }">
											<div class="carousel-item" data-interval="3000">
												<img src="resources/images/dog_1.jpg" class="d-block w-100 c-img" alt="...">
											</div>
										</c:if>
										
									</div>
									<a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev"> 
										<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
									</a> 
									<a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next"> 
										<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
									</a>
								</div>
		
							</div>
		
							<div class="col-4 text-center">
								
								<h2>${dto.title}</h2>
								<br>${dto.explanation}
		
							</div>
		
						</div>
		
					</div>
				
					<div class="col-12 text-center my-5">
		
						<div class="row">
						
							<div class="col-12 col-lg-6 my-3 text-center">
								
								<c:if test="${dto.left != '없음'}">
									<img src="${dto.left}" alt="사진이 없습니다." id="left_img" class="mx-5">
								</c:if>
								
								<c:if test="${dto.left == '없음'}">
									<img src="resources/images/dog_1.jpg" alt="사진이 없습니다." id="left_img" class="mx-5">
								</c:if>
							
							</div>
							
							<div class="col-12 col-lg-6 my-3 text-center">
								
								<c:if test="${dto.right != '없음'}">
									<img src="${dto.right}" alt="사진이 없습니다." id="right_img" class="mx-5">
								</c:if>
								
								<c:if test="${dto.right == '없음'}">
									<img src="resources/images/dog_1.jpg" alt="사진이 없습니다." id="right_img" class="mx-5">
								</c:if>
								
							</div>
						
						</div>
						
						<div class="row">
						
							<div class="col-12 text-center">
							
								<input id="donation_btn" class="btn my_buttons mt-5" type="button" value="후원">
								
							</div>
						
						</div>
		
					</div>
					
				</div>
				
				
				
				
				
				<div id="info_div" class="row justify-content-center">
					
					<div class="col-4 text-center">
		
						<div>
							
							<img src="/resources/images/clock-64.png" alt="사진이 없습니다.">
							<span id="last_time_span"></span>
						
						</div>
		
					</div>
		
					<div class="col-4 text-center">
		
						<div>
							
							<img src="/resources/images/pie-chart-64.png" alt="사진이 없습니다.">
							<span>${dto.currentmoney} / ${dto.goalmoney}</span>
							
						</div>
							
					</div>
					
					<div class="col-4 text-center px-0 my-auto progress">
								
						<div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
							
						</div>
									
					</div>
					
				</div>
				
			</c:when>
			
			<c:otherwise>
				
				<div class="row justify-content-center">

					<div class="col-12 col-lg-12 my-5 text-center">
						
						<h1> 현재 진행중인 후원 업체가 없습니다</h1>	
						
					</div>
					
				</div>
			
			</c:otherwise>
		
		</c:choose>
		
		

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
		$("#carousel-inner div:first-child").addClass("active");
		
	    $("img").on("error", function()
		{
	    	$(this).attr("src","resources/images/dog_1.jpg");
		});
	    
	    $("#donation_btn").on("click", function(){
	    	location.href = "donationForm";
	    });
	    
    });
    
    onload = function()
    {
		
    };
</script>
<c:if test="${dto.currentmoney != null}">
<script>
var percent = Math.floor((${dto.currentmoney}*1) / (${dto.goalmoney}*1) * 100);
$("#progress-bar").attr("style", "width:"+ percent + "%");
$("#progress-bar").text(percent+"%");

var time = "${dto.enddate}";
var forTime = time.substring(5, 7)+"/"+time.substring(8, 10)+"/"+time.substring(0, 4);

CountDownTimer(forTime, 'last_time_span'); //첫번째 인수로 넣은 날짜까지
//	CountDownTimer('01/01/2018 00:00 AM', 'newcountdown'); // 2018년 1월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용합니다.

function CountDownTimer(dt, id)
{
    var end = new Date(dt);
    
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;
    
    var targetId = "#" + id;
    
    var $target = $(targetId);
    
    function showRemaining()
    {
	    var now = new Date();
	    var distance = end - now;
	    if(distance < 0)
	    {
		    
		    clearInterval(timer);
		    $target.text = '종료!';
		    
		    return;
	    }
	    
	    var days = Math.floor(distance / _day);
	    var hours = Math.floor((distance % _day) / _hour);
	    var minutes = Math.floor((distance % _hour) / _minute);
	    var seconds = Math.floor((distance % _minute) / _second);
	    
	    $target.text(days + '일 ' + hours + '시간 ' + minutes + '분 ' + seconds + '초');
    }
    
    timer = setInterval(showRemaining, 1000);
}
// Source: stackoverflow
</script>
</c:if>
</html>