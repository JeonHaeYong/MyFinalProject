<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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

<style>
	.jumbotron{background-color:white;}
    .jumbotron>img{width:100%; height: 700px;}
	#title{width: 100%; text-align: center; margin: auto; margin-bottom: 50px;}
    h3,h1{ font-family:'Gamja Flower', cursive;}
    .container{min-width: 400px;box-sizing: border-box;margin-bottom:100px; font-family: 'Gamja Flower', cursive;}
    .menu-box{width: 150px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px; margin-top: 50px;}
    .menu-box>div{height: 35px;}
    .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px;}
    .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
    .menu-row{text-align: -webkit-center;}
    a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
    a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
   /*---------------------------------------------------------------------------------------------------------------------------------------------*/
    .info-list{ padding: 10px;;margin: 0px;padding: 0px; margin-top:70px; }
     /*---------------------------------------------------------------------------*/
    .infomations{text-align: center;}
    .contents{border: 1px solid black; width: 200px; height: 300px; margin:auto; margin-bottom: 20px; box-sizing: border-box;}
    .image,.title,.writeDate{width: 100%; border: 1px solid black;}
    .image{height: 50%;}.title{height: 40%}.writeDate{height: 10%;}
    .footer{text-align: center; font-size: 25px;}
    .button-box{text-align: right;}
    .write-btn{background-color: #EC7357; border: none; font-size: 20px; color:white; border-radius: 5px;}
    .write-btn:hover{font-weight: bold; background-color: #f7613e;}
    .image img{width:100%; height:100%; }
    
</style>
<script>
	$(function(){
		$(".write-btn").on("click",function(){
			location.href="toWriteForm";
		})
		
	});
	
	var num = ${currentPage};
	var count = ${count}
	  $(window).scroll(function(){
		 
       
          if($(window).scrollTop() > $(document).height() - $(window).height())
          {  
              $.ajax({
                  url: "loadmore.train", 
                  data: {currentPage:num++},
                  dataType:"json"
              }).done(function(resp){
            	 console.log(resp.moreList.length);
            	 if(resp.moreList.length != 0){
            		 var count = resp.moreList.length;
            		 console.log(count);
             	 var moreList = "<c:forEach var='i' begin='0' end='6' varStatus='status' ><div class='col-lg-4 col-md-6 col-12'><div class='contents'><div class='image${status.index}'></div><div class='title${status.index}'></div><div class='writeDate${status.index}'></div></div></div></c:forEach>";
					$(".infomations").append(moreList);
            	  for(var i = 0; i <resp.moreList.length; i++){
            		  $(".image"+i).append("<img src='"+ resp.moreList[i].image+"'>");
            		  $(".title"+i).append(resp.moreList[i].title);
            		  $(".writeDate"+i).append(resp.moreList[i].writeDate);
            	  };
            	 }
              });
          }
      });
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
 <div class="jumbotron px-0 pb-0">
      	<img class="bigImg" src="/resources/images/dog_7.png">
      </div>
 <div id="title"><h1>훈련 정보</h1></div>
    <div class="container">
    	<div class="row">
    		<div class="col-12"><a></a><a></a></div>
    	</div>
        <div class="row">
             <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                    <div class="row menu-box">
                        <div class="col-12 s-menu">M E N U</div>
                        <div class="col-12 "><a name="s-menu" href="oxQuiz">OX QUIZ</a></div>
                        <div class="col-12"><a name="s-menu" href="">반려동물 상식</a></div>
                           <div class="col-12"><a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a></div> <!-- 관리자만 볼 수 있게! -->
                    </div>
                </div>
                 <div class="col-1"></div>
            <div class="col-lg-9 col-md-8 col-sm-12 col-12 info-list">
                 <div class="row infomations">
                 <c:forEach var="list" items="${list }">
                    <div class="col-lg-4 col-md-6 col-12">
                         <div class="contents">
                             <div class="image"><img src='${list.image }'></div>
                             <div class="title">${list.title }</div>
                             <div class="writeDate">${list.writeDate }</div>
                         </div>
                     </div>
                   </c:forEach>
                 </div>
              <div class="row footer">
                  <div class="col-12 navi">navi</div>
              </div>
              <div class="row button-box">
                  <div class="col-12"><input type="button" class="write-btn" value="글쓰기"></div>
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

</body>
</html>