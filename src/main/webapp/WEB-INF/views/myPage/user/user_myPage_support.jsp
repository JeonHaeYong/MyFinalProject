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
/*                 <!-- 해당페이지 스타일--> */
				.support_contents{
					cursor: pointer;
				}
				.support_contents:hover{
					background-color: rgba(137, 255, 137, 0.34);
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
                            <div class="tab-content">
                                <!-- 내글 목록 -->
                                <div class="tab-pane fade show active">
                                    <div id="support_wrapper">
                                    	<div class="row border-bottom border-success">
                                            <div class="col-4">후원 업체 명</div>
                                            <div class="col-2">후원 금액</div>
                                            <div class="col-4">후원 날짜</div>
                                            <div class="col-2">후원 방식</div>
                                        </div>
                                        <div class="row donation_List">
	                                    	<c:forEach var="dto" items="${dpList }">
	                                            <div class="col-4">${dto.donation_name }</div>
	                                            <div class="col-2">${dto.donation }원</div>
	                                            <div class="col-4">${dto.donated_time }</div>
	                                            <div class="col-2">${dto.donate_type }</div>
		                                   	</c:forEach>
                                    	</div>
                                    	<div class="row">
											<div class="col-12 d-flex justify-content-center" id="naviBox">
												<c:if test="${pageNavi.needPrev == 1 }">
													<a class="navi" href="toMyPage_support?currentPage=${pageNavi.startNavi - 1}">&laquo;</a>
												</c:if>
												<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
													<a class="navi" href="toMyPage_support?currentPage=${pageNavi.currentPage - 1}">&lt;</a>
												</c:if>
												<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
													<a class="navi" href="toMyPage_support?currentPage=${i }" class="pageNum">${i}</a>
												</c:forEach>
												<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
													<a class="navi" href="toMyPage_support?currentPage=${pageNavi.currentPage + 1}">&gt;</a>
												</c:if>
												<c:if test="${pageNavi.needNext == 1 }">
													<a class="navi" href="toMyPage_support?currentPage=${pageNavi.endNavi + 1}">&raquo;</a>
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