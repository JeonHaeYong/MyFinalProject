<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
<style>
	.myJumbo{
		background-color: white;
	}
	#jumboImg{
		width: 100%;
		max-height: 600px;
	}
/* 	.myCard{ */
/* 		height: 150px; */
/* 	} */
	.imageBox{
		width: 150px;
	}
	#itemImage{
		width: 100%; 
		height: 100%;
	}
	#lab{
		color: white;
	}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron myJumbo pr-0 pl-0 pb-2">
		<img src="/resources/images/payment.jpg" id="jumboImg">
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12 align-self-center text-center">
				<h1>구매하기</h1>
			</div>
		</div>
		<div class="row m-3">
			<c:forEach var="dto" items="${items }" varStatus="status">
				<div class="col-lg-12 col-12 d-flex justify-content-center">
					<div class="card mb-3 myCard" style="width: 90%;">
						<div class="row no-gutters">
							<div class="col-md-4 imageBox">
								<img src="/resources/images/item/item1.jpg" class="card-img itemImage">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">상품명 : ${dto.name }</h5>
									<p class="card-text">금액 : ${dto.price }원</p>
									<p class="card-text"><small class="text-muted">판매자 : ${dto.seller }</small></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-12">
				전체 금액 : ${totalAmount }원
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<h5>구매자 정보</h5>
			</div>
			<div class="col-12 d-flex justify-content-center">
				<form>
					<div class="form-group">
						<label for="inputName">이름</label>
						<input type="text" class="form-control" id="inputName" value="${member.name }">
					</div>
					<div class="form-group">
						<label for="inputEmail">이메일</label>
						<input type="email" class="form-control" id="inputEmail" value="${member.email }">
					</div>
					<div class="form-group">
						<label for="inputPhone">전화번호</label>
						<input type="tel" class="form-control" id="inputPhone" value="${member.phone }">
					</div>
					<div class="form-row">
						<div class="form-group col-8">
							<label for="zipcode">우편번호</label>
							<input type="text" class="form-control" id="zipcode" value="${member.zipcode }">
						</div>
						<div class="form-group col-4">
							<label for="zipcode" id="lab">우</label>
							<button type="submit" class="btn btn-primary m-auto p-auto form-control">찾기</button>
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">주소</label>
						<input type="text" class="form-control" id="inputAddress" value="${member.address1 }">
					</div>
					<div class="form-group">
						<label for="inputAddress2">상세주소</label>
						<input type="text" class="form-control" id="inputAddress2" value="${member.address2 }">
					</div>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
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
</body>
</html>