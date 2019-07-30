<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>마이페이지 -내 글 목록</title>
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
				.write_contents{
					cursor: pointer;
				}
				.write_contents:hover{
					background-color: #FBFFB950;
				}
				 .navi{
                        text-decoration: none;
                        background-color: #FDD69270;
                        color: #754F44;
                        font-size:20px;
                        padding:6px 12px;
                        border-radius: 30px;
                        font-family: 'Gamja Flower';
                    }
                    .navi:hover,.navi.active{
                        font-weight: bold;
                        background-color: #FDD692;
                    }
                    
            </style>
            <jsp:include page="/WEB-INF/views/myPage/user/user_module/mypage_user_style.jsp" ></jsp:include><!-- user 마이페이지 스타일 -->
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
                                    	<div class="text-center">
	                                        <div class="row border-bottom font-weight-bold">
	                                            <div class="col-lg-2 col-5">게시판</div>
	                                            <div class="col-7">글 제목</div>
	                                            <div class="col-lg-3 d-lg-block d-none">글 쓴날짜</div>
	                                        </div>
	                                        <c:if test="${list.size()==0 }">
	                                        	<div style="height: 300px; line-height: 300px;font-size:30px;" class="text-center">작성한 글이 없습니다.</div>
	                                        </c:if>
	                                        
	                                        <c:if test="${list.size()!=0 }">
	                                        	<div style="min-height: 300px;">
		                                        	<c:forEach var="list" items="${list }">
		                                        		<c:if test="${list.type =='재회후기'}">
		                                        			<form action="toReviewDetail" method="post">
		                                        		</c:if>
		                                        		<c:if test="${list.type =='무료나눔' }">
		                                        			<form action="item" method="post">
		                                        		</c:if>
		                                        		<c:if test="${list.type =='실종신고' }">
		                                        			<form action="toReportContent" method="post">
		                                        		</c:if>
		                                        		<c:if test="${list.type =='임시보호' }">
		                                        			<form action="detailTempProtect" method="post">
		                                        		</c:if>
			                                        		<input type="hidden" value="${list.seq }" name="seq">
			                                        		<div class="row write_contents" onclick="toDetail(this);">
					                                            <div class="col-lg-2 col-5">${list.type }</div>
					                                            <div class="col-7 text-truncate">${list.title}</div>
					                                            <div class="col-lg-3 d-lg-block d-none">${list.formed_date }</div>
					                                       	</div>
			                                        	</form>
		                                        	</c:forEach>
		                                        </div>
	                                            <div class="row my-4">
	                                            	<div class="col-12 text-center">
	                                            		<c:forEach var="navi" items="${navi }">
				                                        	<c:choose>
				                                        		<c:when test="${currentPage==navi }">
				                                        			<a class="ml-1 navi boardList_navi active" href="javascript:void(0)">${navi }</a>
				                                        		</c:when>
				                                        		<c:otherwise>
				                                        			<a class="ml-1 navi boardList_navi" href="javascript:void(0)">${navi }</a>
				                                        		</c:otherwise>
				                                        	</c:choose>
				                                        </c:forEach>
	                                            	</div>
	                                            </div>
	                                        </c:if>
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
        	$(document).on("click",".boardList_navi",function(){
            	var currentPage = $(this).text();
            	if(currentPage=="<"){
            		var prev =  $(this).next().text();
            		currentPage = parseInt(prev) - 1 ;
            	}else if(currentPage==">"){
            		var next  = $(this).prev().text();
            		currentPage = parseInt(next) + 1 ;
            	}
            	//리스트랑 navi 가져오기.
            	$.ajax({
            		url: "toMyPage_writeList",
            		type: "post",
            		data : {
            			currentPage : currentPage,
            			data : currentPage
            		}
            	}).done(function(resp){
					$("#writeList_wrapper").html("");
					$("#writeList_wrapper").append(resp);
            	}).fail(function(a,b,c){
            		location.href="error";
            	});
        	});
        	function toDetail(param){
        		$(param).parents("form").submit();
        	}
        	$(".myjumbotron").attr("src","/mypage/dog_cat_1.jpg");
        </script>
    </html>