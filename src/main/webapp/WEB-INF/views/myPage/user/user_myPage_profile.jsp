<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>마이페이지</title>
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"
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
					max-height: 600px;
                }
            </style>
        </head>
        <body data-spy="scroll" data-target=".site-navbar-target"
              data-offset="300" id="home-section">
            <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
            <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
            <div class="jumbotron px-0 pb-0">
            	<img src="/mypage/dog_1.jpg">
            </div>
            <section id="wrapper" class="mb-5">
                <div class="container">
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
                                    	${memberDTO.name }님                                </div>
                                <div>
                                    	현재포인트
                                </div>
                                <div>
                                    ${memberDTO.point } point
                                </div>
                                <div>
                                    	안읽은 쪽지 : 3개
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                        <!-- 마이페이지 상단메뉴 -->
                            <ul class="nav nav_my_page_ul nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active my_page_nav" id="pills-profile-tab" href="toMyPage">내 정보</a>
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
                                    <a class="nav-link my_page_nav" id="pills-message-tab" href="toMyPage_message">쪽지함</a>
                                </li>
                            </ul>
                            <!-- /마이페이지 상단메뉴 -->
                            <!-- 마이페이지 메뉴별 내용띄워주기 -->
                            <div class="tab-content" id="pills-tabContent">
                            <!-- 내정보 -->
                                <div class="tab-pane fade show active" id="pills-profile">
                                    <form>
                                        <div class="form-group row">
                                            <label for="my_id" class="col-sm-2 col-form-label">ID</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_id" value="임시 id입니다.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_password" class="col-sm-2 col-form-label">Password</label>
                                            <div class="col-sm-10">
                                            	<button type="button" id="my_password" class="btn btn-outline-warning rounded">비밀번호 변경하기</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_nickname" class="col-sm-2 col-form-label">Nickname</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_nickname" value="임시 닉네임입니다.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_email" class="col-sm-2 col-form-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_email" value="example@email.com">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_birth" class="col-sm-2 col-form-label">Birthday</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_birth" value="1993/07/08">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_gender" class="col-sm-2 col-form-label">Gender</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_gender" value="여자">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_phone" class="col-sm-2 col-form-label">Phone</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_phone" value="010-0000-0000">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_zipcode" class="col-sm-2 col-form-label">Zipcode</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_zipcode" value="05050">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="my_address" class="col-sm-2 col-form-label">Address</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control-plaintext" id="my_address" value="서울 성북구 123123">
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                        	<button type="button" class="btn btn-outline-warning rounded">수정하기</button>
                                        </div>
                                    </form>
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