<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>관리자 페이지 - 쪽지함</title>
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
                <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i" rel="stylesheet">
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
                    #container
                    {
                        margin-top: 5%;
                    }
                    #mypage_link
                    {
                        color: #EC7357 !important;
                        font-weight: 600 !important;
                    }
                    #container *
                    {
                        font-family: 'SeoulNamsanM';
                    }
					.menu_header
					{
						font-family: 'Gamja Flower', cursive !important;
						font-size: 35px;
						border-bottom: 1px solid gray;
						color : #B45F04;
						font-weight: 600;
					}



                    #menu_row > div > a{
                        font-size: 22px;
                    }
                    .selected_menu_btns {
                        font-family: 'Gamja Flower', cursive !important;
                        border-radius: 0px !important;
                        width: 100%;
                        height: 100%;
                        background-color:#FDD69270;
                        color:#754F44;
                        font-weight:bold !important;
                    }
                    .menu_btns{
                        font-family: 'Gamja Flower', cursive !important;
                        border-radius: 0px !important;
                        width: 100%;
                        height: 100%;
                        color:#754F44;
                    }
                    .menu_btns:hover{
                        background-color:#FDD692;
                        font-weight:bold !important;
                        color:#754F44;
                    }





                    .my_buttons, .navi_btns {
                        font-family: 'Gamja Flower', cursive !important;
                        background-color:#FDD69270;
                        color:#754F44;
                    }
                    .my_buttons:hover , .navi_btns:hover {
                        background-color:#FDD692;
                        font-weight:bold;
                    }
                    .selected_btn{
                        font-family: 'Gamja Flower', cursive !important;
                        color:#754F44;
                        background-color:#FDD692;
                        font-weight:bold;
                    }


                    /*쪽지함 스타일*/
                    /*부트스트랩 모달시 패딩 없애주기.*/
                    .modal-open{padding-right: 0px !important;}
                    .readMsg{
                        color : gray;
                    }
                    /*쪽지함 클릭시 글색깔 */
                    /*쪽지함 마다 다르게 스타일주기*/
                    .sent_msg_click{
                        color : royalblue;
                    }
                    .s_list_row:hover,.r_list_row:hover{
                        background-color: rgba(128, 128, 128, 0.06);
                    }
                    /*쪽지함 navi*/
                    .page-link{
                        color : #754F44;
                    }
                    .msg_box_nav{
                        color : #754F44 !important;
                    }
                    .msg_box_nav.active{
                        color : #EC7357 !important;
                    }
                    /*쪽지함 체크박스*/
                    .custom-control-input:checked~.custom-control-label:before{
                        border-color: #adb5bd !important;
                    }
                    .custom-control-input:checked~.custom-control-label:after{
                        border-color: #EC7357 !important;
                        background-color: #EC7357 !important;
                        border-radius: 0.25rem;
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
                    .navi:hover{
                        font-weight: bold;
                        background-color: #FDD692;
                    }
                    .bg2_ft4{
                        color : #754F44;
                        background-color: #FDD69270;
                    }
                    .bg2_ft4:hover{
                        color : #754F44;
                        background-color: #FDD692;
                        font-weight: bold;
                    }
                    .bg4_ft2{
                        color : #FDD692;
                        background-color: rgba(117, 79, 68, 0.91);
                    }
                    .bg4_ft2:hover{
                        color : #FDD692;
                        background-color: #754F44;
                        font-weight: bold;
                    }
                    .laon_btn_style{background-color:#FDD69270;color:#754F44; margin: 0px 2px; font-size: 1.1rem;cursor: pointer;}
                    .laon_btn_style:hover{background-color:#FDD692; font-weight:bold; color:#754F44;}
					#receivedMsg_delete_form,#sentMsg_delete_form{
						min-height: 300px;
					}
					.noMsg_height{
						min-height: 300px;
						line-height: 300px;
					}
					#pills-tabContent{
						font-size: 20px;
					}
                </style>

            </head>
            <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
                <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
                <jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
                <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	<section class="site-section">

		<div id="container" class="container">
		
			<div class="row justify-content-center">
				
				<div class="col-2 my-auto">
			
					<div id="menu_row" class="row justify-content-center">
						
						<div class="col-12 text-center my-3">
							<h2 class="menu_header my-1">관리자 메뉴</h2>
						</div>
						
						<div class="col-12  text-center px-1">
							<a href="admin-member" class="btn menu_btns">회원 관리</a>
						</div>
			
						<div class="col-12  text-center px-1">
							<a href="admin-item" class="btn menu_btns">무료 나눔 물품 승인</a>
						</div>
			
						<div class="col-12 text-center px-1">
							<a href="admin-paylog" class="btn menu_btns">무료 나눔 거래 내역</a>
						</div>
			
						<div class="col-12  text-center px-1">
							<a href="admin-donation" class="btn menu_btns">월 별 후원금 및 전달 기관</a>
						</div>
			
						<div class="col-12  text-center px-1">
							<a href="admin-quiz" class="btn menu_btns">퀴즈 당첨자</a>
						</div>
			
						<div class="col-12  text-center px-1">
							<a href="admin-chart" class="btn menu_btns">통계</a>
						</div>
						
						<div class="col-12  text-center px-1">
							<a href="admin-msg" class="btn selected_menu_btns">관리자쪽지함</a>
						</div>
						
						<div class="col-12 text-center px-1">
							<a href="admin-pwChange" class="btn menu_btns">비밀번호변경</a>
						</div>
			
					</div>
				
				</div>
				
				
				
				
				<div class="col-1"></div>
				
				
				
				<div class="col-9">
				
					<div id="contents_row" class="row justify-content-center mt-5">
						<div class="col-12">
						<div class="tab-content" id="pills-tabContent">
		                    <div class="tab-pane fade show active" id="pills-profile">
		                        <!-- 쪽지함 -->
		                        <div id="message_wrapper">
		                            <div class="row justify-content-center">
		                                <div class="col-12">
		                                    <nav>
		                                        <div class="nav nav-tabs d-flex justify-content-center" id="nav-tab" role="tablist">
		                                            <a class="nav-item nav-link active msg_box_nav text-decoration-none" id="nav-inbox-tab" data-toggle="tab" href="#nav-inbox" role="tab" aria-controls="nav-inbox" aria-selected="true">받은 쪽지함</a>
		                                            <a class="nav-item nav-link msg_box_nav text-decoration-none" id="nav-sentbox-tab" data-toggle="tab" href="#nav-sentbox" role="tab" aria-controls="nav-sentbox" aria-selected="false">보낸 쪽지함</a>
		                                        </div>
		                                    </nav>
		                                    <div class="tab-content" id="nav-tabContent">
		                                        <!-- 받은쪽지함 -->
		                                        <div class="tab-pane fade show active selectedBox" id="nav-inbox" role="tabpanel" aria-labelledby="nav-inbox-tab" name="receivedBox">
		                                            <div class="row receivedList_prev_part font-weight-bold">
		                                                <div class="col-1">
		                                                    <div class="custom-control custom-checkbox">
		                                                        <input type="checkbox" class="custom-control-input" id="r_allCheck">
		                                                        <label class="custom-control-label" for="r_allCheck"></label>
		                                                    </div> 
		                                                </div>
		                                                <div class="col-2">보낸사람</div>
		                                                <div class="col-5">내용</div>
		                                                <div class="col-lg-3 col-4">받은날짜</div>
		                                                <div class="col-lg-1 d-none d-lg-block text-center">read</div>
		                                            </div>
		                                            <!-- 테이블에서 값 가져오기 -->
		                                            <!-- 받은쪽지함 내용 -->
		                                            <c:if test="${receivedList.size()==0 }">
		                                                <div class="row">
		                                                    <div class="col-12 text-center">
		                                                        받은 쪽지가 없습니다.
		                                                    </div>
		                                                </div>
		                                            </c:if>
		                                            <form class="receivedList_part" id="receivedMsg_delete_form" action="deleteMsg" method="post">
		                                                <!-- 받은쪽지함 내용들 -->
		                                                <c:forEach var="r_list" items="${receivedList }" varStatus="status">
		                                                    <div class="row r_list_row">
		                                                        <div class="col-1">
		                                                            <div class="custom-control custom-checkbox">
		                                                                <input type="checkbox" class="custom-control-input received_check" id="r_${status.count }" name="msgSeq" value="${r_list.seq }">
		                                                                <label class="custom-control-label" for="r_${status.count }"></label>
		                                                            </div> 
		                                                        </div>
		                                                        <div class="col-2 text-truncate">${r_list.sender }</div>
		                                                        <div class="col-5 r_click_parent text-truncate">
		                                                            <c:if test="${r_list.readOk =='N'}">
		                                                                <a class="received_msg_click text-decoration-none" href="javascript:void(0)"  seq="${r_list.seq }" data-toggle="modal" data-target="#received_msg_modal" value="${r_list.sender }">${r_list.contents }</a>
		                                                            </c:if>
		                                                            <c:if test="${r_list.readOk =='Y'}">
		                                                                <a class="received_msg_click text-decoration-none readMsg" href="javascript:void(0)"  seq="${r_list.seq }" data-toggle="modal" data-target="#received_msg_modal" value="${r_list.sender }">${r_list.contents }</a>
		                                                            </c:if>
		                                                        </div>
		                                                        <div class="col-lg-3 col-4">${r_list.message_date }</div>
		                                                        <div class="col-lg-1 d-none d-lg-block r_readOk text-center">${r_list.readOk }</div>
		                                                    </div>
		                                                </c:forEach>
		                                                <!-- 받은쪽지함 내용들 -->
		                                            </form>
		                                            <!-- 받은쪽지 네비게이터 띄워주기 -->
		                                            <div class="row receivedList_part my-4">
		                                                <div class="col-12 text-center">
		                                                    <c:forEach var="navi" items="${receivedNavi }">
					                                        	<c:choose>
					                                        		<c:when test="${currentPage==navi }">
					                                        			<a class="ml-1 navi navi_click_a active" href="javascript:void(0)"  value="recipient">${navi }</a>
					                                        		</c:when>
					                                        		<c:otherwise>
					                                        			<a class="ml-1 navi navi_click_a" href="javascript:void(0)"  value="recipient">${navi }</a>
					                                        		</c:otherwise>
					                                        	</c:choose>
				                                     		</c:forEach>
		                                                </div>
		                                            </div><!-- /받은쪽지 네비게이터-->
		                                            <!-- 받은쪽지클릭하면 내용띄워주기 -->
		                                            <div class="modal fade p-0" id="received_msg_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		                                                <div class="modal-dialog modal-dialog-centered" role="document">
		                                                    <div class="modal-content">
		                                                        <div class="modal-header">
		                                                            <h5 class="modal-title" id="exampleModalLabel">쪽지 읽기</h5>
		                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                                                <span aria-hidden="true">&times;</span>
		                                                            </button>
		                                                        </div>
		                                                        <div class="modal-body">
		                                                            <div class="container-fluid">
		                                                                <div id="r_sender_modal" sender="">보낸사람 : </div>
		                                                                <div>
		                                                                    <textarea class="border-0" id="r_contents_modal" rows="8" cols="40" style="resize:none;" readonly></textarea>
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <div class="modal-footer">
		                                                            <button id="received_msg_close_btn" type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		                                                            <button id="reply_msg_btn" type="button" class="btn btn-primary">답장 보내기</button>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <!-- 보낸쪽지함 -->
		                                        <div class="tab-pane fade selectedBox" id="nav-sentbox" role="tabpanel" aria-labelledby="nav-sentbox-tab" name="sentBox">
		                                            <div class="row sentList_prev_part font-weight-bold">
		                                                <div class="col-1">
		                                                    <div class="custom-control custom-checkbox">
		                                                        <input type="checkbox" class="custom-control-input" id="s_allCheck">
		                                                        <label class="custom-control-label" for="s_allCheck"></label>
		                                                    </div> 
		                                                </div>
		                                                <div class="col-2">받는사람</div>
		                                                <div class="col-5">내용</div>
		                                                <div class="col-lg-3 col-4">보낸날짜</div>
		                                                <div class="col-lg-1 d-none d-lg-block text-center">read</div>
		                                            </div>
		                                            <c:if test="${sentList.size()==0 }">
		                                                <div class="row">
		                                                    <div class="col-12 text-center">
		                                                        보낸 쪽지가 없습니다.
		                                                    </div>
		                                                </div>
		                                            </c:if>
		                                            <form class="sentList_part" id="sentMsg_delete_form" action="deleteMsg" method="post">
		                                                <c:forEach var="s_list" items="${sentList }" varStatus="status">
		                                                    <!-- 보낸쪽지함 내용들 -->
		                                                    <div class="row s_list_row">
		                                                        <div class="col-1">
		                                                            <div class="custom-control custom-checkbox">
		                                                                <input type="checkbox" class="custom-control-input sent_check" id="s_${status.count }" name="msgSeq" value="${s_list.seq }">
		                                                                <label class="custom-control-label" for="s_${status.count }"></label>
		                                                            </div> 
		                                                        </div>
		                                                        <div class="col-2 text-truncate">${s_list.recipient }</div>
		                                                        <div class="col-5 s_click_parent text-truncate">
		                                                            <a class="sent_msg_click text-decoration-none" href="javascript:void(0)"  seq="${s_list.seq }" data-toggle="modal" data-target="#s_msg_modal" value="${s_list.recipient }">${s_list.contents }</a>
		                                                        </div>
		                                                        <div class="col-lg-3 col-4">${s_list.message_date }</div>
		                                                        <div class="col-lg-1 d-none d-lg-block s_readOk text-center">${s_list.readOk }</div>
		                                                    </div>
		                                                    <!-- //보낸쪽지함 내용들 -->
		                                                </c:forEach>
		                                            </form>
		                                            <!-- 보낸쪽지 네비게이터 띄워주기 -->
		                                            <div class="row sentList_part my-4">
		                                                <div class="col-12 text-center">
		                                                    <c:forEach var="navi" items="${sentNavi }">
					                                        	<c:choose>
					                                        		<c:when test="${currentPage==navi }">
					                                        			<a class="ml-1 navi navi_click_a active" href="javascript:void(0)"  value="sender">${navi }</a>
					                                        		</c:when>
					                                        		<c:otherwise>
					                                        			<a class="ml-1 navi navi_click_a" href="javascript:void(0)"  value="sender">${navi }</a>
					                                        		</c:otherwise>
					                                        	</c:choose>
				                                     		</c:forEach>
		                                                </div>
		                                            </div>
		                                            <!-- /보낸쪽지 네비게이터-->
		                                            <!-- 보낸쪽지클릭하면 내용띄워주기 -->
		                                            <div class="modal fade p-0" id="s_msg_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		                                                <div class="modal-dialog modal-dialog-centered" role="document">
		                                                    <div class="modal-content">
		                                                        <div class="modal-header">
		                                                            <h5 class="modal-title" id="exampleModalLabel">쪽지 읽기</h5>
		                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                                                <span aria-hidden="true">&times;</span>
		                                                            </button>
		                                                        </div>
		                                                        <div class="modal-body">
		                                                            <div class="container-fluid">
		                                                                <div id="s_recipient_modal">받는사람:</div>
		                                                                <div>
		                                                                    <textarea class="border-0" id="s_contents_modal" rows="8" cols="40" style="resize:none;" readonly></textarea>
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <div class="modal-footer">
		                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <!-- /보낸쪽지클릭하면 내용띄워주기 -->
		                                        </div>
		                                        <!-- /보낸쪽지함 -->
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- /쪽지함 -->
		                    </div>
		                </div>
						
						
						<div class="row">
		                    <div class="col-12 text-center">
		                        <button type="button" class="btn laon_btn_style" id="selectMsg_delete">선택 삭제하기</button>
		                        <button id="sendMsg_btn"type="button" class="btn laon_btn_style" data-toggle="modal" data-target="#msg_modal" data-whatever="@mdo">쪽지보내기</button>
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
		                                            <input type="text" class="form-control" id="recipient-name" name="recipient">
		                                        </div>
		                                        <div class="form-group">
		                                            <label for="message-text" class="col-form-label">보낼메세지:</label>
		                                            <textarea rows="8" cols="80" class="form-control" id="message-text" style="resize:none;" name="contents"></textarea>
		                                        </div>
		                                        <div><span id="counter">0/300</span></div>
		                                        <input type="hidden" value="${sessionScope.id }" name="sender">
		                                    </form>
		                                </div>
		                                <div class="modal-footer">
		                                    <button id="msg_close_btn" type="button" class="btn bg4_ft2" data-dismiss="modal">닫기</button>
		                                    <button id="msg_send_btn" type="button" class="btn bg2_ft4">쪽지 보내기</button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
						
						
						
						
						
						
						
						</div>
						
					</div>
					
				</div>
				
			</div>
			</div>

	</section>

		

                <!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
                <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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
                $('#msg_modal').on('hidden.bs.modal', function (e) {//modal 취소클릭해서 없어진후에 실행
                    $("#msg_send_form")[0].reset();
                });
                $("#msg_send_btn").on("click",function(){
                    var recipient = $("#recipient-name").val();
                    var content = $('#message-text').val();
                    //alert(recipient + " : " + content);
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
                $("#r_allCheck").on("change",function(){
                    var all = $(this);
                    var check = $(".received_check");
                    allChecked(all,check);
                });
                $(document).on("change",".received_check",function(){
                    var all = $("#r_allCheck");
                    var check = $(".received_check");
                    partChecked(all,check);
                });
                //보낸쪽지함에서 Checkbox 전체버튼, 개별버튼 작동하게하기.
                $("#s_allCheck").on("change",function(){
                    var all = $(this);
                    var check = $(".sent_check");
                    allChecked(all,check);
                });
                $(document).on("change",".sent_check",function(){
                    var all = $("#s_allCheck");
                    var check = $(".sent_check");
                    partChecked(all,check);
                });
                $(document).on("click" ,".received_msg_click", function(){
                    $("#r_sender_modal").html("");
                    $("#r_contents_modal").html("");
                    var contents = $(this).text();
                    var sender = $(this).attr("value");
                    $("#r_sender_modal").append("보낸사람 : "+sender+"<hr>");
                    $("#r_sender_modal").prop("sender",sender);
                    $("#r_contents_modal").append(contents);
                    var readOk = $(this).parent(".r_click_parent").siblings(".r_readOk").text();
                    var readOkModi = $(this).parent(".r_click_parent").siblings(".r_readOk");
                    var clickThis = $(this);
                    if(readOk=="N"){
                        $.ajax({
                            url : "updateReadOk"
                            ,type:"post"
                            ,data : {
                                seq : $(this).attr("seq")
                            }
                        }).done(function(resp){
                            if(resp=="2"){
                                $(readOkModi).text("Y");//msg읽음으로 바꿈
                                $(clickThis).addClass("readMsg");
                            }
                        }).fail(function(a,b,c){
                            console.log("에러 발생");
                        });
                    }
                });
                $(document).on("click" ,".sent_msg_click", function(){
                    $("#s_recipient_modal").html("");
                    $("#s_contents_modal").html("");
                    var contents = $(this).text();
                    var recipient = $(this).attr("value");
                    $("#s_recipient_modal").append("받는사람 : "+recipient+"<hr>");
                    $("#s_contents_modal").append(contents);
                });
                $("#selectMsg_delete").on("click",function(){//선택한 메세지 삭제하기.
                    //선택한 메세지가 없을때,
                    var count = 0;
                    $(".selectedBox.active>form input[type='checkbox']").each(function(i,item){
                        if($(item).prop("checked")){
                            count++;
                        }
                    })
                    if(count==0){
                        alert("삭제할 쪽지를 선택해주세요.");
                        return false;
                    }
                    $(".selectedBox.active>form").submit();
                });
                //쪽지함 navi 클릭했을때,
                $(document).on("click",".navi_click_a",function(){
                    var category = $(this).attr("value");
                    var currentPage = $(this).text();
                    if(currentPage=="<이전"){
                        var prev =  $(this).next().text();
                        currentPage = parseInt(prev) - 1 ;
                    }else if(currentPage=="다음>"){
                        var next  = $(this).prev().text();
                        currentPage = parseInt(next) + 1 ;
                    }
                    //리스트랑 navi 가져오기.
                    $.ajax({
                        url: "ClickMsgNavi",
                        type: "post",
                        data : {
                            category : category,
                            currentPage : currentPage
                        }
                    }).done(function(resp){
                        if(category=="recipient"){
                            $(".receivedList_part").remove();
                            $(".receivedList_prev_part").after(resp);
                        }else{
                            $(".sentList_part").remove();
                            $(".sentList_prev_part").after(resp);
                        }
                    }).fail(function(a,b,c){
                        location.href="error";
                    });
                });
                //---/쪽지함 navi
                //답장하기 버튼 눌렀을때,
                $("#reply_msg_btn").on("click",function(){
                    var recipient_name = $("#r_sender_modal").prop("sender");
                    $('#received_msg_close_btn').trigger("click");
                    $("#recipient-name").val(recipient_name);
                    $("#sendMsg_btn").trigger("click");
                });
            </script>
        </html>