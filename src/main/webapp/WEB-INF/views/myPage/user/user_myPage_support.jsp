<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
				.support_wrapper{
					color: #754F44;
					cursor: default;
				}
				.support_contents:hover{
					background-color: rgba(137, 255, 137, 0.34);
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
            <jsp:include page="/WEB-INF/views/myPage/user/user_module/mypage_user_style.jsp" ></jsp:include><!-- user 마이페이지 스타일 -->
			<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
   <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
			<jsp:include page="/WEB-INF/views/myPage/user/user_module/top_menu_info.jsp"></jsp:include>
                            <!-- /마이페이지 상단메뉴 -->
                            <div class="tab-content" id="goTop">
                                <!-- 내글 목록 -->
                                <div class="tab-pane fade show active">
                                    <div class="support_wrapper">
                                    	<div class="row border-bottom border-success">
                                            <div class="col-4 text-truncate">후원 업체 명</div>
                                            <div class="col-2 text-truncate">후원 금액</div>
                                            <div class="col-4 text-truncate">후원 날짜</div>
                                            <div class="col-2 text-truncate">후원 방식</div>
                                        </div>
                                        <div class="row donation_List ajaxRow">
                                        	<c:if test="${dpList.size() == 0 }">
                                        		<div class="col-12 row mt-2 mb-1">
	                                        		후원 내역이 없습니다.
	                                        	</div>
                                        	</c:if>
	                                    	<c:forEach var="dto" items="${dpList }">
	                                    		<div class="col-12 row mt-2 mb-1">
	                                    			<div class="col-4 text-truncate">${dto.donation_name }</div>
		                                            <div class="col-2 text-truncate">${dto.donation }원</div>
		                                            <div class="col-4 text-truncate">${dto.donated_time }</div>
		                                            <div class="col-2 text-truncate">${dto.donate_type }</div>
	                                    		</div>
		                                   	</c:forEach>
                                    	</div>
                                    	<div class="row mt-3 ajaxRow">
											<div class="col-12 d-flex justify-content-center" id="naviBox">
												<c:if test="${pageNavi.needPrev == 1 }">
													<a class="btn navi" href="#goTop" value="${pageNavi.startNavi - 1}">&laquo;</a>
												</c:if>
												<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
													<a class="btn navi" href="#goTop" value="${pageNavi.currentPage - 1}">&lt;</a>
												</c:if>
												<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
													<a class="btn navi" href="#goTop" class="pageNum" value="${i }">${i}</a>
												</c:forEach>
												<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
													<a class="btn navi" href="#goTop" value="${pageNavi.currentPage + 1}">&gt;</a>
												</c:if>
												<c:if test="${pageNavi.needNext == 1 }">
													<a class="btn navi" href="#goTop" value="${pageNavi.endNavi + 1}">&raquo;</a>
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
		
		$(document).on("click", ".navi", function(){
			var currentPage = $(this).attr("value");
			$.ajax({
				url: "toMyPage_support",
				data: {
					currentPage: currentPage,
					template: "y"
				}
			}).done(function(resp){
				$(".ajaxRow").remove();
				$(".support_wrapper").append(resp);
				$(".navi").each(function(i, item){
					if($(item).text() == currentPage){
						$(this).css("color", "#EC7357");
					}
				});
			});
		});
		
   </script>
</html>