<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>

<!--join info style  -->
<style>
#joinInfo {
	display: none;
padding-bottom:200px;
}

 #agree {
	box-sizing: border-box;
	margin-top: 100px;
	margin-bottom: 200px;
	margin: auto;
}

#textInfo {
	overflow: auto;
	height: 600px;
}

.jumbotron {
	background-color: white;
}

.title {
	padding-top:80px;
}

#joinInfo>div {
	margin-bottom: 10px;
}

#divPasswordCheck {
	font-size: 15px;

}

.textbox {
	width: 250px;
}

#privateagreetext {
	font-size: 15px;
}
#formfooterbtn{
text-align:center;
padding-left:0px;
}
/*-소히가 도와주는 프론트~~~-----------------------------------------------------------------------------------------------------------  */


b {
	font-family: 'Gamja Flower', cursive;
	font-size: 40px;
}

.agree {
	font-family: 'Gamja Flower', cursive;
	font-size: 20px;
	padding-bottom:200px;
}

.row>div:nth-child(2) {
	text-align: left;
}

.zipcode {
	text-align: left;
}

#joinForm>.row {
	margin-bottom: 20px;
}

.input-addr>div {
	margin-bottom: 10px;
}

#search-btn {
	margin-left: 5px;
}

.btn, input[type="reset"], input[type="submit"] {
	background-color: #EC7357;
	border: none;
	font-size: 15px;
	color: white;
	border-radius: 5px;
	padding: 3px 5px;
}

