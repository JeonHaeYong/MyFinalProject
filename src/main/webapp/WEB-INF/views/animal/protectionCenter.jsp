<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라온펫 - 동물유기보호소 센터 조회</title>
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
     .jumbotron>img{width:100%; height: 600px; margin-bottom: 50px;}
     .container{margin-bottom: 30px; color: #754F44;}
     .header{background-color: #EC7357; color: white; text-align: center; font-size: 25px; height: 40px; line-height: 40px; font-family:'Gamja Flower', cursive;}
     .header>div{padding: 0px;}
     .section{text-align: center; border-bottom: 1px solid black;}
     .section:hover{background-color: #FDD69250;}
     .section>div{padding: 0px;}
     .section>div:not(.addr){line-height: 50px;}
     .addr{text-align: left;}
     .footer{text-align: center; padding-top:15px; font-size: 18px;}
     .menu-bar{text-align: center; height: 250px; font-family:'Gamja Flower', cursive; margin-bottom:40px; }
   
     .menu-bar>div:not(.menu){line-height: 40px;}
     .menu-bar>div:not(.menu):hover{background-color: #FBFFB950; font-weight: bold; }
     .menu-bar div:first-child{font-size: 40px; font-weight: bold;  border-bottom: 1px solid black; color:#B45F04;}
      a[name="s-menu"]{color: #754F44; text-decoration-line: none; font-size:20px;}
      a[name="s-menu"]:hover{color: #754F44;}
      .navi-btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44; border:none; border-radius:30px; margin-left:5px; width:40px;}
     .navi-btn:hover{background-color:#FDD692; font-weight:bold;}
     .search-box{margin-bottom:10px;}
     .search-box>div{padding:0px;}
     .search-btn{background-color:#FDD692; border:none; font-family:'Gamja Flower', cursive; font-size:20px; padding: 0px 3px;}
     .search-btn:hover{background-color:#fcc96f; font-weight:bold;}
     .contents{max-width:1700px;}
     #abandoned_link
	{
		color: #EC7357 !important;
		font-weight: 600 !important;
	}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
   <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	 <div class="jumbotron jumbotron-fluid">
           <img  src="/resources/images/cat_2.jpg">
        </div>

        <div class="container contents">
           <div class="row search-box">
           		 <div class="col-lg-2 col-md-3 col-sm-12 col-12"></div>
           		 <div class="col-1"></div>
           		<div class="col-lg-8 col-md-7 col-sm-12 col-12">
           		<select id="search"><option value="" selected disabled hidden>==지역선택==</option>
           			<option>강원도</option><option>경기도</option><option>경상남도</option>
           			<option>경상북도</option><option>경상남도</option><option>대구광역시</option>
           			<option>대전광역시</option><option>부산광역시</option><option>서울특별시</option>
           			<option>세종특별자치시</option><option>울산광역시</option><option>인천광역시</option>
           			<option>전라남도</option><option>전라북도</option><option>충청남도</option><option>충청북도</option></select>
           		<input type="button" class="search-btn" value="검색">
           		</div>
           </div>
           <div class="row">
               <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-bar">
                   <div class="menu">M E N U</div>
                   <div><a href="toAbandoned?currentPage=1" name="s-menu">유기동물조회</a></div>
                   <div><a href="listTempProtect?currentPage=1" name="s-menu">임시보호중</a></div>
                   <div><a href="toHospital?currentPage=1" name="s-menu">동물병원 조회</a></div>
                   <div><a href="toCenter?currentPage=1" name="s-menu">보호센터 조회</a></div>
                    <c:choose>
                   		<c:when test="${type==4 }">
                   			<div><a href="inputData.admin" name="s-menu">관리자 설정</a></div>
                   		</c:when>
                   		<c:otherwise>
                   			<div hidden><a href="inputData.admin" name="s-menu">관리자 설정</a></div>
                   		</c:otherwise>
                   </c:choose>
               </div>
               
               <div class="col-1"><!--메뉴바랑 리스트 사이 빈 공간--></div>
                 
               <div class="col-lg-8 col-md-7 col-sm-12 col-12">
                 <div class="row header">
               		<div class="col-lg-1  d-none d-lg-block ">No.</div>
                	<div class="col-lg-3 col-md-3 col-12 ">보호소</div>
                	<div class="col-lg-3 col-md-3 d-none d-md-block ">전화번호</div>
                	<div class="col-lg-5 col-md-6 d-none d-md-block ">주소</div>
           	   </div>
            <!--section start-->
            <c:forEach var="list" items="${list }">
            	<div class="row section">
                	<div class="col-lg-1  d-none d-lg-block ">${list.rown}</div>
                	<div class="col-lg-3 col-md-3 col-12 ">${list.center }</div>
                	<div class="col-lg-3 col-md-3 col-12">${list.tel }</div>
                	<div class="col-lg-5 col-md-6  col-12">${list.address }</div>
                	
            	</div>
			</c:forEach>
          

          
            <!--section end-->
            <!--footer-->
            <div class="row footer">
                <div class="col-12">
                ${navi} 
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
   <script>

		$(".pageNum").each(function(index,items){
			if($(this).text() == ${currentPage}){
				$(this).css("color","#EC7357");
				$(this).css("font-weight","bold");
			}
		});
		$(".search-btn").on("click",function(){
			var option = $("#search option:selected").val();
			if(search == ""){
				alert("지역을 선택해주세요.");
			}
			else{
				location.href="searchToCenter?currentPage=1&&option="+option;
			}
		});
		$(".pageNum").each(function(index,items){ // 네비버튼 클릭
			$(this).on("click",function(){
				var currentPage = $(this).val();
				location.href="toCenter?currentPage="+currentPage;
			})
		});
		$(".prev").on("click",function(){
			var currentPage = $(".prev").attr("currentPage");
			location.href="toCenter?currentPage="+currentPage;
		});
		$(".next").on("click",function(){
			var currentPage = $(".next").attr("currentPage");
			location.href="toCenter?currentPage="+currentPage;
		});
		$(".opt-pageNum").each(function(index,items){ // 네비버튼 클릭-검색
			$(this).on("click",function(){
				var currentPage = $(this).val();
				var option = $(this).attr("option");
				location.href="searchToCenter?currentPage="+currentPage+"&&option="+option;
			})
		});
		$(".opt-prev").on("click",function(){
			var currentPage = $(".prev").attr("currentPage");
			var option = $(this).attr("option");
			location.href="searchToCenter?currentPage="+currentPage+"&&option="+option;
		});
		$(".opt-next").on("click",function(){
			var currentPage = $(".next").attr("currentPage");
			var option = $(this).attr("option");
			location.href="searchToCenter?currentPage="+currentPage+"&&option="+option;
		});

		
</script>
</body>
</html>