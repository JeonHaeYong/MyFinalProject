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
                	body *{font-family: 'Gamja Flower' !important}
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
                    .menu-box>div:not(.s-menu):hover{color: #754F44; font-weight:bold; background-color: #FBFFB950;cursor: pointer;}
                    .menu-row{text-align: -webkit-center;}
                    a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
                    /*~왼쪽 메뉴 */
                    .write-btn{background-color: #EC7357; border: none; font-size: 20px; color:white; border-radius: 5px;cursor: pointer;}
                    .write-btn:hover{font-weight: bold; background-color: #f7613e;}
                    .review-wrapper{
                        max-width: 1300px;
                        font-size: 22px !important;
                        font-family: 'Gamja Flower' !important;
                    }
                    /* ---- */
                    /* #FBFFB9 1번, #FDD692 2번, #EC7357 3번, #754F44 4번 */
                    .noT_bgc{
                        background-color: #EC7357;
                        color: white;
                    }
                    .font_namsan>p{
						font-family: 'SeoulNamsanM' !important;
						font-weight: bold;
						color: #754F44;
                    }
                    .navi{
                        text-decoration: none;
                        background-color: #FDD69270;
                        color: #754F44;
                        font-size:20px;
                        padding:6px 12px;
                        border-radius: 30px;
                    }
                    .navi:hover{
                        font-weight: bold;
                        background-color: #FDD692;
                    }
                    .card_title{
                    	color: #754F44;
                    	font-size: 24px;
                    }
                    .card_title:hover {
						font-weight: 900;
					}
					/*checkbox*/
					.custom-control-input:checked~.custom-control-label:before{
                    	border-color: #EC7357 !important;
                    }
                    .custom-control-input:checked~.custom-control-label:after{
                    	border-color: #EC7357 !important;
                   		background-color: #EC7357 !important;
                   		border-radius: 0.25rem;
                    }
                    .all-label:before,.all-label:after{
                    	width: 22px !important;
						height: 22px !important;
						margin-top: 2px;
                    }
                    #review_link
					{
						color: #EC7357 !important;
						font-weight: 600 !important;
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
                                <div class="card-body font_namsan">
                                    <blockquote class="blockquote font_namsan">
                                        <p>라온펫을 통해 반려동물을 다시 만난 재회 후기입니다.<br>
                                           	 다들 축하해주세요!!</p>
                                            	<small>라온펫을통해 반려동물을 만났다면? -> <input type="button" class="write-btn toWrite" value="후기쓰러가기"></small>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                            <div class="row menu-box">
                                <div class="col-12 s-menu">M E N U</div>
                                <div class="col-12 ">
                                	<a name="s-menu" href="toReviewList"><div>재회후기</div></a>
                                </div>
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
                                    <c:forEach var="list" items="${reviewList }" varStatus="status">
                                        <div class="col-6">
                                            <form action="toReviewDetail" method="post">
                                            	<c:if test="${type==4 }">
	                                            	<div class="custom-control custom-checkbox">
	                                                    <input type="checkbox" class="custom-control-input review_check" id="review_${status.count }" value="${list.seq }">
	                                                    <label class="custom-control-label" for="review_${status.count }"></label>
	                                                </div>
                                            	</c:if>
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
                                                                    <a class="text-truncate text-decoration-none card_title w-80" href="javascript:void(0)" onclick="reviewListForm(this);">${list.title }</a>
                                                                    <span class="w-20 badge badge-pill badge-danger">${list.comments} </span>
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
                            <div class="row my-4">
                                <div class="col-12 text-center">
                                    <c:forEach var="navi" items="${navi }">
                                        <form class="ml-1 d-inline-flex" action="toReviewList" method="post">
                                            <input type="hidden" value="${navi }" name="currentPage">
                                            <a class="navi navi_click_a" href="javascript:void(0)" onclick="reviewNaviClick(this);">${navi }</a>
                                        </form>
                                    </c:forEach>
                                </div>
                            </div><!-- / 네비게이터-->
                            <form action="toWriteReview" method="post">
                                <div class="row mb-3">
                                	<c:choose>
                                		<c:when test="${type==4 }">
                                			<div class="col-8 text-left">
                                				<div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="allCheck">
                                                    <label class="custom-control-label all-label" for="allCheck">전체글선택</label>
                                                    <input type="button" id="deleteReviewList" class="write-btn mx-2 text-center" value="글삭제(관리자)">
                                                </div>
                                			</div>
                                			<div class="col-4 text-right"><input id="toWriteReview" type="submit" class="write-btn" value="글쓰기"></div>
                                		</c:when>
                                		<c:otherwise>
                                			<div class="col-12 text-right"><input id="toWriteReview" type="submit" class="write-btn" value="글쓰기"></div>
                                		</c:otherwise>
                                	</c:choose>
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
                });
                //checkbox function
                function allChecked( all , part ) {
                	if($(all).prop("checked")){
                        $(part).prop("checked",true);
                    }else{
                        $(part).prop("checked",false);
                    }
				}
                function partChecked( all , part ) {
                    var length = $(part).length;
                    var count = 0;
                    $(part).each(function(i,item){
                    	if(!($(item).prop("checked"))&&$(all).prop("checked")){
                            $(all).prop("checked",false);
                            return false;
                        }                      
                        if($(item).prop("checked")){
                            count++;
                        }
                        if(length==count){
                            $(all).prop("checked",true);
                        }
                    });
				}
                //받은쪽지함에서 Checkbox 전체버튼, 개별버튼 작동하게하기.
                $("#allCheck").on("change",function(){
					var all = $(this);
					var check = $(".review_check");
					allChecked(all,check);
                });
                $(document).on("change",".review_check",function(){
					var all = $("#allCheck");
					var check = $(".review_check");
					partChecked(all,check);
                });
                $("#deleteReviewList").on("click",function(){
                	var form = $("<form id='deleteReviewList_form' action='deleteReview' method='post'></form>");
                	var countCheck = true;
                	$(".review_check").each(function(i,item){
                		if($(item).prop("checked")){
                			form.append("<input type='hidden' name='reviewList' value='"+$(item).val()+"'>");
                			countCheck = false;
                		}
                	});
                	if(countCheck){
                		alert("삭제할 글을 선택해주세요.");
                		return false;
                	}
                	$(body).append(form);
                	$("#deleteReviewList_form").submit();
                });
            </script>
        </html>