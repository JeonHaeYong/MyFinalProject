<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>OX 상식 퀴즈</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
<!--  module-->
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>

 <style>
           
     		.jumbotron{background-color:white; padding-top: 80px; }
     		.jumbotron>img{width:100%; height: 700px;}
            #title{width: 100%; text-align: center; margin: auto; margin-bottom: 50px;}
            h3,h1{ font-family:'Gamja Flower', cursive;}
            .container{
                border: 0px solid black;
                min-width: 400px;       
                box-sizing: border-box;
                text-align: center;
                margin-bottom:100px;
            }
            .quiz-box{
                padding: 10px;
                text-align: center;
                margin: 0px;
                margin-top:45px;
                padding: 0px;
            
            }
            .question{width: 100%;}
            .btnImage{ line-height: 350px; display: inline-block; font-size: 500px; cursor: pointer; color:#FDD692; font-family:'Gamja Flower', cursive;}
            .btnImage:hover{color:#faba4b;}
            .btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44; font-size:30px;}
			.btn:hover{background-color:#FDD692; font-weight:bold; color:#754F44;}
            
            .quiz{display:none;}
            .quiz-box{font-family:'Gamja Flower', cursive;}
            #quiz1{display: block;}
            .menu-box{width: 200px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px; margin-top: 50px; margin-bottom:50px;}
            .menu-box>div{height: 35px;}
            .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px; color:#B45F04; font-size:40px;}
            .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
            .menu-row{text-align: -webkit-center;}
            a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
            a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
           /*---------------------------------------------------------------------------------------------------------------------------------------------*/
           .result-box{width: 70%;  margin-top: 30px; margin-bottom: 30px;}
            .header{font-size: 25px; text-align: center; background-color: #FDD692; color: #754F44; border-radius: 30px;}
            .section{ height: 40px; font-size: 20px;}
            .footer{margin-top: 10px; margin-bottom: 30px;}
            #restart-btn{cursor: pointer;}
          /*---------------------------------------------------------------------------------------------------------------------------------------------*/
            .result-box>div:first-child{font-size: 30px;}
            .wrong-q,.answer{text-align: center;}
            .wrong{margin-bottom: 40px;}
            .incorrCount,.corrCount,.getPoint{font-size:30px;}
    </style>
            
            
        </style>

</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
      <div class="jumbotron px-0 pb-0">
     	<img  src="/resources/images/dog_7.png">
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
                <div class="col-lg-9 col-md-8 col-sm-12 col-12 quiz-box">
                  <div class="row">
			        	<div id="title" class="col-12"><h1>나는 얼마나 잘 알고 있을까??</h1></div>
            		</div>
                    <div class="row question">
                       <c:forEach var="dto" items="${sessionScope.list }" varStatus="status">
                        <div class="quiz col-12" id="quiz${status.index+1 }">
                            <h3>Q${status.index+1}. ${dto.quiz }</h3>
                            <hr>
                        </div>
                       </c:forEach>
                        <div class="choose col-12">
                            <div class="row">
                                <div class="btnImage col-lg-6 col-md-6 col-12" ox="o">O</div>
                                <div class="btnImage col-lg-6 col-md-6 col-12" ox="x">X</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row start">
                    	<div class="col-12">
                    		<input type="button" class="start-btn btn" value="S T A R T">
                    	</div>
                    </div>
         
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
   <script>
		var quizNum = 1;
		var corr = new Array(); //선택한 답 목록
		var index = 0;
		$(".btnImage").on("click", function(){
			
			corr[index] = $(this).attr("ox");
			index++;
			$("#quiz" + quizNum).css("display", "none");
			quizNum++;
			$("#quiz" + quizNum).css("display", "block");
			if(index == 10){
				$(".quiz-box").html("");
				$.ajax({
					url: "answerCheck",
					method: "post",
					traditional: true,
					data: {
						corr: corr
					}
				}).done(function(resp){
					console.log(resp);
					$(".quiz-box").append(resp);
				});
			}
		});
		
		//동적으로 만들어진 태그에 이벤트 걸기
		$(document).on("click","#restart-btn",function(){//첫번째 : click / change  등등의 이벤트/두번째 : 이벤트 적용할 타겟 태그 /세번째 : 동작 함수
			location.href="oxQuiz"
		});
		$(".question").hide();
		$(".start-btn").on("click",function(){
			if(${id == null}){
				alert("로그인을 해주세요~!");
				$(".login-btn").trigger("click");
			}else{
				$(".question").toggle();
				$(".start").toggle();
			}
		});
</script>
    </body>
</html>