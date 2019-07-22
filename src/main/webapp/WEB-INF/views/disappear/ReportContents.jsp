<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report Contents</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<linkhref="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"rel="stylesheet">
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
 <style>
 		.empty{width: 100%; text-align: center; margin: auto; margin-bottom: 50px; height:50px;}
        .title{text-align: center; }
        div{ box-sizing: border-box; overflow:hidden; border: 0px solid black;}
        #wrapper{border: 2px solid #754F44; width: 1200px; height: 400px; margin: auto; margin-bottom:20px;}
        #wrapper>div{float: left;}
        .pet{width: 35%; height: 97%; margin: 5px;}
        .petImg{width: 100%; height: 65%;}
        .feature{width: 100%; height: 35%;}
        .feature>div:first-child{height: 20%; width: 100%; font-weight: bold;}
        .feature>div:nth-child(2){height: 80%; width: 100%; overflow-y: auto; word-wrap: break-word;}
        .petInfo{width: 63%; height: 97%; margin-left: 6px; margin-top:5px;}
        
        .content{width: 100%; height: 70%;}
        .content>div{float: left;width: 50%; height: 100%;}
        .first-col{font-weight: bold;}
       .first-col,.second-col{float: left; width: 50%; height: 100%;}
        
        .first-col>div,.second-col>div{height: 20%; text-align: center; line-height: 50px;}
        .et{width: 100%; height: 30%; padding-left: 75px;}
        .content>div:nth-child(2)>.first-col>div,.content>div:nth-child(2)>.second-col>div{height: 34%; line-height: 80px;}
        .et>div:first-child{height: 25%; font-weight: bold;}
        .et-contents{height: 75%; overflow-y: auto; word-wrap: break-word;}
        .petImg>img{width:100%; height:100%;}
        
        #footer{ margin:auto; width:1200px;}
        #footer>div{text-align:right;}
        .btns{background-color: #EC7357; color:white; border-style: none; border-radius:5px;}
		.btns:hover{background-color:#f0522e; font-weight:bold; }
    </style>
    <script>
    	$(function(){
    		$(".toList-btn").on("click",function(){
    			location.href="toDisappearList?currentPage=${currentPage}";
    		});
    		$(".alter-btn").on("click",function(){
    			location.href="toAlterForm?seq=${content.seq}";
    		});
    		$(".delete-btn").on("click",function(){
    			//location.href="";
    		});
    	});
    </script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="px-0 pb-0 empty"></div>
	<div class="title"><h1>실종신고</h1></div>
    <div id="wrapper">
      
       <div class="pet">
           <div class="petImg"><img src='${content.image }'></div>
           <hr>
           <div class="feature">
               <div>특징</div>
               <div>${content.feature }</div>
           </div>
       </div>
        <div class="petInfo">
            <div class="content">
                <div>
                    <div class="first-col">
                        <div>[${content.kind }]</div>
                         <div>아이디</div>
                        <div>성별/나이/털색</div>
                        <div>지역</div>
                        <div>실종장소</div>
                       
                    </div>
                    <div class="second-col">
                         <div></div>
                        <div>${content.writer }</div>
                        <div>${content.gender }/${content.age }/${content.furColor }</div>
                        <div>${content.areaList }</div>
                        <div>${content.disappearArea }</div>
                    </div>
                </div>
                <div>
                    <div class="first-col">
                       <div>연락처</div>
                        <div>중성화</div>
                        <div>실종날짜</div>
                    </div>
                    <div class="second-col">
                        <div>${content.tel }</div>
                        <div>${content.neuter }</div>
                        <div>${content.disDate }</div>
                    </div>
                </div>
            </div>
        <div class="et">
            <div>기타</div>
            <div class="et-contents">${content.et }</div>
        </div>
        </div>
    </div>
      <div id="footer">
        	<div>
        	
        		<input type="button" class="alter-btn btns" value="수정">
        		<input type="button" class="delete-btn btns" value="삭제">
        		<input type="button" class="toList-btn btns" value="목록">
        	</div>
        </div>
	
	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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