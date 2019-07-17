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
.title {
	padding-top: 80px;
	font-family: 'Gamja Flower', cursive;
	font-size: 40px;
}
/*  ------메뉴-----------*/
b {
	font-family: 'Gamja Flower', cursive;
	font-size: 40px;
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

.write-section {
	margin-bottom: 200px;
}
/* --------내용 */
#wrapper {
	padding-top: 20px;
	padding-left: 50px;
	font-family: 'Gamja Flower', cursive;
}
  .suggest{font-size:20px;
    margin-top:10px;
  }
   #idname,#email,#birthday{width:350px;
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

	<div class="row">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 pb-5  title"
			align="center">
			<b> 아이디 찾기 </b>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
				<div class="row menu-box">
					<div class="col-12 s-menu">
						<b>M E N U</b>
					</div>
					<div class="col-12 s-menu1 ">
						<a href="join">회원가입</a>
					</div>
					<div class="col-12 s-menu1">
						<a href="findId">아이디 찾기</a>
					</div>
					<div class="col-12 s-menu1">
						<a href="findPassword"> 비밀번호 찾기</a>
					</div>

				</div>
			</div>
			<div class="col-1"></div>

			<div class="col-lg-9 col-md-8 col-sm-12 col-12 write-section">




				<hr>

				<div id="wrapper">

					<form action="findId" method="post" id="idForm">
						<div class="row" id="namediv">
							<div class="col-lg-12 col-md-12 col-sm-12 col-12   suggest">본인의 성함을
								입력하시오.</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-12">
								<input type="text" placeholder="이름을 입력하시오" name="idname"
									id="idname">
							</div>
						</div>
						<div class="row" id="emaildiv">
							<div class="col-lg-12 col-md-12 col-sm-12 col-12   suggest">생년월일</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-12">
								<input type="text" placeholder="생년월일" name="birthday"
									id="birthday">
							</div>
						</div>
						<div class="row" id="emaildiv">
							<div class="col-lg-12 col-md-12 col-sm-12 col-12 suggest">전송 받을
								이메일을 입력하시오.</div>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<input type="text" placeholder="이메일을 입력하시오" name="email"
									id="email">
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12 btn-box"><input type="button" value="확인"  id="findid"></div>
						</div>
						
					</form>
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

$("#findid").on("click", function() {
				console.log($("#email").val());
				alert(" 해당 이메일에  전송 중 입니다 \n 아래의 확인을 누르신 후 이메일을 확인하시오");
				$
						.ajax({
							url : "findIdProc",
							type : "post",
							data : {
								idname :$("#idname").val(),
								email : $("#email").val(),
								birthday:$("#birthday").val()
							},
							dataType : "json"
						})
						.done(
								function(resp) {
								if(resp==true){
									alert('이메일에 아이디가 발송되었습니다.');
								}
								else if(resp==null)
									{
									alert('잘못된 정보입니다 정보를 확인하시오');
									}
								else {
									alert('메일 전송에 실패하였습니다. 해당 메일을 확인하시오');
								}
								
								
								});
			
}); 
</script>

</body>
</html>