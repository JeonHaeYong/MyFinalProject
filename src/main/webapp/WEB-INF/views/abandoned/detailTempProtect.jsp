<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
<style>
 @font-face {
 	font-family: 'SeoulNamsanM';
 	src: */
 		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/SeoulNamsanM.woff') */
 		format('woff'); 
 	font-weight: normal; 
 	font-style: normal; 
}
table {
	width: 760px;
}

th {
	
	border-bottom: 1px solid #cfcfcf;
	text-align: center;
	padding: 5px;
}

td {
	border-bottom: 1px solid #cfcfcf;
	padding-left: 10px;
}

#toList {
	text-align: center;
}

.btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44;}
.btn:hover{background-color:#FDD692; font-weight:bold;}
.selected_navi {
	color: #EC7357 !important;
	font-weight: 600;
}

.menu-bar{
	text-align:center;
	height:200px;
}
.menu-bar>div {
	height: 40px;
}

.menu-bar>div:not (.menu ):hover {
	background-color: #FBFFB950;
	font-weight: bold;
}

.menu-bar div:first-child {
	font-size: 20px;
	font-weight: bold;
	border-bottom: 1px solid black;
	color: #754F44;
}
.menu-row {
	text-align: -webkit-center;
}

.s-menu1>a {
	text-decoration: none;
	color: black;
	font-size: 20px;
	font-family: 'Gamja Flower', cursive;
}

.s-menu1:hover {
	background-color: #F3F78130;
}

.s-menu1 {
	padding-top: 10px;
	padding-left: 0px;
	padding-right: 0px;
}

.s-menu {
	color: #B45F04;
	border-bottom: 2px solid black;
}

.menu-box {
	width: 150px;
	height: 100px;
	padding-bottom: 120px;
	margin-bottom: 150px;
}

.inputHidden {
	background-color: none;
	border: none;
}
.jumbotron {
	background-color: white;
	padding:0px 0px;
}

.jumbotron>img {
	width: 100%;
	max-height: 600px;
}

</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----ì¬ê¸°ê¹ì§ ê³ ì  Headerìëë¤----------------------------------------------------------------------------------------------------------- -->
	<section class="site-section bg-light block-13">
		<div class="jumbotron px-0 pb-0">
			<img src="/resources/images/abandoned/girlndog.png">
		</div>
		<div class="container">

			<div class="row">
				<!--작은 메뉴랑 게시판목록이랑 나누는 row-->
				<div class="col-lg-2 col-md-2 col-sm-12 col-12 menu-bar">
					<!--작은 메뉴바-->
					<div class="menu">MENU</div>
					<div class="s-menu1">
						<a href="toAbandoned?currentPage=1">유기동물조회</a>
					</div>
					<div class="s-menu1">
						<a href="listTempProtect?currentPage=1">임시보호중</a>
					</div>
					<div class="s-menu1">
						<a href="toHospital?currentPage=1">동물병원 조회</a>
					</div>
					<div class="s-menu1">
						<a href="toCenter?currentPage=1">보호센터 조회</a>
					</div>
				</div>

				<div class="col-1">
					<!--메뉴바랑 리스트 사이 빈 공간-->
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-12 row">
					<div class="text-center" style="margin: auto; margin-bottom: 40px;">
						<h2>임시보호중</h2>
					</div>

					<table class="table table-striped">
						<tbody>
							<tr>
								<th scope="row" width="15%">제목</th>
								<td width="20%">${dto.title }</td>

								<td colspan="2" rowspan="3" style="width: 15%"><img
									src="${dto.imagePath }" style="width: 200px; height: 150px"></td>

							</tr>
							<tr>
								<th scope="row">시도</th>
								<td>${dto.sido }</td>


							</tr>
							<tr>
								<th scope="row">시군구</th>
								<td>${dto.sigungu }</td>


							</tr>
							<tr>
								<th scope="row">발견 장소</th>
								<td>${dto.place }</td>
								<th width="15%">발견 날짜</th>
								<td width="20%"><fmt:formatDate value="${dto.findDate }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<th scope="row">품종</th>
								<td>${dto.type }</td>
								<th>성별</th>
								<td>${dto.sex }</td>
							</tr>
							<tr>
								<th scope="row">색깔</th>
								<td>${dto.sex }</td>
								<th>특징</th>
								<td>${dto.feat }</td>
							</tr>
							<tr>
								<th scope="row">연락처</th>
								<td>${dto.phone }</td>
								<th>작성자 ID</th>
								<td>${dto.writer }</td>
							</tr>
						</tbody>
					</table>
					<div style="margin: auto">
						<button type="button" class="btn btn-sm" onclick="goBack();">목록</button>
						<c:if test="${loginId == dto.writer }">
							<button type="button" id="modify" class="btn btn-sm">수정</button>
							<button type="button" id="delete" class="btn btn-sm">삭제</button>
						</c:if>
					</div>
				</div>
			</div>
	</section>

	<!-- ----Footerë¶ë¶ìëë¤^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script>
	function goBack() {
		window.history.back();
	}
		$(function(){
			
			$("#modify").on("click",function(){
				location.href="toModifyPageTempProtect?seq=${dto.seq}";
			})
			$("#delete").on("click",function(){
				location.href="deleteMyTempProtect?seq=${dto.seq}";
			})
		})
		
	</script>
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
</html>