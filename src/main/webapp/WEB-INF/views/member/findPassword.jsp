<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Password</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"rel="stylesheet">
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
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
<style>
			.jumbotron {background-color: white;}
	 		 #title{width: 100%; text-align: center; margin: auto; margin-bottom: 50px;}
            h3{ font-family:'Gamja Flower', cursive;}
            .container{min-width: 400px;box-sizing: border-box;margin-bottom:100px; font-family: 'Gamja Flower', cursive;}
          b {
	font-family: 'Gamja Flower', cursive;
	font-size: 40px;
}
.menu-row{
text-align: -webkit-center;

}
.s-menu1>a{
 text-decoration:none;
 color:black;
 font-size:20px;
 font-family: 'Gamja Flower', cursive;
}
.s-menu1:hover{
background-color:#F3F78130;
}


.s-menu1{
 padding-top:10px;
 padding-left:0px;
 padding-right:0px;
}
.s-menu
{
color:#B45F04;
border-bottom:2px solid black;
}
.menu-box{
width:150px;
height:100px;
padding-bottom:120px;
margin-bottom:150px;
}
#wrapper {
	padding-top: 20px;
	padding-left: 50px;
	
}
#title {
	padding-top: 80px;
font-family: 'Gamja Flower', cursive;
	font-size: 40px;
}

           /*---------------------------------------------------------------------------------------------------------------------------------------------*/
              .section{ padding: 10px;;margin: 0px;padding: 0px; margin-top:0px; }
/*---------------------------------------------------------------------------------------------------------------------------------------------*/
              .suggest{font-size:20px; }
              .email,.id{width:350px;}
              .input-email{margin-bottom:20px;}
              input[type="submit"]{background-color: #EC7357; border: none; font-size: 20px; color:white; border-radius: 5px;}
              input[type="submit"]:hover{font-weight: bold; background-color: #f7613e;}
              
</style>
<script>
	$(function(){
		$(".email").on("focusout",function(){
			var email = $(this).val();
			var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var result = regex.exec(email);
			if(result == null){
				$(".e-span").text("올바른 형식의 이메일을 입력해주세요.");
			}else{$(this).attr("regexFlag","true");}
		});
		$(".compl-btn").on("click",function(){
			if($(".email").val() !="" && $(".id").val() !="" && $(".email").attr("regexFlag")=="true"){
				var email = $(".email").val();
				var id = $(".id").val();
				
				$.ajax({
					url:"findPwProc",
					type:"post",
					data:{'email':email,'id':id}
				}).done(function(resp){
					if(resp == "1"){
						alert("이메일로 임시 비밀번호가 발송되었습니다.");
						$(".result").html("입력하신 이메일로 임시 비밀번호가 발송되었습니다.<br>로그인후, 비밀번호를 꼭!! 변경해주세요.");
					}else{alert("아이디가 존재하지 않습니다.");}
				})
				
			}else if($(".email").val()=="" && $(".id").val()==""){
				alert("아이디와 이메일을 입력해주세요.");
				
			}else if($(".email").attr("regexFlag")=="false"){
				alert("올바른 형식의 이메일을 입력해주세요.");
				
			}
		});
	});

</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron px-0 pb-0">
		<img src="resources/images/member/joinimg.jpg" height="600px"width="100%">
	</div>
	
  <div id="title"><b>비밀번호 찾기</b></div>
    <div class="container">
        <div class="row">
               <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                    <div class="row menu-box">
                        <div class="col-12 s-menu"><b>M E N U</b></div>
                        <div class="col-12 s-menu1 " ><a href="join">회원가입</a></div>
                         <div class="col-12 s-menu1" ><a href="findId">아이디 찾기</a></div>
                        <div class="col-12 s-menu1" ><a href="findPassword"> 비밀번호 찾기</a></div>
                         
                    </div>
                </div>
                 <div class="col-1"></div>
            <div class="col-lg-9 col-md-8 col-sm-12 col-12 section">
           
           <hr>
            <div id="wrapper">
            <form action="findPwProc" method="post" id="findPwForm">
              <div class="row">
              	<div class="col-12 suggest">아이디를 입력해주세요.</div>
              	<div class="col-12"><input type="text" name="id" class="id"></div>
              	<div class="col-12 suggest">가입하실 때, 입력하신 이메일을 입력해주세요.</div>
              	<div class="col-lg-6 col-md-12 col-sm-12 input-email">
              		<input type="text" name="email" class="email" regexFlag="false">
              	</div>
              	<div class="col-lg-6 col-md-12 col-sm-12 btn-box"><input type="button" value="확인" class="compl-btn"></div>
              	<div class="col-12"><span class="e-span"></span></div>
              </div>
              </form>
              </div>
              <div class="row"><div class="col-12"><span class="result"></span></div></div>
            </div>
        </div>
        
        
    </div>
<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
   <jsp:include page="/WEB-INF/views/module/footer.jsp" ></jsp:include>
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