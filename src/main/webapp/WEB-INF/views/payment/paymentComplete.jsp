<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
<style>
	.myJumbo{
		background-color: white;
		padding-top: 80px;
	}
	#jumboImg{
		width: 100%;
		max-height: 600px;
	}
	.cardContents{
		text-align: center;
		line-height: 60px;
	}
	.formTop{
		text-align: center;
	}
	.formTop p{
		font-size: 13px;
		color: red;
	}
	.btn{font-family: 'Gamja Flower', cursive; background-color:#FDD69270; color:#754F44;}
	.btn:hover{background-color:#FDD692; font-weight:bold;}
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
		<div class="row justify-content-center mb-3">
			<h3>결제가 완료되었습니다.</h3>
		</div>
		<div class="row justify-content-center">
			<div class="col-12 formTop">
				<h4>구매 내역</h4>
			</div>
			<div class="col-12 d-flex justify-content-center" style="height: 50px;">
				<div class="card mb-3 myCard" style="width: 90%; border-color:white;">
					<div class="row no-gutters">
						<div class="col-12 row">
							<div class="col-md-6 col-12 d-none d-md-block cardContents">
								<p>상품명</h5></p>
							</div>
							<div class="col-md-3 col-6 d-none d-md-block cardContents">
								<p class="card-text">가격</p>
							</div>
							<div class="col-md-3 col-6 d-none d-md-block cardContents">
								<p class="card-text">판매자</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:forEach var="dto" items="${payItem }" varStatus="status">
				<input type="hidden" class="soldoutCheck" value="${dto.soldout }">
				<div class="col-12 d-flex justify-content-center" style="height: 80px;">
					<div class="card mb-3 myCard" style="width: 90%;">
						<div class="row no-gutters">
							<div class="col-12 row">
								<div class="col-md-6 col-12 cardContents">
									<p><a href="item?seq=${dto.seq }&currentPage=1&category=all"><h5 class="card-title">${dto.name }</h5></a><p>
								</div>
								<div class="col-md-3 d-md-block d-none cardContents">
									<p class="card-text">${dto.price }원</p>
								</div>
								<div class="col-md-3 d-md-block d-none cardContents">
									<p class="card-text">${dto.seller }</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row justify-content-center">
			<div class="col-12 formTop">
				<h4>구매자 정보</h4>
			</div>
			<div class="col-8">
				<div class="form-group">
					<label for="inputName">이름</label>
					<input type="text" class="form-control" id="inputName" name="name" value="${payMem.name }" readonly>
				</div>
				<div class="form-group">
					<label for="inputEmail">이메일</label>
					<input type="email" class="form-control" id="inputEmail" name="email" value="${payMem.email }" readonly>
				</div>
				<div class="form-group">
					<label for="inputPhone">전화번호</label>
					<input type="tel" class="form-control" id="inputPhone" name="phone" value="${payMem.phone }" readonly>
				</div>
				<div class="form-row">
					<div class="form-group col-8">
						<label for="zipcode">우편번호</label>
						<input type="text" class="form-control" id="zipcode" name="zipcode" value="${payMem.zipcode }" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputAddress">주소</label>
					<input type="text" class="form-control" id="inputAddress" name="address1" value="${payMem.address1 }" readonly>
				</div>
				<div class="form-group">
					<label for="inputAddress2">상세주소</label>
					<input type="text" class="form-control" id="inputAddress2" name="address2" value="${payMem.address2 }" readonly>
				</div>
				<div class="form-row">
					<div class="col-6 form-group">
						<label for="totalAmount">결제 금액</label>
						<input type="text" class="form-control" id="totalAmount" name="totalAmount" value="${totalAmount }원" readonly>
					</div>
					<div class="col-6 form-group">
						<label for="type">결제 방식</label>
						<input type="text" class="form-control" id="type" name="type" value="${payMem.type }" readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="col-6 form-group">
						<input type="button" class="btn m-auto p-auto form-control" id="goBuyList" value="구매내역 확인">
					</div>
					<div class="col-6 form-group">
						<input type="button" class="btn m-auto p-auto form-control" id="goFreemarket" value="무료나눔 목록">
					</div>
				</div>
				
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
			history.pushState(null, null, location.href);
			window.onpopstate = function(event) {
				history.go(1);
			};
			$("#goBuyList").on("click", function(){
				location.href = "toMyPage_buyList";
			});
			$("#goFreemarket").on("click", function(){
				location.href = "freeMarket?currentPage=1&category=all";
			});
			// 뒤로가기 방지
			window.history.forward(1);
			//새로고침, 뒤로가기 막기
			document.onkeydown = function(e) {
				key = (e) ? e.keyCode : event.keyCode;
				if (key == 8 || key == 116) {
					if (e) {
						e.preventDefault();
					} else {
						event.keyCode = 0;
						event.returnValue = false;
					}
				}
			}
		});
	</script>
</body>
</html>