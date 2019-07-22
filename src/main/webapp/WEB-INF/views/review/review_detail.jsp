<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                *{ font-family: 'Gamja Flower' !important;}
                ::placeholder{font-family: 'Gamja Flower'}
                /*점보트론 이미지*/
                .jumbotron{
                    background-color: white;
                }
                .jumbotron>img{
                    width: 100%;
                    max-height: 600px;
                }
                /*왼쪽 메뉴 */
                .menu-box{width: 150px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px; margin-top: 50px;}
                .menu-box>div{height: 35px;}
                .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px; color:#B45F04; font-size:40px;}
                .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
                .menu-row{text-align: -webkit-center;}
                a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
                a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
                /*~왼쪽 메뉴 */
                .write-btn{background-color: #EC7357; border: none; font-size: 20px; color:white; border-radius: 5px;}
                .write-btn:hover{font-weight: bold; background-color: #f7613e;}
            </style>

        </head>
        <body data-spy="scroll" data-target=".site-navbar-target"
              data-offset="300" id="home-section">
            <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
            <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
            <div class="jumbotron px-0 pb-0">
                <img src="/mypage/dog_1.jpg">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                        <div class="row menu-box">
                            <div class="col-12 s-menu">M E N U</div>
                            <div class="col-12 "><a name="s-menu" href="toReviewList">재회 후기</a></div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-lg-9 col-md-8 col-sm-12 col-12">
                    	<div class="row">
                    		<div class="col-12 text-center">
                    			<h1>재회 후기</h1>
                    		</div>
                    	</div>
						<div class="row">
							<div class="col-4">
								<img class="w-100" src="review/${reviewDTO.image_path1 }">
							</div>
							<div class="col-8">
								<div class="d-flex justify-content-between"><span class="w-20">작성자 : ${reviewDTO.writer }</span><span>${reviewDTO.formed_date }</span></div>
								<div><span class="w-20">제목 : </span><span class="w-80">${reviewDTO.title }</span></div>
								<div><span>${reviewDTO.contents }</span></div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="text-right">
									<c:if test="${id == reviewDTO.writer }">
										<input type="button" class="btn btn-outline-warning rounded" value="수정">
										<input type="button" class="btn btn-outline-warning rounded" value="삭제">
									</c:if>
									<a role="button" class="btn btn-outline-warning rounded" href="toReviewList?currentPage=${currentPage }">목록</a>
								</div>
							</div>
						</div>
						<div class="row">
							<div></div>
						</div>
                    </div>
                </div>
            </div>

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