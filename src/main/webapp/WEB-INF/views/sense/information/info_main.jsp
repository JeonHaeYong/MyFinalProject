<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>OX 상식 퀴즈</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
		padding: 5rem;
}

.jumbotron>img {
	width: 100%;
		max-height: 600px;
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

/* ----------------------카테고리 */
#profile-tab,#home-tab{
font-family: 'Gamja Flower', cursive;

text-decoration:none;
 color:black;
 font-size:20px;
 }
#profile-tab.active,#home-tab.active{
background-color:#FDD692;
}
/* -------------------infobox -----------------   */
.infowrapper {
	font-family: 'Gamja Flower', cursive;
	box-sizing: border-box;
	height: 300px;
	overflow: hidden;
	border: 2px solid #754F4470;
}

.dtocol {
	padding-top: 50px;
}

.infoimg, .infotext, .infoextra, infoseq {
	overflow: hidden;
}

.infoseq {
	border-bottom: 1px solid #754F4470;
}

.infoimg {
	margin-left: 10px;
	margin-top: 2px;
	margin-right: 10px;
	box-sizing: border-box;
	height: 70%;
}

.inforecommend {
	padding-left: 5px;
	margin-left: 15px;
	margin-right: 15px;
	text-align: left;
	height: 7%;
	box-sizing: border-box;
	overflow: hidden;
}

.infotext {
	border-top: 1px solid #754F4470;
	margin-top: 2px;
	font-size: 15px;
	line-height: 50px;
	text-align: center;
	margin-left: 10px;
	margin-right: 10px;
	
	height: 18%;
	margin-top: 2px;
}

.infoimg>a>img {
	width: 100% !important;
	top: 0;
	left: 0;
	height: 100% !important;
}

#infowrite, #infodel,.infonavi ,.t_navi {
	border: 0;
	background-color: #FDD69270;
	color: #754F44;
	font-family: 'Gamja Flower', cursive;
}

#infowrite:hover, #infodel:hover,.infonavi:hober, .t_navi:hover {
	background-color: #FDD692;
	font-weight: bold;
}
.btngroup{
padding-right:105px;
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
                        <div class="col-12 "><a name="s-menu" href="oxQuiz">OX QUIZ</a></div>
                          <div class="col-12"><a name="s-menu" href="information_t?currentPage=1">반려동물 정보</a></div>
                            <c:choose>
                        	<c:when test="${type == 4}">
                        		<div class="col-12"><a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a></div> <!-- 관리자만 볼 수 있게! -->
                        	</c:when>
                        	<c:otherwise>
                        		 <div class="col-12" hidden><a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a></div> 
                        	</c:otherwise>
                        </c:choose> 
				</div>
			</div>
			<div class="col-1"></div>
			<div class="col-lg-9 col-md-8 col-sm-12 col-12 info-box mt-5">
				<!--내용   -->
					
				<ul class="row nav nav-tabs justify-content-center" id="myTab" role="tablist">
		
					<li class="col-lg-6 col-md-6 col-sm-6 col-6 nav-item pr-0">
						<a class=" nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">정보 </a></li>
					
					<li class="col-lg-6 col-md-6 col-sm-6 col-6 nav-item  pl-0"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#training" role="tab"
						aria-controls="training" aria-selected="false">훈련</a></li>
			
				</ul>
				
				<form action="delinfo" method="post" id="delform">
					<div class="tab-content" id="myTabContent">

						<!--반려견정보  -->
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row .infinite">
								<c:forEach var="dto" items="${infodto}">
									<div class="col-lg-4 col-md-6 col-sm-6 col-6 dtocol">
										<div class=infowrapper>
											<div class=infoseq>
												<c:if test="${type == 4}">
												
													<input type=checkbox value="${dto.rank}" name="check">
												</c:if>
												NO.${dto.rank}
											</div>
											<div class=infoimg>
												<a href="detail_info?seq=${dto.seq}" class="detail">${dto.image}</a>
											</div>
											<div class=infotext>${dto.title}</div>
											<div class="inforecommend">${dto.writeDate}</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="row mt-5" align="right">
								<div class="col-12">
									<div>
										<div id="tnavi" align="center">${infonavi }</div>
									</div>
								</div>
							</div>
						</div>

						<!--훈련정보  -->
						<div class="tab-pane fade " id="training" role="tabpanel"
							aria-labelledby="profile-tab">

							<div class="row tdtowrapper">

								<c:forEach var="tdto" items="${tdto}">

									<div class="col-lg-4 col-md-6 col-sm-6 col-6 dtocol">

										<div class=infowrapper>

											<div class=infoseq>
												<c:if test="${type == '4'}">
													<input type=checkbox value="${tdto.seq}" name="check">
												</c:if>
												NO.${tdto.rank}
											</div>

											<div class=infoimg>
												<a href="detail_info?seq=${tdto.seq}" class="detail">${tdto.image}</a>
											</div>
											<div class=infotext>${tdto.title}</div>
											<div class="inforecommend">${tdto.writeDate}</div>
										</div>

									</div>
								</c:forEach>

							</div>
							<div class="row mt-5" align="right">
								<div class="col-12">
									<div>
										<div id="tnavi" align="center">${tnavi}</div>
									</div>
								</div>
							</div>
						</div>


					</div>
				</form>


			</div>

		</div>
	</div>
	<div class="row mt-5 mb-5" >
		<div class="col-lg-12 col-md-12 col-12 btngroup" align="right">

			<c:if test="${type == 4}">
				<button id="infowrite" class="btn">글쓰기</button>
				<button id="infodel" class="btn">글삭제</button>
				<script>
					document.getElementById("infowrite").onclick = function() {
						location.href = "infowrite";
					}

					document.getElementById("infodel").onclick = function() {
						$("#delform").submit();

					}
				</script>

			</c:if>
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
		$(document).on("click", ".infonavi", function() {
			$.ajax({
				url : "info_main",
				type : "post",
				data : {
					currentPage : $(this).attr("value")
				}
			}).done(function(resp) {

				console.log(resp);
				$("#home").html(resp);
			})
		});
		$(document).on("click", ".t_navi", function() {
			$.ajax({
				url : "train_main",
				type : "post",
				data : {
					currentPage : $(this).attr("value")
				}
			}).done(function(resp) {

				console.log(resp);
				$("#training").html(resp);
			})
		});
	</script>

</body>
</html>