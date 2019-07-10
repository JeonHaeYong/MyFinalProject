<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hospital</title>
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
     .jumbotron{background-image:url(https://www.condorferries.co.uk/media/2455/taking-your-pet-5.jpg);
                background-size:100% 100%; height: 500px; margin: auto; margin-bottom: 80px;}
     .container{margin-bottom: 30px; color: #754F44; }
     .header{background-color: #EC7357; color: white; text-align: center; font-size: 20px; height: 40px; line-height: 40px;}
     .section{text-align: center; border-bottom: 1px solid black}
     .section:hover{background-color: #FDD69250;}
     .section>div:not(.addr){line-height: 50px;}
     .addr{text-align: left;}
     .footer{text-align: center; padding-top:15px; font-size: 18px;}
     .menu-bar{text-align: center; height: 200px;  }
     .menu-bar>div{height: 40px;}
     .menu-bar>div:not(.menu):hover{background-color: #FBFFB950; font-weight: bold; }
     .menu-bar div:first-child{font-size: 20px; font-weight: bold;  border-bottom: 1px solid black; color: #754F44;}
      a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
      a[name="s-menu"]:hover{color: #754F44;}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
   <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	   <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-1">Title</h1>
                <p class="lead">랄라라라ㅏ라</p>
            </div>
        </div>

        <div class="container">
           
           <div class="row">
               <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-bar">
                   <div class="menu">MENU</div>
                   <div><a href="" name="s-menu">임시보호중</a></div>
                   <div><a href="" name="s-menu">유기동물조회</a></div>
                   <div><a href="" name="s-menu">동물병원 조회</a></div>
                   <div><a href="" name="s-menu">보호센터 조회</a></div>
               </div>
               
               <div class="col-1"><!--메뉴바랑 리스트 사이 빈 공간--></div>
                 
               <div class="col-lg-8 col-md-7 col-sm-12 col-12">
                   <div class="row header">
                <div class="col-lg-2  d-none d-lg-block">No.</div>
                <div class="col-lg-3 col-md-4 col-12">동물 병원</div>
                <div class="col-lg-3 col-md-4 d-none d-md-block">전화번호</div>
                <div class="col-lg-4  col-md-4 d-none d-md-block ">주소</div>
            </div>
            <!--section start-->
            <div class="row section">
                <div class="col-lg-2  d-none d-lg-block no">1</div>
                <div class="col-lg-3 col-md-4 col-12 hp">압구정웰동물병원</div>
                <div class="col-lg-3 col-md-4 col-12 tel">3443-0275</div>
                <div class="col-lg-4  col-md-4 col-12  addr">서울특별시 강남구 압구정로 108
                    (신사동, 덕산빌딩 203호 )</div>
            </div>

            <div class="row section">
                <div class="col-lg-2  d-none d-lg-block no">1</div>
                <div class="col-lg-3 col-md-4 col-12 hp">압구정웰동물병원</div>
                <div class="col-lg-3 col-md-4 col-12 tel">3443-0275</div>
                <div class="col-lg-4  col-md-4 col-12 addr">서울특별시 강남구 압구정로 108 (신사동, 덕산빌딩 203호 )</div>
            </div>

            <div class="row section">
                <div class="col-lg-2  d-none d-lg-block no">1</div>
                <div class="col-lg-3 col-md-4 col-12 hp">압구정웰동물병원</div>
                <div class="col-lg-3 col-md-4 col-12 tel">3443-0275</div>
                <div class="col-lg-4  col-md-4 col-12 addr">서울특별시 강남구 압구정로 108 (신사동, 덕산빌딩 203호 )</div>
            </div>
            <!--section end-->
            <!--footer-->
            <div class="row footer">
                <div class="col-12">페이지 네비</div>
            </div>
               </div>
           </div>
        </div>
	
	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
   <jsp:include page="/WEB-INF/views/module/footer.jsp" ></jsp:include>
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
</body>
</html>