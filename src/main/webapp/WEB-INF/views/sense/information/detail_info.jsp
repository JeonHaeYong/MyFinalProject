<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>OX 상식 퀴즈</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"
	rel="stylesheet">
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
<!--  로그인 style-->
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>

<style>
.jumbotron {
	background-color: white;
}

.jumbotron>img {
	width: 100%;
	height: 700px;
}

#title {
	width: 100%;
	text-align: center;
	margin: auto;
	margin-bottom: 50px;
}

h3, h1 {
	font-family: 'Gamja Flower', cursive;
}

.container {
	border: 0px solid black;
	min-width: 400px;
	box-sizing: border-box;
	text-align: center;
	margin-bottom: 100px;
}

.info-box {
	padding: 10px;
	text-align: center;
	margin: 0px;
	margin-top: 25px;
	padding: 0px;
}

.menu-box {
	width: 150px;
	height: 100px;
	color: #754F44;
	font-family: 'Gamja Flower', cursive;
	font-size: 22px;
	margin-top: 50px;
}

.menu-box>div {
	height: 35px;
}

.menu-box>div:first-child {
	font-weight: bold;
	border-bottom: 1px solid #754F44;
	line-height: 33px;
	color: #B45F04;
	font-size: 40px;
}

.menu-box>div:not (.s-menu ):hover {
	background-color: #FBFFB950;
}

.menu-row {
	text-align: -webkit-center;
}

a[name="s-menu"] {
	color: #754F44;
	text-decoration-line: none;
}

a[name="s-menu"]:hover {
	color: #754F44;
	text-decoration-line: none;
	font-weight: bold;
}

/* -------------------infobox -----------------   */

.infowrapper{
font-family: 'Gamja Flower', cursive;
box-sizing:border-box;
}
.infotitle{
font-size:30px;
border-bottom: 1px solid #754F4470;
text-align:left;
padding-left:40px;
}
.infodate{
margin-top:2px;
text-align:right;
}
/*btn  */
#updatewrite,#tomainboard{
font-family: 'Gamja Flower', cursive;
background-color:#FDD69270;
color:#754F44;
}
#updatewrite:hover,#tomainboard:hover{
background-color:#FDD692;
font-weight:bold;
}

</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron px-0 pb-0">
		<img src="/resources/images/dog_7.png">
	</div>
	<!--  body부분-->
	<div id="title">
		<h1>유용한 정보</h1>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
				<div class="row menu-box">
					<div class="col-12 s-menu">M E N U</div>
					<div class="col-12 ">
						<a name="s-menu" href="oxQuiz">OX QUIZ</a>
					</div>
					<div class="col-12">
						<a name="s-menu" href="">반려동물 상식</a>
					</div>
					<div class="col-12">
						<a name="s-menu" href="information_t">반려동물 정보</a>
					</div>
					<c:choose>
						<c:when test="${type == 4}">
							<div class="col-12">
								<a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a>
							</div>
							<!-- 관리자만 볼 수 있게! -->
						</c:when>
						<c:otherwise>
							<div class="col-12" hidden>
								<a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-1"></div>
			<div class="col-lg-9 col-md-8 col-sm-12 col-12 info-box">
				<!--정보   -->

				<div class="row .infinite">
				
						<div class="col-lg-12 col-md-12 col-sm-12 dtocol">
					
							<div class=infowrapper>
								<div class=infotitle> No ${dto.seq}. ${dto.title}</div>
								<div class="infodate">${dto.writeDate}</div>
								<div class=infotext>${dto.contents}</div>
							</div>
						</div>
				


				</div>
			</div>
		</div>
		<div class="row mt-5" align="right">
			<div class="col-12">
				<div>
				 <button id="tomainboard" class="btn">글목록으로</button>
                        	<c:if test="${type==4}">
					<button id="updatewrite" class="btn">글수정</button>
					
					<script>
					document.getElementById("updatewrite").onclick = function(){
				           location.href = "updatewrite?seq=${dto.seq}";
				       }
					</script>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	</div>


	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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


	<!--정보 스크립트 코드   -->
	<script>
	   
	   document.getElementById("tomainboard").onclick = function(){
           location.href = "information_t?currentPage=1";
       }
	  </script>


	
</body>
</html>