.btn:hover, input[type="reset"]:hover, input[type="submit"]:hover {
	font-weight: bold;
	background-color: #f7613e;
	color:white;
}
.span{
padding-left:302px;
}
#signin,#reset{
width:80px;
height:40px;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	<div class="jumbotron px-0 pb-0">
		<img src="resources/images/member/joinimg.jpg" height="600px"
			width="100%">

	</div>

	<div id="agree" class="container">
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12 pb-5  title"
				align="center" >
				<b> 회 원 가 입 </b>
			</div>
		</div>
		<div id="privateagreetext">개인정보 동의 약관</div>
		<hr>
		<div class="row">

			<div class="col-12 col-sm-12 col-md-12 col-lg-12" id="textInfo"
				align="left">
				제1조(목적) 본 회원약관은 AcAT(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에
				있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.<br> 제2조
				(약관의 효력) 1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.<br>
				2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을
				발생합니다.<br> 3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.<br>
				제3조 (약관 이외의 준칙) 이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에
				규정되어 있는 경우 그 규정에 따릅니다.<br> 제4조 (이용계약의 체결) 회원 가입 시 회원 약관 밑에 있는
				동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.<br> 제5조 (용어의 정의) 이 약관에서
				사용하는 용어의 정의는 다음과 같습니다.<br> 1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자
				2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합
				3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합 제6조 (이용신청) 1.회원 가입은
				온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.<br> 2.가입희망 회원은
				반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.<br>
				제7조 (회원가입의 승낙) '갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은
				바로 가입을 승인하여 서비스를 이용할 수 있다.<br> 제8조(회원가입 신청거절 및 강제 탈퇴) 1. '갑'은
				타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.<br> 2.
				회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할
				경우 회원의 자격을 강제 탈퇴시킬 수 있다.<br> 제9조 (서비스 제공의 중지) '갑'은 다음 각 호의 1에
				해당하는 경우 서비스의 제공을 중지할 수 있습니다 1.설비의 보수 등을 위하여 부득이한 경우 2.전기통신사업법에 규정된
				기간통신사업자가 전기통신서비스를 중지하는 경우 3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.<br>
				제10조 ('갑'의 의무) 1.'갑'은 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.<br>
				2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을
				다하여야 합니다.<br> 제11조 (개인정보보호) 1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의
				정보를 수집합니다.<br> 2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수
				없으며, 이에 대한 모든 책임은 '갑'이 집니다.<br> 다만, 다음의 경우에는 예외로 합니다.<br>
				①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
				②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우 ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리
				위원회의 요청이 있는 경우 ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우 3.회원은 언제든지 '갑'이 가지고 있는
				자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.<br>
				제12조 (회원의 의무) 1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을
				준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.<br> 2.회원은 '갑'의 사전 승낙
				없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.<br> 3.회원은 서비스를 이용하여 얻은 정보를
				'갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수
				없습니다.<br> 4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을
				'갑'에게 통지하여야 합니다.<br> 5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.<br>
				①다른 회원의 아이디(ID)를 부정 사용하는 행위 ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 ③선량한 풍속,
				기타 사회질서를 해하는 행위 ④타인의 명예를 훼손하거나 모욕하는 행위 ⑤타인의 지적재산권 등의 권리를 침해하는 행위
				⑥해킹행위 또는 컴퓨터바이러스의 유포행위 ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타
				사이트를 링크하는 행위 ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위 ⑨기타 관계법령에 위배되는
				행위 ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위 제13조 (게시물 또는 내용물의 삭제) '갑'은
				서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이
				이를 삭제할 수 있습니다.<br> 제14조 (게시물에 대한 권리·의무) 게시물에 대한 저작권을 포함한 모든 권리
				및 책임은 이를 게시한 회원에게 있습니다.<br> 제15조 (양도금지) 회원이 서비스의 이용권한, 기타 이용계약상
				지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br> 제16조 (계약해지 및
				이용제한) 1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의
				1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.<br>
				2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.<br>
				제17조 (면책·배상) 1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는
				어떠한 책임을 부담하지 아니하고, 회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에
				관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든
				책임은 회원에게 있습니다.<br> 2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를
				매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에
				관하여 책임을 부담하지 않습니다.<br> 3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여
				발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.<br> 4.회원이
				제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써
				'갑'에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게 발생하는 모든 손해를 배상하여야 하며, 동
				손해로부터 '갑'을 면책시켜야 합니다.<br> 제18조 (분쟁의 해결) 1.'갑'과 회원은 서비스와 관련하여
				발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br> 2.1항의 규정에도 불구하고
				분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.<br> 부 칙 제 1
				조 (시행일) 이 약관은 2013년 11월 30일부터 시행한다.<br>
			</div>
		</div>
		<div class="row">
			<div class="col-8 col-sm-7 col-md-7 col-lg-7 pt-5 agree"
				align="right">
				<input type="radio" id="provisionY" name="provisionYn">
				동의합니다. <input type="radio" id="provisionN" name="provisionYn">
				동의하지 않습니다.
			</div>
			<div class="col-4 col-sm-5 col-md-5 col-lg-5 pt-3" align="left">
				<img src="resources/images/member/nextbtn.png" height="100px"
					width="100px" id="next">
			</div>
		</div>


	</div>
	<!--회원가입 폼------------------------------------------------------------------------------------------------------------------------------- -->
	<div class="container" id="jointool">
		<div class="row " id="joinInfo">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12">
				<div class="row ">
					<div class="col-12 col-sm-12 col-md-12 col-lg-12 pb-2 title">
					 <b> 회 원 가 입 </b> 
					</div>
				</div>

			<hr>
				<form action="joininfo" method="post" id="joinForm"
					onsubmit="return submit_check()">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">아이디</div>
						<div class="col-lg-9 col-md-3 col-sm-9 col-9">
							<input type="text" id="id" name="id" required
								placeholder="영대소문자및숫자포함5글자이상" flag="false" regexFlag="false"
								class="textbox">
						</div>
						<div class="col-12 span">
							<span id="idresult"></span>
						</div>
					</div>

					<div class="row">
						<div id="divPassword"
							class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">비밀번호</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">
							<input type="password" id="password" name="password"
								placeholder="패스워드" maxlength="30" required regexFlag="false"
								class="textbox">
						</div>
						<div class="col-12 span">
							<span id="pwResult"></span>
						</div>
					</div>

					<div class="row">
						<div id="divPasswordCheck"
							class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">비밀번호확인</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">
							<input type="password" id="passwordCheck" placeholder="패스워드 확인"
								required class="textbox">
						</div>
						<div class="col-12 span">
							<span id="pwCheckResult"></span>
						</div>
					</div>

					<div class="row">
						<div id="inputName"
							class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">이름</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">
							<input type="text" placeholder="한글만 입력 가능합니다." maxlength="15"
								name="name" class="name" required regexFlag="false"
								class="textbox">
						</div>
					</div>

					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">이메일</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">

							<input type="text" id="email" placeholder="ex)dogandcat@aaa.com"
								name="email" flag="false" required regexFlag="false"
								class="textbox"> <input type="button" id="emailcheck"
								value="인증" class="btn">
						</div>
						<div class="col-12 span">
							<span class="emailResult"></span>
						</div>
					</div>

					<div class="row">
						<div id="birthDay"
							class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">생년월일</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">
							<input type="text" id="birthday" placeholder="20000101"
								name="birthDay" required regexFlag="false" class="textbox">
						</div>
					</div>


					<div class="row">
						<div id="gender"
							class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">성별</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">
							<input type="radio" name="gender" value="M">남 <input
								type="radio" name="gender" value="F">여
						</div>
					</div>

					<div class="row">
						<div id="phone" class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">휴대폰
							번호</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">
							<input type="text" placeholder="-를 제외하고 숫자만 입력하세요."
								maxlength="11" name="phone" id="phoneNum" required
								regexFlag="false" class="textbox">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3 col-3 first-col">주소</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-9">
							<div class="row input-addr">
								<div class="col-lg-12 col-md-12 col-sm-12 col-12 zipcode">
									<input type="text" id="zipcode" placeholder="우편번호"
										name="zipcode" required> <input type="button"
										value="찾기" id="search-btn" class="btn" class="textbox">
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<input type="text" id="address1" placeholder="주소"
										name="address1" required class="textbox">
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<input type="text" id="address2" placeholder="상세주소를 입력하시오"
										name="address2" required class="textbox">
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row footer">
						<div class="col-lg-12 col-md-12 col-sm-12 col-12" id="formfooterbtn">
							<input type="submit" id="signin" value="완료"> <input
								type="reset" id="reset">
						</div>
					</div>
					
				</form>
			</div>

		</div>
	</div>





	<!-- 수신여부 보류 
		 <div class="form-group">
			<label for="inputEmailReceiveYn" class="col-lg-2 control-label">이메일
				수신여부</label>
			<div class="col-lg-10">
				<label class="radio-inline"> <input type="radio"
					id="emailReceiveYn" name="emailReceiveYn" value="Y" checked>
					동의합니다.
				</label> <label class="radio-inline"> <input type="radio"
					id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지
					않습니다.
				</label>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPhoneNumber" class="col-lg-2 control-label">SMS
				수신여부</label>
			<div class="col-lg-10">
				<label class="radio-inline"> <input type="radio"
					id="smsReceiveYn" name="smsReceiveYn" value="Y"> 동의합니다.
				</label> <label class="radio-inline"> <input type="radio"
					id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
				</label>
			</div>
		</div> -->






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

	<!--  joinscript-->


	<script>
		function submit_check() { //submit 조건
			if ($("#passwordCheck").val() != $("#password").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				return true;
			}
		};
		$("#next").on("click", function() {
			if ($("#provisionY").prop("checked")) {
				$("#joinInfo").show();
				$("#agree").hide();
			} else {
				alert("회원가입 약관에 동의해주세요");
				$("#joinInfo").hide();
				$("#agree").show();
			}
		});

		//아이디 중복확인 ajax

		$("#id").on("focusout", function() {
			var idtestString = $("#id").val();
			var regex = /^[a-zA-Z][a-zA-Z0-9_]{6,12}$/g;
			var result = regex.exec(idtestString);
			if (result == null) {
				$("#id").attr("regexFlag", "false");
				$("#id").val("");
				$("#idresult").html("알파벳으로 시작하고 6~12자리 이하로 작성해주세요.");

			} else {
				$("#id").attr("regexFlag", "true");
				$("#idresult").html("");
				$.ajax({
					url : "idajax.do",
					type : "post",
					data : {
						id : $("#id").val()
					}
				}).done(function(resp) {
					console.log(resp);
					if (resp == "true") {
						$("#idresult").html("이미 사용되고 있는 아이디 입니다.");
						$("#idresult").css("color", "red");
						$("#id").attr("flag", "false");
					} else {
						$("#idresult").html("사용가능한 아이디 입니다.");
						$("#idresult").css("color", "greed");
						$("#id").attr("flag", "true");
					}
				})

			}
		});
		/* 비밀번호 Regex */
		$("#password").on("focusout", function() {
			var password = $("#password").val();
			var regex = /^[a-zA-Z0-9]{8,15}$/g;
			var result = regex.exec(password);
			if (result == null) {
				$("#password").val("");
				$("#pwResult").html("알파벳과 숫자의 조합으로 8~15이하로 입력해주세요.");
				$("#pwResult").css("color", "red");
			} else {
				$("#password").attr("regexFlag", "true");
				$("#pwResult").html("");
			}
		});
		$("#passwordCheck").on("focusout", function() {
			if ($("#password").val() != $(this).val()) {
				$("#pwCheckResult").html("비밀번호가 같지 않습니다.");
				$("#pwCheckResult").css("color", "red");
			} else {
				$("#pwCheckResult").html("");
			}
		});
		/* 이름 regex */
		$(".name").on("focusout", function() {
			var name = $(".name").val();
			var regex = /^[가-힣\s]{2,6}$/g;
			var result = regex.exec(name);
			if (result == null) {
				$(".name").val("");
			} else {
				$(".name").attr("regexFlag", "true")
			}
		});
		/* 이메일 regex */
		$("#email")
				.on(
						"focusout",
						function() {
							var email = $("#email").val();
							var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							/* 안에 있는 내용은 정규표현식 검증에 사용되는 패턴이 이 안에 위치함
							/ /i 정규표현식에 사용된 패턴이 대소문자를 구분하지 않도록 i를 사용함
							^ 표시는 처음시작하는 부분부터 일치한다는 표시임
							 [0-9a-zA-Z] 하나의 문자가 []안에 위치한 규칙을 따른다는 것으로 숫자와 알파벳 소문지 대문자인 경우를 뜻 함
							 * 이 기호는 0또는 그 이상의 문자가 연속될 수 있음을 말함 */
							var result = regex.exec(email);
							if (result == null) {
								$(".emailResult").html("올바른 이메일을 작성해주세요.");
								$("#email").val("");
								
							} else {
								$("#email").attr("regexFlag", "true");
								$(".emailResult").html("");
								if($("#email").attr("regexFlag", "true")){
								//이메일 인증 버튼 
								$("#emailcheck")
								.on(
										"click",
										function() {
											console.log($("#email").val());
											alert(" 해당 이메일에 인증 번호를 전송 중 입니다 \n 아래의 확인을 누르시면 인증번호 확인 창을 확인해주세요");
											$
													.ajax({
														url : "email.do",
														type : "post",
														data : {
															email : $("#email").val()
														},
														dataType : "json"
													})
													.done(
															function(resp) {
																console.log(resp);
																if (resp == true) {
																	
																	window.open('emailcheck',
																					'window팝업',
																					'width=430, height=300, menubar=no, status=no, toolbar=no');
																}

															});
										});
							}
							}
						});
		/* 생년월일 regex */
		$("#birthday").on("focusout", function() {
			var birth = $("#birthday").val();
			var regex = /[0-9]{8}/g
			var result = regex.exec(birth);
			if (result == null) {
				$("#birthday").val("");
			} else {
				$("#birthday").attr("regexFlag", "true");
			}
		});
		/* 전화번호 regex */
		$("#phoneNum").on("focusout", function() {
			var phone = $("#phoneNum").val();
			var regex = /^[010]{3}[0-9]{8}/g
			var result = regex.exec(phone);
			if (result == null) {
				$("#phoneNum").val("");
			} else {
				$("#phoneNum").attr("regexFlag", "true");
			}
		});
	</script>
	<!--우편번호  -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		document.getElementById("search-btn").onclick = searchAddress;

		function searchAddress() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							var roadAddr = data.roadAddress;
							var extraRoadAddr = '';

							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}

							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							document.getElementById("zipcode").value = data.zonecode;
							document.getElementById("address1").value = roadAddr;

							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}
							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>


</body>
</html>