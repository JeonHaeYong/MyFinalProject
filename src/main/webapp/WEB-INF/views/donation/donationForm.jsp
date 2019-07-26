<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후원 결제</title>
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
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
		padding-top: 80px;
	}
	#jumboImg{
		width: 100%;
		max-height: 600px;
	}
	.formTop{
		text-align: center;
	}
	.formTop p{
		font-size: 25px;
	}
	#msg{
		font-size: 13px;
		color: red;
	}
	#donationForm{
		width: 40%;
	}
	#lab{
		color: white;
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
		<div class="row">
			<div class="col-12 formTop">
				<p>후원하기</p>
				<h2>"${donationName }"</h2>
				<hr>
			</div>
			<div class="col-12 mt-2 formTop">
				<h5>< 후원자 정보 ></h5><br>
				<p id="msg">*모든 항목을 작성해주셔야 합니다.</p>
			</div>
			<div class="col-12 d-flex justify-content-center">
				<form action="donationProc" method="post" id="donationForm">
					<input type="hidden" name="donate_type" value="후원">
					<div class="form-group">
						<label for="inputId">아이디</label>
						<input type="text" class="form-control" id="inputId" name="donator" value="${member.id }" readonly>
					</div>
					<div class="form-group">
						<label for="inputName">이름</label>
						<input type="text" class="form-control" id="inputName" name="donator_name" value="${member.name }">
					</div>
					<div class="form-group">
						<label for="inputMoney">후원 금액</label>
						<input type="number" class="form-control" id="inputMoney" name="donation" min="10" max="10000000">
					</div>
					<div class="form-group">
						<label for="selectMethod">결제 방식</label>
						<select class="form-control" id="selectMethod" name="type">
		    				<option value="0">결제 방식</option>
		    				<option value="card">카드결제</option>
		    				<option value="trans">실시간 계좌이체</option>
		    				<option value="vbank">가상계좌</option>
		    				<option value="phone">휴대폰 소액결제</option>
						</select>
					</div>
					<div class="form-group d-flex justify-content-center m-4">
						<input type="button" class="btn" id="donationBtn" value="결제하기">
					</div>
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
	<script>
		$("#donationBtn").on("click", function(){
			var name = $("#inputName").val();
			var regex = /^[가-힣]{2,5}$/g;
			var result = regex.exec(name);
			
			var price = $("#inputMoney").val();
			var regex = /^[0-9]{1,6}$/
			var regexPrice = parseInt(regex.exec(price));
			
			var payMethod = $("#selectMethod option:selected").val();
			if(result == null){
				alert("잘못된 이름 형식입니다.");
				$("#inputName").val("");
				return;
			}
			if($("#inputName").val() == ""){
				alert("이름을 입력해주세요.");
				return;
			}else if(price == "" || regexPrice < 10 || regexPrice > 10000000){
				alert("결제금액은 10원이상 10,000,000이하로 입력해주세요.");
				return;
			}else if(payMethod == "0"){
				alert("결제 방식을 선택해주세요.");
				return;
			}
			
			$("#donationForm").submit();
			
	//			var IMP = window.IMP; // 생략가능
	//			IMP.init('imp84992027'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	//			IMP.request_pay({
	//				pg : 'inicis', // version 1.1.0부터 지원.
	//				/* 
	//				    'kakao':카카오페이, 
	//				    html5_inicis':이니시스(웹표준결제)
	//				        'nice':나이스페이
	//				        'jtnet':제이티넷
	//				        'uplus':LG유플러스
	//				        'danal':다날
	//				        'payco':페이코
	//				        'syrup':시럽페이
	//				        'paypal':페이팔
	//				 */
	//				pay_method : payMethod,
	//				/* 
	//				    'samsung':삼성페이, 
	//				    'card':신용카드, 
	//				    'trans':실시간계좌이체,
	//				    'vbank':가상계좌,
	//				    'phone':휴대폰소액결제 
	//				 */
	//				merchant_uid : orderNum,
	//				/* 
	//				    merchant_uid에 경우 
	//				    https://docs.iamport.kr/implementation/payment
	//				    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	//				    참고하세요. 
	//				    나중에 포스팅 해볼게요.
	//				 */
	//				name : "무료나눔 결제", //결제창에서 보여질 이름 //
	//				amount : regexPrice,
	//				buyer_email : "",
	//				buyer_name : $("#inputName").val(),
	//				buyer_tel : "",
	//				m_redirect_url : ''
	//			/*  
	//			    모바일 결제시,
	//			    결제가 끝나고 랜딩되는 URL을 지정 
	//			    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
	//			 */
	//			}, function(rsp) {
	//				console.log(rsp);
	//				if (rsp.success) {
	//					alert("결제가 완료되었습니다");
	//					jQuery.ajax({
	//						url : "https://www.myservice.com/payments/complete", // 가맹점 서버
	//						method : "POST",
	//						headers : {
	//							"Content-Type" : "application/json"
	//						},
	//						data : {
	//							imp_uid : rsp.imp_uid,
	//							merchant_uid : rsp.merchant_uid
	//						}
	//					}).done(function(data) {
						
	//					})
	//					$("#payForm").submit();
	//				} else {
	//					var msg = '결제에 실패하였습니다.';
	//					msg += '에러내용 : ' + rsp.error_msg;
	//					alert(msg);
	//					location.href = "toMyPage_cart";
	//				}
	//			});
		});
	</script>
</body>
</html>