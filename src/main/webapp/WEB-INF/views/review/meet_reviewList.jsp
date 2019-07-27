<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>재회 후기</title>
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
                <jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
                <style>
                    *{ font-family: 'Gamja Flower' !important;}
                    ::placeholder{font-family: 'Gamja Flower'}
                    /*점보트론 이미지*/
                    .jumbotron{
                        background-color: white;
                        padding-top: 5rem;
                    }
                    .jumbotron>img{
                        width: 100%;
                        max-height: 600px;
                    }
                    /*왼쪽 메뉴 */
                    .menu-box{width: 150px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px;}
                    .menu-box>div{height: 35px;}
                    .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px; color:#B45F04; font-size:40px;}
                    .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
                    .menu-row{text-align: -webkit-center;}
                    a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
                    a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
                    /*~왼쪽 메뉴 */
                    .write-btn{background-color: #EC7357; border: none; font-size: 20px; color:white; border-radius: 5px;}
                    .write-btn:hover{font-weight: bold; background-color: #f7613e;}
                    .review-wrapper{
                        max-width: 1300px;
                        font-size: 22px !important;
                    }
                    /* ---- */
                    /* #FBFFB9 1번, #FDD692 2번, #EC7357 3번, #754F44 4번 */
                    .noT_bgc{
                        background-color: #EC7357;
                        color: white;
                    }
                    .font_namsan{

                    }
                    .navi{
                        text-decoration: none;
                        background-color: #FDD69270;
                        color: #754F44;
                        font-size:19px;
                        font-family: 'Gamja Flower';
                        padding:6px 12px;
                    }
                    .navi:hover{
                        font-weight: bold;
                        background-color: #FDD692;
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
                <div class="container review-wrapper">
                    <div class="row mb-3">
                        <div class="col-lg-2 col-md-3 col-sm-12 col-12">

                        </div>
                        <div class="col-1"></div>
                        <div class="col-lg-9 col-md-8 col-sm-12 col-12 text-center">
                            <div class="card">
                                <div class="card-header noT_bgc">
                                    <h3 class="m-0">-재회후기-</h3>
                                </div>
                                <div class="card-body">
                                    <blockquote class="blockquote">
                                        <p>라온펫을 통해 반려동물을 다시 만난 재회 후기입니다.<br>
                                            다들 축하해주세요!!<br>
                                            라온펫을통해 반려동물을 만났다면? -> <input type="button" class="write-btn toWrite" value="후기쓰러가기"></p>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                            <div class="row menu-box">
                                <div class="col-12 s-menu">M E N U</div>
                                <div class="col-12 "><a name="s-menu" href="toReviewList">재회 후기</a></div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-lg-9 col-md-8 col-sm-12 col-12">
                            <!-- list있으면 반복문 -->
                            <c:if test="${reviewList.size()==0 }">
                                <div class="row">
                                    <div class="col-12 text-center"><h3>재회후기가 없습니다.</h3></div>
                                </div>
                            </c:if>
                            <c:if test="${reviewList.size()!=0 }">
                                <div class="row">
                                    <c:forEach var="list" items="${reviewList }">
                                        <div class="col-6">
                                            <form action="toReviewDetail" method="post">
                                                <input type="hidden" value="${list.seq }" name="seq">
                                                <input type="hidden" value="${currentPage }" name="currentPage">
                                                <div class="card mb-3" style="max-width: 540px;">
                                                    <div class="row no-gutters">
                                                        <div class="col-md-4">
                                                            <div style="width: 100%;height: 100%;">
                                                                <img src="/review/${list.image_path1 }" class="card-img" style="width: 100%;height: 100%;">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <h5 class="card-title d-flex justify-content-between">
                                                                    <a class="text-decoration-none" href="javascript:void(0)" onclick="reviewListForm(this);">${list.title }</a><span class="badge badge-pill badge-danger">${list.comments} </span>
                                                                </h5>
                                                                <p class="card-text text-truncate">${list.contents }</p>
                                                                <p class="card-text d-flex justify-content-between"><small class="text-muted">${list.formed_date }</small><small class="text-muted">조회수 : ${list.view_count }</small></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach> 
                                </div>      
                            </c:if>
                            <div class="row mx-3">
                                <div class="col-12 text-center">
                                    <c:forEach var="navi" items="${navi }">
                                        <form class="my-1" action="toReviewList" method="post">
                                            <input type="hidden" value="${navi }" name="currentPage">
                                            <a class="btn navi navi_click_a" href="javascript:void(0)" onclick="reviewNaviClick(this);">${navi }</a>
                                        </form>
                                    </c:forEach>
                                </div>
                            </div><!-- / 네비게이터-->
                            <form action="toWriteReview" method="post">
                                <div class="row mb-3">
                                    <div class="col-12 text-right"><input id="toWriteReview" type="submit" class="write-btn" value="글쓰기"></div>
                                </div>
                            </form>
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
            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
            <script>
                function reviewListForm(param){
                    $(param).parents("form").submit();
                }
                function reviewNaviClick(param){
                    var navi = $(param).text();
                    if(navi=="<"){
                        var page  = $(param).parents(".review_page_navi").next().attr("value");
                        navi = parseInt(page) - 1 ;
                    }else if(navi==">"){
                        var page  = $(param).parents(".review_page_navi").prev().attr("value");
                        navi = parseInt(page) + 1 ;
                    }
                    $(param).prev().val(navi);
                    $(param).parent().submit();
                }
                if(${writeReview!=null}){
                    alert("재회후기가 등록되었습니다.");
                }
                $(".toWrite").on("click",function(){
                    $("#toWriteReview").trigger("click");
                })
            </script>
        </html>