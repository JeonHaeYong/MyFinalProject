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
	.formTop{
		text-align: center;
	}
	.formTop p{
		font-size: 13px;
		color: red;
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
			<div class="col-12 formTop">
				<h5>구매자 정보</h5><br>
				<p id="msg">*모든 항목을 작성해주셔야 합니다.</p>
			</div>
			<div class="col-12 d-flex justify-content-center">
				<form action="paymentProc" method="post" id="payForm">
					<c:forEach var="dto" items="${items }" varStatus="status">
						<input type="text" class="seqs" name="seqs" value="${dto.seq }">
					</c:forEach>
					<div class="form-group">
						<label for="inputName">이름</label>
						<input type="text" class="form-control" id="inputName" name="name" value="${member.name }">
					</div>
					<div class="form-group">
						<label for="inputEmail">이메일</label>
						<input type="email" class="form-control" id="inputEmail" name="email" value="${member.email }" readonly>
					</div>
					<div class="form-group">
						<label for="inputPhone">전화번호</label>
						<input type="tel" class="form-control" id="inputPhone" name="phone" value="${member.phone }">
					</div>
					<div class="form-row">
						<div class="form-group col-8">
							<label for="zipcode">우편번호</label>
							<input type="text" class="form-control" id="zipcode" name="zipcode" value="${member.zipcode }" readonly>
						</div>
						<div class="form-group col-4">
							<label for="zipcode" id="lab">우</label>
							<input type="button" class="btn btn-primary m-auto p-auto form-control" id="searchBtn" value="찾기">
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">주소</label>
						<input type="text" class="form-control" id="inputAddress" name="address1" value="${member.address1 }" readonly>
					</div>
					<div class="form-group">
						<label for="inputAddress2">상세주소</label>
						<input type="text" class="form-control" id="inputAddress2" name="address2" value="${member.address2 }">
					</div>
					<div class="form-group">
						결제 방식
						<select class="form-control" id="selectMethod">
		    				<option value="0">결제 방식</option>
		    				<option value="card">카드결제</option>
		    				<option value="trans">실시간 계좌이체</option>
		    				<option value="vbank">가상계좌</option>
		    				<option value="phone">휴대폰 소액결제</option>
						</select>
					</div>
					<div class="form-group d-flex justify-content-center">
						<input type="button" class="btn btn-primary" id="payBtn" value="결제하기">
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
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!--우편번호  -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		document.getElementById("searchBtn").onclick = searchAddress;
		function searchAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
					}
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById("inputAddress").value = roadAddr;
				}
			}).open();
		}
		
		$("#payBtn").on("click", function(){
			var name = $("#inputName").val();
			var regex = /^[가-힣]{2,5}$/g;
			var result = regex.exec(name);
			var payMethod = $("#selectMethod option:selected").val();
			if(result == null){
				alert("잘못된 이름 형식입니다.");
				$("#inputName").val("");
				return;
			}
			if($("#inputName").val() == ""){
				alert("이름을 입력해주세요.");
				return;
			}else if($("#inputPhone").val() == ""){
				alert("전화번호를 입력해주세요.");
				return;
			}else if($("#zipcode").val() == "" || $("#inputAddress").val() == "" || $("#inputAddress2").val() == ""){
				alert("주소를 입력해주세요.");
				return;
			}else if(payMethod == "0"){
				alert("결제 방식을 선택해주세요.");
				return;
			}
			
			$(".seqs").each(function(i, item){
				console.log($(item).val());
			});
			
			
			$("#payForm").submit();
			
// 			var IMP = window.IMP; // 생략가능
// 			IMP.init('imp84992027'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// 			IMP.request_pay({
// 				pg : 'inicis', // version 1.1.0부터 지원.
// 				/* 
// 				    'kakao':카카오페이, 
// 				    html5_inicis':이니시스(웹표준결제)
// 				        'nice':나이스페이
// 				        'jtnet':제이티넷
// 				        'uplus':LG유플러스
// 				        'danal':다날
// 				        'payco':페이코
// 				        'syrup':시럽페이
// 				        'paypal':페이팔
// 				 */
// 				pay_method : payMethod,
// 				/* 
// 				    'samsung':삼성페이, 
// 				    'card':신용카드, 
// 				    'trans':실시간계좌이체,
// 				    'vbank':가상계좌,
// 				    'phone':휴대폰소액결제 
// 				 */
// 				merchant_uid : 'merchant_' + new Date().getTime(),
// 				/* 
// 				    merchant_uid에 경우 
// 				    https://docs.iamport.kr/implementation/payment
// 				    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
// 				    참고하세요. 
// 				    나중에 포스팅 해볼게요.
// 				 */
// 				name : "무료나눔 결제", //결제창에서 보여질 이름 //
// 				amount : ${totalAmount},
// 				buyer_email : $("#inputEmail").val(),
// 				buyer_name : $("#inputName").val(),
// 				buyer_tel : $("#inputPhone").val(),
// 				m_redirect_url : ''
// 			/*  
// 			    모바일 결제시,
// 			    결제가 끝나고 랜딩되는 URL을 지정 
// 			    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
// 			 */
// 			}, function(rsp) {
// 				console.log(rsp);
// 				if (rsp.success) {
// 					alert("결제가 완료되었습니다");
// 					jQuery.ajax({
// 						url : "https://www.myservice.com/payments/complete", // 가맹점 서버
// 						method : "POST",
// 						headers : {
// 							"Content-Type" : "application/json"
// 						},
// 						data : {
// 							imp_uid : rsp.imp_uid,
// 							merchant_uid : rsp.merchant_uid
// 						}
// 					}).done(function(data) {
						
// 					})
// 					$("#payForm").submit();
// 				} else {
// 					var msg = '결제에 실패하였습니다.';
// 					msg += '에러내용 : ' + rsp.error_msg;
// 					alert(msg);
// 					location.href = "toMyPage_cart";
// 				}
// 			});
		});
	</script>
</body>
</html>