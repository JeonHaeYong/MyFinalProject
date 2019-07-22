<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Quiz Admin</title>
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
 <style>
	
            .jumbotron{background-color:white;}
     		.jumbotron>img{width:100%; height: 700px;}
            #title{width: 100%; text-align: center; margin: auto; margin-bottom: 50px;}
            h3,h1{ font-family:'Gamja Flower', cursive;}
            .container{min-width: 400px;box-sizing: border-box;margin-bottom:100px; font-family: 'Gamja Flower', cursive;}
            .menu-box{width: 150px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px; margin-top: 50px;}
            .menu-box>div{height: 35px;}
            .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px; color:#B45F04; font-size:40px;}
            .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
            .menu-row{text-align: -webkit-center;}
            a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
            a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
           /*---------------------------------------------------------------------------------------------------------------------------------------------*/
              .insert-quiz{ padding: 10px;;margin: 0px;padding: 0px;  }
          /*-퀴즈 등록--------------------------------------------------------------------------------------------------------------------------------------------*/
        .header{background-color: #EC7357; color: white; font-size: 30px; text-align: center; width: 100%; margin-left: 0px;}
        .quiz,.answer,.point,.explain{font-size: 25px;}
        .quiz{  margin-top: 50px;}
        .answer,.point{margin-top:20px; margin-bottom: 20px;}
        .input-quiz{width: 94%; margin-left: 10px; height:35px;}
        .input-o,.input-x{width: 40px;}
        .input-point{width: 30px; margin-left: 10px; height: 35px;}
        textarea{width: 100%; font-size: 20px; }
        .button-box{text-align: center; margin-bottom: 10px; margin-top:10px;}
        input[type="button"],input[type="submit"]{background-color: #EC7357; border: none; font-size: 20px; color:white; border-radius: 5px;}
        input[type="button"]:hover,input[type="submit"]:hover{font-weight: bold; background-color: #f7613e;}
         /*--퀴즈 리스트-------------------------------------------------------------------------------------------------------------------------------------------*/

        .quiz-list,.navi{font-size: 25px;}
        .check-del,.navi{text-align: center;}
        input[type="checkbox"]{margin-top:15px;}
        .list-explain{border-bottom:1px solid gray;}
        .pageNum,.prev,.next{text-decoration-line: none; color: #754F44; font-size:20px;}
     	.pageNum:hover,.prev:hover,.next:hover{font-weight: bold;}
</style>
<script>
    $(function(){
        $("textarea").css("height","100");
        $(".pageNum").each(function(index,items){
        	if($(this).text()==${currentPage}){
        		$(this).css("color","#EC7357");
				$(this).css("font-weight","bold");
        	}
        });
        
        /* Regex */
     $(".input-point").on("input",function(){
    	 var point = $(".input-point").val();
       	 var testPoint = point.value;
       	 var regex = /[0-9]/g;
       	 var result = regex.exec(testPoint);
       	 if(testPoint == null){
       		 $(".point-span").text("숫자만 입력해주세요");
       	 }
     });
        $(".delete-btn").on("click",function(){
        	$("#deleteForm").submit();
        });
    });
</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
      <div class="jumbotron px-0 pb-0">
      	<img class="bigImg" src="/resources/images/dog_7.png">
      </div>
  			<div id="title"><h1>관리자 페이지 - OX Quiz</h1></div>         
 <div class="container">
         	<div class="row">
         		 <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                    <div class="row menu-box">
                        <div class="col-12 s-menu">M E N U</div>
                        <div class="col-12 "><a name="s-menu" href="oxQuiz">OX QUIZ</a></div>
                        <div class="col-12"><a name="s-menu" href="">반려동물 상식</a></div>
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
                <div class="col-lg-9 col-md-8 col-sm-12 col-12 insert-quiz">
                   <div class="row header"><div class="col-12">퀴즈 등록</div></div>
                   
                      <form action="insertQuiz.admin" method="post" id="quizForm">
                    <div class="row section">
                        <div class="col-12 quiz">Quiz<input type="text" name="quiz" class="input-quiz" required maxlength="333"></div>
                        <div class="col-6 answer">
                           <div class="row">
                               <div class="col-lg-3 col-md-12 col-sm-12 col-12"> O or X</div>
                               <div class="col-lg-9 col-md-12 col-sm-12 col-12">
                                    O<input type="radio" name="correct" class="input-o" value="o" required>
                                    X<input type="radio" name="correct" class="input-x" value="x" required>
                               </div>
                           </div>
                        </div>
                        <div class="col-6 point">point<input type="text" name="point" class="input-point" pattern="[0-9]{1,2}" required><span class="point-span"></span></div>
                        <div class="col-12 explain">설명</div>
                        <div class="col-12"> <textarea name="explain" id="" cols="30" rows="10" class="input-explain" required maxlength="1000"></textarea></div>
                    </div>
                    <div class="row button-box"><div class="col-12"><input type="submit" class="quiz-btn" value="등록"></div></div>
                </form>
                    <!--문제 리스트 -->
         	        <div class="row header"><div class="col-12">QUIZ LIST</div></div>
         	        <form action="deleteQuiz.admin" method="post" id="deleteForm">
         	        <c:forEach var="list" items="${quizList }">
         	          <div class="row quiz-list">
                       <div class="col-1 check-del ">
                       		<input type="checkbox" name="check" value="${list.seq }">
                       	</div>
                       	<div class="col-1 list-seq">${list.seq }</div><div class="col-10 list-quiz">Quiz: ${list.quiz }</div>
                        <div class="col-1"></div><div class="col-5 list-ox">
                         O or X : ${list.correct }
                        </div>
                        <div class="col-6 list-point">point: ${list.point }</div>
                          <div class="col-1"></div><div class="col-11 list-explain">${list.explain }</div>
                    </div>
                    </c:forEach>
                    <div class="row navi"><div class="col-12">${navi }</div></div>
                    <div class="row button-box"><div class="col-12"><input type="button" class="delete-btn" value="선택삭제"></div></div>
                    </form>
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