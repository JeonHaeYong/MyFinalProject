<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-쪽지함</title>
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
<style>
                .topBackGround{
                    height: 100px;
                }
                .nav-link{
                    text-decoration: none;
                    color: green;
                }
                .nav-link:hover{
                    color: orange;
                }
                .my_page_nav.active{
                    background-color: orange !important;
                }
                .my_page_info{
                    text-align: center;
                }
                .nav_my_page_ul{
                    border-bottom: 1px solid green ; 
                }
                .nav_my_page_ul>li{
                    width: 16.6%;
                    text-align: center;
                }
                /*점보트론 이미지*/
                .jumbotron>img{
					width: 100%;
					height: 600px;
                }
            </style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
   <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron px-0 pb-0">
                <img src="/mypage/dog_cat_1.jpg">
            </div>
            <section id="wrapper" class="mb-5">
                <div class="container text-center">
                    <div class="row">
                        <div class="col-4 p-2">
                            <div class="my_page_empty invisible">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" aria-controls="pills-home" aria-selected="true">Home</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="my_page_info">
                                <div>
                                    <img src="/resources/images/dog_1.jpg" class="rounded-circle" style="width: 100px; height: 100px;">
                                </div>
                                <div>
                                    윤혜영님(닉네임)
                                </div>
                                <div>
                                    현재포인트
                                </div>
                                <div>
                                    200pt
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <!-- 마이페이지 상단메뉴 -->
                            <ul class="nav nav_my_page_ul nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-profile-tab" href="toMyPage">내 정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-writeList-tab"  href="toMyPage_writeList">내 글목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-support-tab" href="toMyPage_support">후원목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-cart-tab" href="toMyPage_cart">장바구니</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-buyList-tab" href="toMyPage_buyList">구매내역</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav active" id="pills-message-tab" href="toMyPage_message">쪽지함</a>
                                </li>
                            </ul>
                            <!-- /마이페이지 상단메뉴 -->
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-profile">
                                <!-- 쪽지함 -->
                                    <div id="message_wrapper">
                                        <div class="row">
                                        	<div class="col-12">
<nav>
<div class="nav nav-tabs d-flex justify-content-center" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-inbox-tab" data-toggle="tab" href="#nav-inbox" role="tab" aria-controls="nav-inbox" aria-selected="true">받은 쪽지함</a>
    <a class="nav-item nav-link" id="nav-sentbox-tab" data-toggle="tab" href="#nav-sentbox" role="tab" aria-controls="nav-sentbox" aria-selected="false">보낸 쪽지함</a>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-inbox" role="tabpanel" aria-labelledby="nav-inbox-tab">
	<!-- 받은쪽지함 -->
	<div class="row">
                    <div class="col-1">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1"></label>
                        </div> 
                    </div>
                    <div class="col-2">보낸사람</div>
                    <div class="col-5">내용</div>
                    <div class="col-2">날짜</div>
                    <div class="col-2">읽음여부</div>
                </div>
</div>
  <div class="tab-pane fade" id="nav-sentbox" role="tabpanel" aria-labelledby="nav-sentbox-tab">
	<!-- 보낸쪽지함 -->
	<div class="row">
                    <div class="col-1">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                            <label class="custom-control-label" for="customCheck2"></label>
                        </div> 
                    </div>
                    <div class="col-2">보낸사람</div>
                    <div class="col-5">내용</div>
                    <div class="col-2">날짜</div>
                    <div class="col-2">읽음여부</div>
                </div>
</div>
</div>
                                        	</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

   <!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->

   <jsp:include page="/WEB-INF/views/module/footer.jsp" ></jsp:include>
   
</body>
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
</html>