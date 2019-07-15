<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>OX 상식 퀴즈</title>
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

 <!--구글폰트-->
        <link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap&subset=korean" rel="stylesheet">
 <style>
            .bigImg{width: 100%; height: 700px;}
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
                padding: 0px;
            
            }
            .question{width: 100%;}
            .btnImage{ line-height: 350px; display: inline-block; font-size: 500px; cursor: pointer; color:#FDD692; font-family:'Gamja Flower', cursive;}
            .btnImage:hover{color:#faba4b;}
            .quiz{display:none;}
            #quiz1{display: block;}
            .menu-box{width: 150px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px; margin-top: 50px;}
            .menu-box>div{height: 35px;}
            .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px;}
            .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
            .menu-row{text-align: -webkit-center;}
            a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
            a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
           /*---------------------------------------------------------------------------------------------------------------------------------------------*/
            .result-box{border: 0px solid black; width: 70%;  margin-top: 30px; margin-bottom: 30px;}
            .header{font-size: 25px; text-align: center; background-color: #EC7357; color: white;}
            .section{border-bottom: 1px solid black; height: 40px; line-height: 35px;  font-size: 20px;}
            .footer{margin-top: 10px; margin-bottom: 30px;}
            #restart-btn{width:130px; height:130px; cursor: pointer;}
          /*---------------------------------------------------------------------------------------------------------------------------------------------*/
            .result-box>div:first-child{font-size: 30px;}
            .num,.wrong-q{position: relative; top:25px;}
            .wrong{margin-bottom: 40px; }
          
            .incorrCount,.corrCount,.getPoint{font-size:30px;}
            
            
        </style>
<script>
	$(function(){
		$(".result-box").hide();
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
				//alert(corr);
				$(".quiz-box").html("");
				$.ajax({
					url: "answerCheck",
					method: "post",
					traditional: true,
					dataType: "json",
					data: {
						corr: corr
					}
				}).done(function(resp){
					// resp에는 맞힌 문제 번호(answer), 틀린문제(wrong) ,총 획득 포인트(point)!!
				/* 	 alert(resp.answer);
						alert(resp.wrong);
					alert(resp.answer.length);	// 맞힌 문제 개수
					alert(resp.point);  */
					
					 $(".quiz-box").append($(".result-box").html()).css("font-family","'Gamja Flower', cursive");
					$(".corrCount").append("맞은 갯수: " + resp.answer.length);
					$(".getPoint").append("획득 포인트: " + resp.point);
					//틀린문제
					var incorr = "<c:forEach var='i' begin='0' end='10' varStatus='status' ><div class='col-1 wrong-n${status.index}'></div><div class='col-5 wrong-q${status.index}'></div><div class='col-1 answer${status.index}'></div><div class='col-5 ex${status.index}'></div></c:forEach>";
					$(".wrong").append(incorr);	
					 for(var i = 0; i < 10; i++){
							if(resp.wrongList[i]){
								 $(".wrong-n"+i).append(resp.wrongList[i].seq);
								  $(".wrong-q"+i).append(resp.wrongList[i].quiz);
								  $(".answer"+i).append(resp.wrongList[i].correct);
								  $(".ex"+i).append(resp.wrongList[i].explain);
							}
						};
					//랭킹
					   for(var i = 0; i < 10; i++){
						 if(resp.rankList[i]){
						 	$(".rank"+(i+1)).append(resp.rankList[i].rank);
						 	$(".id"+(i+1)).append(resp.rankList[i].id);
						 	$(".point"+(i+1)).append(resp.rankList[i].point);
						 };
					 }; 
					 
				});
			}
		});
		//동적으로 만들어진 태그에 이벤트 걸기
		$(document).on("click","#restart-btn",function(){//첫번째 : click / change  등등의 이벤트/두번째 : 이벤트 적용할 타겟 태그 /세번째 : 동작 함수
			location.href="oxQuiz"
		});
		

	});
</script>
</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
      <img class="bigImg" src="/resources/images/dog_7.png">
        <div id="title"><h1>나는 얼마나 잘 알고 있을까??</h1></div>

        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                    <div class="row menu-box">
                        <div class="col-12 s-menu">M E N U</div>
                        <div class="col-12 "><a name="s-menu" href="oxQuiz">OX QUIZ</a></div>
                        <div class="col-12"><a name="s-menu" href="">반려동물 상식</a></div>
                        <div class="col-12"><a name="s-menu" href="quizAdmin?currentPage=1">관리자 설정</a></div> <!-- 관리자만 볼 수 있게! -->
                    </div>
                </div>
                <div class="col-1"></div>
                <div class="col-lg-9 col-md-8 col-sm-12 col-12 quiz-box">
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
         
                </div>
            </div>
             </div>
<!-----결과확인----------------------------------------------------------------------------------------------------------------------------------------->
	<div class='result-box'>
		<!-- 맞힌문제 개수 / 획득 포인트 -->
		<div class="row">
			<div class="col-6 corrCount"></div><div class="col-6 getPoint"></div>
		</div>
		<!-- 틀린문제 / 해설 -->
		<div class="col-12 incorrCount">틀린문제</div>
		<div class="row header">
			<div class="col-1">NO.</div>
			<div class="col-5">문제</div>
			<div class="col-1">정답</div>
			<div class="col-5">설명</div>
		</div>
		<div class="row wrong"><!-- 틀린문제 들어올 자리 --></div>
		
		<!--랭킹  -->
		<div class='row header'>
			<div class='col-4'>RANK</div>
			<div class='col-4'>ID</div>
			<div class='col-4'>POINT</div>
		</div>
		<c:forEach var="i" begin="0" end="10" varStatus="status">
			<div class='row section'>
				<div class='col-4 rank${status.index+1 }'></div>
				<div class='col-4 id${status.index+1 }'></div>
				<div class='col-4 point${status.index+1 }'></div>
			</div>
		</c:forEach>
		<!-- 재시작 버튼 -->
		<div class='row footer'>
			<div class='col-12'>
				<img alt='' src='/resources/images/restart-btn.png' id='restart-btn'>
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