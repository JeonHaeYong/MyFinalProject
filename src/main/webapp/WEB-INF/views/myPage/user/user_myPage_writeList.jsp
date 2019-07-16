<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
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
                .jumbotron{
                	background-color: white;
                }
                .jumbotron>img{
                    width: 100%;
                    max-height: 600px;
                }
/*                 <!-- 해당페이지 스타일--> */
				.write_contents{
					cursor: pointer;
				}
				.write_contents:hover{
					background-color: rgba(137, 255, 137, 0.34);
				}
            </style>
            <jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
        </head>
        <body id="home-section">
            <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
            <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
            <jsp:include page="/WEB-INF/views/myPage/user/user_module/top_menu_info.jsp"></jsp:include>
                            <!-- /마이페이지 상단메뉴 -->
                            <div class="tab-content">
                                <!-- 내글 목록 -->
                                <div class="tab-pane fade show active">
                                    <div id="writeList_wrapper">
                                        <div class="row border-bottom border-success">
                                            <div class="col-md-3 col-3">글쓴 게시판</div>
                                            <div class="col-7">글 제목</div>
                                            <div class="col-lg-2 d-lg-block d-none">글 쓴날짜</div>
                                        </div>
                                        <div class="row write_contents">
                                            <div class="col-3">실종신고게시판</div>
                                            <div class="col-7">우리리치가 없어졌어요ㅠㅠ</div>
                                            <div class="col-lg-2 d-lg-block d-none">2015-05-06</div>
                                        </div>
                                        <div class="row write_contents">
                                            <div class="col-3">무료나눔</div>
                                            <div class="col-7">개껌 나눔합니다! 여러종류있어요</div>
                                            <div class="col-lg-2 d-lg-block d-none">2017-05-06</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
<jsp:include page="/WEB-INF/views/myPage/user/user_module/menu_footer.jsp" ></jsp:include>

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