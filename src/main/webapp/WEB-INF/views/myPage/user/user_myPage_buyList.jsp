<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>마이페이지-구매목록</title>
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
                #cart_wrapper{
                	color: #754F44;
                }
                .itemName{
                	text-decoration: none;
                }
                .itemName:hover{
                	font-weight: bold;
                }
                .navi{
                	color: #754F44;
                	text-decoration: none;
                	margin: 0px 5px;
/*                 	font-family:  */
                }
                .navi:hover{
                	font-weight: bold;
                }
            </style>
			<jsp:include page="/WEB-INF/views/myPage/user/user_module/mypage_user_style.jsp" ></jsp:include><!-- user 마이페이지 스타일 -->
            <jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
        </head>
        <body data-spy="scroll" data-target=".site-navbar-target"
              data-offset="300" id="home-section">
            <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
            <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
            <jsp:include page="/WEB-INF/views/myPage/user/user_module/top_menu_info.jsp"></jsp:include>
                            <!-- /마이페이지 상단메뉴 -->
                            <!-- 마이페이지 메뉴별 내용띄워주기 -->
                            <div class="tab-content" id="pills-tabContent">
                                <!-- 구매내역 -->
                                <div class="tab-pane fade show active" id="pills-profile">
                                    <div id="cart_wrapper">
                                        <div class="row border-bottom border-success">
                                            <div class="col-5">상품명</div>
                                            <div class="col-2">금액</div>
                                            <div class="col-3">구매일</div>
                                            <div class="col-2">판매자</div>
                                        </div>
                                        <div class="row buyList_contents">
                                        	<c:forEach var="dto" items="${buyList }">
	                                            <div class="col-12 row mb-2">
                                                    <div class="col-5"><a class="itemName" href="item?seq=${dto.item_seq }">${dto.item_name}</a></div>
                                                    <div class="col-2">${dto.item_price }</div>
                                                    <div class="col-3">${dto.pay_date }</div>
                                                    <div class="col-2">${dto.seller }</div>
                                                </div>
                                        	</c:forEach>
                                        </div>
                                        <div class="row">
											<div class="col-12 d-flex justify-content-center" id="naviBox">
												<c:if test="${pageNavi.needPrev == 1 }">
													<a class="navi" href="toMyPage_buyList?currentPage=${pageNavi.startNavi - 1}">&laquo;</a>
												</c:if>
												<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
													<a class="navi" href="toMyPage_buyList?currentPage=${pageNavi.currentPage - 1}">&lt;</a>
												</c:if>
												<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
													<a class="navi" href="toMyPage_buyList?currentPage=${i }" class="pageNum">${i}</a>
												</c:forEach>
												<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
													<a class="navi" href="toMyPage_buyList?currentPage=${pageNavi.currentPage + 1}">&gt;</a>
												</c:if>
												<c:if test="${pageNavi.needNext == 1 }">
													<a class="navi" href="toMyPage_buyList?currentPage=${pageNavi.endNavi + 1}">&raquo;</a>
												</c:if>
											</div>
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
        <script>
        	$(".navi").each(function(i, item){
        		if($(item).text() == ${pageNavi.currentPage}){
        			$(item).css("color", "#EC7357");
        		}
        	});
        </script>
        
    </html>