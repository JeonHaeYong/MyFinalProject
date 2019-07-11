<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무료나눔</title>
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
<style>
	.myJumbo{
		background-color: white;
	}
	#jumboImg{
		width: 100%;
		max-height: 720px;
	}
	.myCard{
		width: 90%;
	}
	.cardImg{
 		height: 295px;
	}
	.detail{
		text-decoration: none;
		color: 
	}
	.myBtn{
		background-color: #00000030;
		border-radius: 10px;
		width: 30px;
		padding: 10px;
	}
	.myBtn:hover{
		background-color: #ec7357;
		color: white;
	}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	<div class="jumbotron myJumbo pr-0 pl-0 pb-2">
		<img src="/resources/images/freemarketImage.jpg" id="jumboImg">
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12 align-self-center text-center">
				<h1>무료나눔</h1>
			</div>
		</div>
		<div class="row m-3">
			<c:forEach var="dto" items="${itemList }">
				<div class="col-lg-4 col-md-6 col-12 d-flex justify-content-center mb-4">
					<div class="card myCard">
						<img class="card-img-top cardImg" src="${dto.imagePath1 }" alt="Card image">
						<div class="card-body">
							<h4 class="card-title"><a href="item?seq=${dto.seq }" class="detail">${dto.name }</a></h4>
							<p class="card-text">${dto.price } 원</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="col-12 d-flex justify-content-center" id="naviBox">
				<c:if test="${pageNavi.needPrev == 1 }">
					<a class="btn myBtn" href="freeMarket?currentPage=${pageNavi.startNavi - 1}">&laquo;</a>
				</c:if>
				<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
					<a class="btn myBtn" href="freeMarket?currentPage=${pageNavi.currentPage - 1}">&lt;</a>
				</c:if>
				<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
					<a class="btn myBtn" href="freeMarket?currentPage=${i }" class="pageNum">${i}</a>
				</c:forEach>
				<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
					<a class="btn myBtn" href="freeMarket?currentPage=${pageNavi.currentPage + 1}">&gt;</a>
				</c:if>
				<c:if test="${pageNavi.needNext == 1 }">
					<a class="btn myBtn" href="freeMarket?currentPage=${pageNavi.endNavi + 1}">&raquo;</a>
				</c:if>
			</div>
		</div>
	</div>

	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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
		$(function(){
			$(".nav-link").each(function(i, item){
				if($(item).attr("href")=="freeMarket?currentPage=1"){
					$(this).attr("class", "active");
				}
			})
		})
	</script>
</body>
</html>