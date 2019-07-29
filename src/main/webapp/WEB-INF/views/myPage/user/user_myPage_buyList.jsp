<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>마이페이지 - 구매목록</title>
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
                .cart_wrapper{
                	color: #754F44;
                	cursor: default;
                }
                .itemName{
                	text-decoration: none;
                }
                .itemName:hover{
                	font-weight: bold;
                	background-color: #FDD692;
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
                .sendMsg_btn{
                	text-decoration: none;
                }
                .sendMsg_btn:hover{
	            	font-weight: bold;
	            	background-color: #FDD692;
	            }
	            .bg2_ft4{
		            color : #754F44 !important;
		            background-color: #FDD69270 !important;
		            border: none;
				}
				.bg2_ft4:hover{
					color : #754F44 !important;
		            background-color: #FDD692 !important;
		            font-weight: bold !important;
				}
				.bg4_ft2{
		            color : #FDD692 !important;
		            background-color: rgba(117, 79, 68, 0.91) !important;
		            border: none;
				}
				.bg4_ft2:hover{
		            color : #FDD692 !important;
		            background-color: #754F44 !important;
		            font-weight: bold !important;
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
                                    <div class="cart_wrapper">
                                        <div class="row border-bottom border-success">
                                            <div class="col-5 text-truncate">상품명</div>
                                            <div class="col-2 text-truncate">금액</div>
                                            <div class="col-3 text-truncate">구매일</div>
                                            <div class="col-2 text-truncate">판매자</div>
                                        </div>
                                        <div class="row buyList_contents">
                                        	<c:forEach var="dto" items="${buyList }">
	                                            <div class="col-12 row mt-2 mb-1">
                                                    <div class="col-5 text-truncate"><a class="itemName" href="item?seq=${dto.item_seq }">${dto.item_name}</a></div>
                                                    <div class="col-2 text-truncate">${dto.item_price }</div>
                                                    <div class="col-3 text-truncate">${dto.pay_date }</div>
                                                    <div class="col-2 text-truncate"><a class="sendMsg_btn" data-toggle="modal" data-target="#msg_modal" data-whatever="@mdo" href="javascript(0)">${dto.seller }</a></div>
                                                </div>
                                        	</c:forEach>
                                        </div>
                                        <div class="row mt-3">
											<div class="col-12 d-flex justify-content-center" id="naviBox">
												<c:if test="${pageNavi.needPrev == 1 }">
													<a class="btn navi" href="toMyPage_buyList?currentPage=${pageNavi.startNavi - 1}">&laquo;</a>
												</c:if>
												<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
													<a class="btn navi" href="toMyPage_buyList?currentPage=${pageNavi.currentPage - 1}">&lt;</a>
												</c:if>
												<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
													<a class="btn navi" href="toMyPage_buyList?currentPage=${i }" class="pageNum">${i}</a>
												</c:forEach>
												<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
													<a class="btn navi" href="toMyPage_buyList?currentPage=${pageNavi.currentPage + 1}">&gt;</a>
												</c:if>
												<c:if test="${pageNavi.needNext == 1 }">
													<a class="btn navi" href="toMyPage_buyList?currentPage=${pageNavi.endNavi + 1}">&raquo;</a>
												</c:if>
											</div>
										</div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade text-left" id="msg_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					            <div class="modal-dialog" role="document">
					                <div class="modal-content">
					                    <div class="modal-header">
					                        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
					                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                            <span aria-hidden="true">&times;</span>
					                        </button>
					                    </div>
					                    <div class="modal-body">
					                        <form id="msg_send_form" action="insertMsg" method="post">
					                            <div class="form-group">
					                                <label for="recipient-name" class="col-form-label">받는사람ID : </label>
					                                <input type="text" class="form-control" id="recipient-name" name="recipient" readonly>
					                            </div>
					                            <div class="form-group">
					                                <label for="message-text" class="col-form-label">보낼메세지:</label>
					                                <textarea rows="8" cols="80" class="form-control" id="message-text" style="resize:none;" name="contents"></textarea>
					                            </div>
					                            <div><span id="counter">0/300</span></div>
					                            <input type="hidden" value="${sessionScope.id}" name="sender">
					                        </form>
					                    </div>
					                    <div class="modal-footer">
					                        <button id="msg_close_btn" type="button" class="btn btn-secondary bg4_ft2" data-dismiss="modal">닫기</button>
					                        <button id="msg_send_btn" type="button" class="btn btn-primary bg2_ft4">쪽지 보내기</button>
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
        	
        	$(".sendMsg_btn").on("click", function(){
        		$("#recipient-name").val($(this).text());
        	});
        	
        	$('#message-text').keyup(function (e){
                var content = $(this).val();
                if(content.length>300){
                    alert("쪽지는 300자 이내만 가능합니다.");
                    content = content.substr(0,300);
                    $('#counter').html(content.length + '/300');
                    $(this).val(content);
                    return;
                }else{
                    $('#counter').html(content.length + '/300');
                }
            });
            $("#msg_send_btn").on("click",function(){
                var recipient = $("#recipient-name").val();
                var content = $('#message-text').val();
                if("${sessionScope.id}"==recipient){
                	alert("쪽지는 본인에게 쓸수없습니다.");
                	$("#recipient-name").focus();
                	return false;
                }
                $.ajax({
                    url: "idExistOk",
                    method: "post",
                    data: {
                        id : recipient
                    }
                }).done(function(resp){
                    //alert("조회결과->" +resp);
                    if(resp=="0"){
                        alert("존재하지 않는 회원입니다. \r\n받는사람ID를 다시한번 확인해주세요.");
                        return;
                    }
                    alert("쪽지를 보냈습니다.");
                    $("#msg_send_form").submit();
                });
            });
            
            $("#msg_close_btn").on("click", function(){
            	$('#message-text').val("");
            });
        </script>
        
    </html>