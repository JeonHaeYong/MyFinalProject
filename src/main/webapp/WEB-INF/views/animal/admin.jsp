<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Input Data</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"rel="stylesheet">
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!--  module-->
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
<style>
	.jumbotron{background-color:white; padding-top:80px;}
     .jumbotron>img{width:100%; height:600px;}
     .container{margin-bottom: 30px; color: #754F44; }
     .header{background-color: #EC7357; color: white; text-align: center; font-size: 25px; height: 40px; line-height: 40px; font-family:'Gamja Flower', cursive;}
     .header>div{padding: 0px;}
     .section{text-align: center; margin-top:30px;}
    
     h1{font-family:'Gamja Flower', cursive; text-align:center;}
     .footer{text-align: center; padding-top:15px; font-size: 18px;}
     .menu-bar{text-align: center; height: 200px; font-family:'Gamja Flower', cursive; margin-bottom:40px;}
     .menu-bar>div{height: 40px;}
     .menu-bar>div:not(.menu){line-height: 40px;}
     .menu-bar>div:not(.menu):hover{background-color: #FBFFB950; font-weight: bold; }
     .menu-bar div:first-child{font-size: 25px; font-weight: bold;  border-bottom: 1px solid black; color: #754F44;}
     a[name="s-menu"]{color: #754F44; text-decoration-line: none; font-size:20px;}
     a[name="s-menu"]:hover{color: #754F44;}
     .btns{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44; font-size:30px; margin-top:10px; border-radius:30px; border:none;
     		height: 65px; width:270px;}
	.btns:hover{background-color:#FDD692; font-weight:bold; color:#754F44;}
	
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
   <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	  <div class="jumbotron px-0 pb-0">
	   		<img  src="/resources/images/dog_8.jpg">
        </div>
        <div class="container contents">
     
           <div class="row">
               <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-bar">
                   <div class="menu">MENU</div>
                    <div><a href="" name="s-menu">유기동물조회</a></div>
                   <div><a href="" name="s-menu">임시보호중</a></div>
                   <div><a href="toHospital?currentPage=1" name="s-menu">동물병원 조회</a></div>
                   <div><a href="toCenter?currentPage=1" name="s-menu">보호센터 조회</a></div>
                   <div><a href="inputData.admin" name="s-menu">관리자 설정</a></div>
               </div>
               
               <div class="col-1"><!--메뉴바랑 리스트 사이 빈 공간--></div>
                 
               <div class="col-lg-8 col-md-7 col-sm-12 col-12">
                <div class="row">
                	<div class="col-12 title"><h1>관리자 설정</h1></div>
                </div>
          		<div class="row section">
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="서울병원 데이터 삽입" class="seoul-btn btns">
          			</div>
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="서울병원 데이터삭제 " class="seoul-delete-btn btns">
          			</div>
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="경기병원 데이터 삽입" class="gyeonggi-btn btns">
          			</div>
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="경기병원 데이터삭제" class="gyeonggi-delete-btn btns">
          			</div>
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="울산병원 데이터 삽입" class="ulsan-btn btns">
          			</div>
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="울산병원 데이터삭제" class="ulsan-delete-btn btns">
          			</div>
          			
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="보호소 데이터" class="center-btn btns">
          			</div>
          			<div class="col-lg-6 col-md-6 col-12">
          				<input type="button" value="보호소 데이터 삭제" class="center-delete-btn btns">
          			</div>
          		</div>
               </div>
           </div>
        </div>
	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
   <jsp:include page="/WEB-INF/views/module/footer.jsp" ></jsp:include>
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
</body>
<script>
	$(".seoul-btn").on("click",function(){
		alert("5~10분정도 시간이 소요됩니다.");
		$.ajax({
			url:"seoulHospitalData"
		}).done(function(resp){
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
	
	$(".gyeonggi-btn").on("click",function(){
		alert("5~10분정도 시간이 소요됩니다.");
		$.ajax({
			url:"gyeonggiHospitalData"
		}).done(function(resp){
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
	$(".ulsan-btn").on("click",function(){
		alert("5~10분정도 시간이 소요됩니다.");
		$.ajax({
			url:"ulsanHospitalData"
		}).done(function(resp){
			console.log(resp);
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
	$(".center-btn").on("click",function(){
		alert("5~10분정도 시간이 소요됩니다.");
		$.ajax({
			url:"insertCenterData"
		}).done(function(resp){
			console.log(resp);
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
	$(".seoul-delete-btn").on("click",function(){
		$.ajax({
			url:"deleteHospitalData",
			data:{area:"seoul"}
		}).done(function(resp){
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
	$(".gyeonggi-delete-btn").on("click",function(){
		$.ajax({
			url:"deleteHospitalData",
			data:{area:"gyeonggi"}
		}).done(function(resp){
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
	$(".ulsan-delete-btn").on("click",function(){
		$.ajax({
			url:"deleteHospitalData",
			data:{area:"ulsan"}
		}).done(function(resp){
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
	$(".center-delete-btn").on("click",function(){
		$.ajax({
			url:"deleteCenterData"
		}).done(function(resp){
			if(resp == '1'){
				alert("성공");
			}else{alert("실패");}
		});
	});
</script>
</html>