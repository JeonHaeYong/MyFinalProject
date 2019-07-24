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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
<script>
	$(function() {
		$("#write").on("click", function() {
			if(${loginId!=null}){
				location.href = "writeTempProtect";
			}else{
				alert("로그인을 해 주세요.");
				$(".login-btn").trigger("click");
			}	
		});
	});
</script>
<style>
body {
	color: #754F44;
}

.card {
	width: 243px;
	min-width: 243px;
	max-width: 243px;
}

.card-body {
	height: 200px;
	padding: 0px 0px;
	margin-bottom: 20px;
}

.title {
	width: 37%;
	margin-bottom: 0px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.content {
	width: 57%;
	margin-bottom: 0px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.naviBtn {
	cursor: pointer;
	font-family: 'Gamja Flower', cursive;
	font-size: 23px;
}

a:hover {
	color: #EC7357;
}

#write {
	background-color: #EC7357;
	color: white;
	border-radius: 5px;
	padding: 10px 10px;
}

.selected_navi {
	color: #EC7357 !important;
	font-weight: 600;
}

.naviBtn:hover {
	font-weight: 600;
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

#dataNotExist {
	text-align: center;
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
			<img src="/resources/images/abandoned/girlndog.jpg">
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
						<a href="">동물병원 조회</a>
					</div>
					<div class="s-menu1">
						<a href="">보호센터 조회</a>
					</div>
				</div>

				<div class="col-1">
					<!--메뉴바랑 리스트 사이 빈 공간-->
				</div>

				<div class="col-lg-9 col-md-9 col-sm-12 col-12">
					<div class="text-center" style="margin: auto; margin-bottom: 40px;">
						<h2>임시보호중</h2>
					</div>
					<div style="font-weight: 600; margin-bottom: 20px;">
						** 잃어버린 반려동물을 찾아서 임시보호중인 분께 연락해 보세요.<br> ** 길거리에 유기되거나 실종된
						반려동물을 임시보호하고 계신 분은 글 작성 버튼을 통해 정보를 올려주세요.
					</div>
					<div class="text-right" style="margin-botom: 20px;">
						<button type="button" id="write" class="btn btn-sm">글 작성</button>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-12 col-12 menu-bar"></div>
				<div class="col-1"></div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-12">
					<div class="row">
						<c:if test="${list != null }">
							<c:forEach var="dto" items="${list}">

								<div class="card myCard col-lg-4 col-md-4 col-sm-12">
									<a href="detailTempProtect?seq=${dto.seq }"><img
										src="${dto.imagePath }" class="card-img-top" alt="..."
										style="width: 211px; height: 150px; margin-bottom: 10px"></a>
									<div class="card-body">

										<p class="card-text">
											<label class="title"><strong>제목</strong> </label><label
												class="content">${dto.title}</label><br> <label
												class="title"><strong>시도 </strong> </label><label
												class="content">${dto.sido }</label> <label class="title"><strong>시군구
											</strong></label><label class="content">${dto.sigungu }</label><br> <label
												class="title"><strong>발견 장소</strong></label><label
												class="content">${dto.place }</label><br> <label
												class="title"><strong>발견 날짜 </strong></label><label
												class="content"><fmt:formatDate
													value="${dto.findDate }" pattern="yyyy-MM-dd" /></label><br>
											<label class="title"><strong>품종 </strong></label><label
												class="content">${dto.type }</label><br>
										</p>
									</div>
								</div>

							</c:forEach>
						</c:if>
						<c:if test="${listsize == 0 }">
							<div id="dataNotExist">해당 데이터가 존재하지 않습니다.</div>
						</c:if>
					</div>
					<div id="naviBox" style="margin: auto" class="text-center">
						<c:if test="${pageNavi.needPrev == 1 }">
							<a class="naviBtn mx-3" currPage="${pageNavi.startNavi - 1 }">&laquo;&nbsp;</a>
						</c:if>
						<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
							<a class="naviBtn mx-3" currPage="${pageNavi.currentPage - 1}">&lt;&nbsp;</a>
						</c:if>
						<c:forEach var="i" begin="${pageNavi.startNavi}"
							end="${pageNavi.endNavi}">
							<c:if test="${i==pageNavi.currentPage}">
								<a class="naviBtn mx-3 selected_navi" currPage="${i }">${i }&nbsp;</a>
							</c:if>
							<c:if test="${i!=pageNavi.currentPage}">
								<a class="naviBtn mx-3" currPage="${i }">${i }&nbsp;</a>
							</c:if>

						</c:forEach>
						<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
							<a class="naviBtn mx-3" currPage="${pageNavi.currentPage + 1}">&gt;&nbsp;</a>
						</c:if>
						<c:if test="${pageNavi.needNext == 1 }">
							<a class="naviBtn mx-3" currPage="${pageNavi.endNavi + 1}">&raquo;</a>
						</c:if>
					</div>

				</div>

			</div>


		</div>




	</section>
	<!-- ----Footerë¶ë¶ìëë¤^_^---------------------------------------------------------------------------------------------------------- -->

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
</body>
<script>
	console.log(${listsize})
	$(".naviBtn").on("click", function() {
		var currPage = $(this).attr("currPage");
		location.href = "listTempProtect?currentPage=" + currPage;
	})
</script>

</html>