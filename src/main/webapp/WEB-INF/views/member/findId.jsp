<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라온펫 - 아이디/비밀번호 찾기</title>
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

<!--join info style  -->
<style>
.title {
	padding-top: 80px;
	font-family: 'Gamja Flower', cursive;
	font-size: 40px;
}
.myJumbo {
	background-color: white;
	padding: 5rem;
}

#jumboImg {
	width: 100%;
	max-height: 600px;
}


.btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44;

}
.btn:hover{background-color:#FDD692; font-weight:bold;}
/*  ------메뉴-----------*/
b {
	font-family: 'Gamja Flower', cursive;
	font-size: 40px;
}

 .menu-box{width: 200px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; 	font-size: 20px; margin-top: 50px; margin-bottom:50px;}
            .menu-box>div{height: 35px;}
            .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px; color:#B45F04; font-size:40px;}
            .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;
            color: #754F44; text-decoration-line: none; font-weight:bold; cursor: pointer;
            }
            .menu-row{text-align: -webkit-center;}
            a[name="s-menu"]{color: #754F44; text-decoration-line: none;}

.write-section {
	padding-bottom: 400px;
}
/* --------내용 */
#wrapper {
	padding-top: 20px;
	padding-left: 30px;
	font-family: 'Gamja Flower', cursive;
	padding-bottom:50px;
}
  .suggest{font-size:22px;
    margin-top:10px;
  align:center;
  }
  .bodytitle
  {
  font-size:20px;
  	font-family: 'Gamja Flower', cursive;
  	font-wieght:bold;
  }
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

<div class="jumbotron myJumbo pr-0 pl-0 pb-2">
		<img src="resources/images/member/joinimg.jpg" id="jumboImg">

	</div>
<!--  아이디 찾기 -->
	<div class="row">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 pb-5  title"
			align="center">
			<b> 아이디  / 비밀번호 찾기 </b>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
				<div class="row menu-box">
				<div class="col-12 s-menu">
						<b>M E N U</b>
					</div>
					<div class="col-12 ">
						<a name="s-menu" href="join">회원가입</a>
					</div>
					<div class="col-12 ">
						<a  name="s-menu" href="findId">아이디 /비밀번호 찾기</a>
					</div>
					

				</div>
			</div>
			<div class="col-1"></div>

			<div class="col-lg-9 col-md-8 col-sm-12 col-12 write-section">
			<div class="row col-lg-12 col-md-12 col-sm-12 col-12 bodytitle ">
				아이디 찾기 </div>
				<hr>
				<div id="wrapper">
					<form action="findId" method="post" id="idForm">
						<div class="row mb-2" id="namediv">
							<div class="col-lg-3 col-md-3 col-sm-3 col-3    suggest pr-0">이름</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-6 pl-0">
								<input type="text" placeholder="이름을 입력하시오" name="idname"	id="idname" class="form-control">
							</div>
						</div>
						<div class="row  mb-2" id="emaildiv">
							<div class="col-lg-3 col-md-3 col-sm-3 col-3  suggest pr-0">생년월일</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-6 pl-0">
								<input type="text" placeholder="ex)2019-07-30" name="birthday"
									id="birthday" class="form-control ">
							</div>
						</div>
						<div class="row " id="emaildiv">
							<div class="col-lg-3 col-md-3 col-sm-3 col-3 suggest pr-0">이메일</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-6 pl-0">
								<input type="text" placeholder="전송 받을 이메일을 입력하시오" name="email"
									id="email" class="form-control">
							</div>
							<div class=" col-lg-3 col-md-3 col-sm-3 col-3 pl-0 btn-box">
							<input type="button" value="확인"  id="findid" class="btn" ></div>
						</div>
						
					</form>
				</div>
				<!-- 비밀번호 찾기 -->
				<div class="row col-lg-12 col-md-12 col-sm-12 col-12  mt-5 bodytitle">
					비밀번호 찾기 </div>
				 <hr>
            <div id="wrapper">
            <form action="findPwProc" method="post" id="findPwForm">
              <div class="row mb-2 input-section">
              	<div class="col-lg-3 col-md-3 col-sm-3 col-3  suggest">아이디</div>
              	<div class="col-lg-6 col-md-6 col-sm-6 col-6 pl-0 "><input type="text" name="id" class="id form-control"  placeholder="아이디를 입력하시오"></div>
              	</div>
              	<div class="row  mb-2">
              	<div class="col-lg-3 col-md-3 col-sm-3 col-3 suggest">이메일</div>
              	
              	<div class="col-lg-6 col-md-6 col-sm-6 col-6 pl-0 input-email">
              		<input type="text" name="email"  placeholder="가입하실 때의 이메일을 작성해주세요" class="email form-control" regexFlag="false">
              	</div>
              	<div class="col-lg-3 col-md-3 col-sm-3 col-3 pl-0 btn-box"><input type="button" value="확인" class="compl-btn btn"></div>
              
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
				
				alert('확인 버튼을 누르신 후 메일 전송을 기달려주세요 ');
				$("#findid").attr('disabled',true);
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
									$("#findid").attr('disabled',true);
									alert('이메일에 아이디가 발송되었습니다.');
								
								}
								else if(resp==null)
									{
									$("#findid").attr('disabled',false);
									alert('잘못된 정보입니다 정보를 확인하시오');
									
									}
								else {
									alert('메일 전송에 실패하였습니다. 해당 메일을 확인하시오');
									
								}
								
								
								});
			
}); 
</script>
<!--비밀번호 찾기   -->
 <script>

		$(".email").on("focusout",function(){
			var email = $(this).val();
			var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var result = regex.exec(email);
			if(result == null){
				$(".e-span").text("※ 올바른 형식의 이메일을 입력해주세요.");
			}else{$(this).attr("regexFlag","true");}
		});
		$(".compl-btn").on("click",function(){
			
			if($(".email").val() !="" && $(".id").val() !="" && $(".email").attr("regexFlag")=="true"){
				var email = $(".email").val();
				var id = $(".id").val();
				alert('확인 버튼을 누르신 후 메일 전송을 기달려주세요 ');
				
				$(".compl-btn").attr('disabled',true);
				$.ajax({
					url:"findPwProc.do",
					type:"post",
					data:{email:email,id:id}
				}).done(function(resp){
					console.log(resp);
					if(resp =="1"){
						alert("이메일로 임시 비밀번호가 발송되었습니다.");
						$("#findid").attr('disabled', true);
					}else if(resp =="0"){
						
						alert("아이디가 존재하지 않습니다.");
						$("#findid").attr('disabled', false);
						}else if(resp == "2"){
							alert("이메일 발송에 실패하였습니다.");
							$("#findid").attr('disabled', false);
						}
				});
				
			}else if($(".email").val()=="" && $(".id").val()==""){
				alert("아이디와 이메일을 입력해주세요.");
				$("#findid").attr('disabled', false);
				
			}else if($(".email").attr("regexFlag")=="false"){
				alert("올바른 형식의 이메일을 입력해주세요.");
				$("#findid").attr('disabled', false);
				
			}
		});
	
</script>
</body>
</html>