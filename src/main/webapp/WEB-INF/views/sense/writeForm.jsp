<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Form</title>
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
<!-- summernote -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
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
              .write-section{ padding: 10px;;margin: 0px;padding: 0px; margin-top:70px; }
        /*---------------------------------------------------------------------------*/
        .button-box{text-align: right;}
        .write-btn{background-color: #EC7357; border: none; font-size: 20px; color:white; border-radius: 5px;}
        .write-btn:hover{font-weight: bold; background-color: #f7613e;}
        .title-section{text-align: center; font-size: 20px; margin-bottom: 20px;}
        .title-section>div:first-child{font-size: 25px;}
        .title{width: 100%;}
        .content-section{margin-bottom: 20px;}
    </style>
     <script>
          $(function(){
              $('#summernote').summernote({
                    placeholder: '내용을 입력해주세요. ^_^',
                    tabsize: 2,
                    height: 300,
                });
              $(".write-btn").on("click",function(){
                  //summernote -> textarea에 옮겨담기
                  if($(".title").val() != "" && $(".content")val() != ""){
                      $("#writeForm").submit();
                  }else if($(".title").val() == ""){
                      alert("제목을 입력해주세요.");
                  }else if($(".content").val() == ""){
                      
                  }
              })
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
             <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                    <div class="row menu-box">
                        <div class="col-12 s-menu">M E N U</div>
                        <div class="col-12 "><a name="s-menu" href="oxQuiz">OX QUIZ</a></div>
                        <div class="col-12"><a name="s-menu" href="">반려동물 상식</a></div>
                           <div class="col-12"><a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a></div> <!-- 관리자만 볼 수 있게! -->
                    </div>
                </div>
                 <div class="col-1"></div>
            <div class="col-lg-9 col-md-8 col-sm-12 col-12 write-section">
              <form action="writeProc.info" method="post" id="writeForm">
               <div class="row title-section">
                   <div class="col-lg-2 col-md-2 col-sm-2 col-12">제목</div>
                   <div class="col-lg-10 col-md-10 col-sm-10 col-12"><input type="text" name="title" class="title" maxlength="100"></div>
               </div>
               <div class="row content-section">
                   <div class="col-12">
                       <div id="summernote"></div>
                       <textarea hidden class="content"></textarea>
                   </div>
               </div>
              <div class="row button-box">
                  <div class="col-12"><input type="button" class="write-btn" value="글쓰기"></div>
              </div>
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