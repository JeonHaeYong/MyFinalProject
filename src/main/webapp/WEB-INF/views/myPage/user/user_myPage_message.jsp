<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>마이페이지-쪽지함</title>
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
                .jumbotron{
                	background-color: white;
                }
                .jumbotron>img{
                    width: 100%;
                    max-height: 600px;
                }
                    /*부트스트랩 모달시 패딩 없애주기.*/
                    .modal-open {padding-right: 0px !important;}
                    .readMsg{
                    	color : gray;
                    }
                    /*쪽지함 마다 다르게 스타일주기*/
                    .sent_msg_click{
                    	color : royalblue;
                    }
                    .s_list_row:hover,.r_list_row:hover{
                    	background-color: rgba(128, 128, 128, 0.06);
                    }
                    
                </style>
                <jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
            </head>
            <body data-spy="scroll" data-target=".site-navbar-target"
                  data-offset="300" id="home-section">
                <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
                <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
                <jsp:include page="/WEB-INF/views/myPage/user/user_module/top_menu_info.jsp"></jsp:include>
                <!-- /마이페이지 상단메뉴 -->
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-profile">
                        <!-- 쪽지함 -->
                        <div id="message_wrapper">
                            <div class="row">
                                <div class="col-12">
                                    <nav>
                                        <div class="nav nav-tabs d-flex justify-content-center" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active" id="nav-inbox-tab" data-toggle="tab" href="#nav-inbox" role="tab" aria-controls="nav-inbox" aria-selected="true">받은 쪽지함</a>
                                            <a class="nav-item nav-link" id="nav-sentbox-tab" data-toggle="tab" href="#nav-sentbox" role="tab" aria-controls="nav-sentbox" aria-selected="false">보낸 쪽지함</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <!-- 받은쪽지함 -->
                                        <div class="tab-pane fade show active selectedBox" id="nav-inbox" role="tabpanel" aria-labelledby="nav-inbox-tab">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="r_allCheck">
                                                        <label class="custom-control-label" for="r_allCheck"></label>
                                                    </div> 
                                                </div>
                                                <div class="col-2">보낸사람</div>
                                                <div class="col-5">내용</div>
                                                <div class="col-3">받은날짜</div>
                                                <div class="col-1">read</div>
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
                                            <form id="receivedMsg_delete_form" action="deleteMsg" method="post">
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
                                                    		<a class="received_msg_click text-decoration-none" href="#" seq="${r_list.seq }" data-toggle="modal" data-target="#r_msg_modal" value="${r_list.sender }">${r_list.contents }</a>
                                                    	</c:if>
                                                    	<c:if test="${r_list.readOk =='Y'}">
                                                    		<a class="received_msg_click text-decoration-none readMsg" href="#" seq="${r_list.seq }" data-toggle="modal" data-target="#r_msg_modal" value="${r_list.sender }">${r_list.contents }</a>
                                                    	</c:if>
                                                    </div>
                                                    <div class="col-3">${r_list.message_date }</div>
                                                    <div class="col-1 r_readOk">${r_list.readOk }</div>
                                                </div>
                                            </c:forEach>
                                            </form>
                                            <!-- 받은쪽지클릭하면 내용띄워주기 -->
                                            <div class="modal fade p-0" id="r_msg_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                        	<div id="r_sender_modal">보낸사람 : </div>
                                                            <div>
                                                            	<textarea class="border-0" id="r_contents_modal" rows="8" cols="50" style="resize:none;" readonly></textarea>
                                                            </div>
                                                        	</div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Save changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 받은쪽지 네비게이터 띄워주기 -->
                                            <div class="row">
                                            	<div class="col-12">
                                            		<ul class="pagination justify-content-center">
                                            		<c:forEach var="navi" items="${receivedNavi }">
														<li class="page-item">
															<form>
																<a class="page-link text-decoration-none" href="#">${navi }</a>
															</form>
														</li>
                                            		</c:forEach>
                                            		</ul>
                                            	</div>
                                            </div><!-- /받은쪽지 네비게이터-->
                                        </div>
                                        <!-- 보낸쪽지함 -->
                                        <div class="tab-pane fade selectedBox" id="nav-sentbox" role="tabpanel" aria-labelledby="nav-sentbox-tab">
                                            <div class="row ">
                                                <div class="col-1">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="s_allCheck">
                                                        <label class="custom-control-label" for="s_allCheck"></label>
                                                    </div> 
                                                </div>
                                                <div class="col-2">받은사람</div>
                                                <div class="col-5">내용</div>
                                                <div class="col-3">보낸날짜</div>
                                                <div class="col-1">Read</div>
                                            </div>
                                            <form id="sentMsg_delete_form" action="deleteMsg" method="post">
                                            <c:forEach var="s_list" items="${sentList }" varStatus="status">
                                                <div class="row s_list_row">
                                                    <div class="col-1">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input sent_check" id="s_${status.count }" name="msgSeq" value="${s_list.seq }">
                                                            <label class="custom-control-label" for="s_${status.count }"></label>
                                                        </div> 
                                                    </div>
                                                    <div class="col-2 text-truncate">${s_list.recipient }</div>
                                                    <div class="col-5 s_click_parent text-truncate">
                                                    	<a class="sent_msg_click text-decoration-none" href="#" seq="${s_list.seq }" data-toggle="modal" data-target="#s_msg_modal" value="${s_list.recipient }">${s_list.contents }</a>
                                                    </div>
                                                    <div class="col-3">${s_list.message_date }</div>
                                                    <div class="col-1 s_readOk">${s_list.readOk }</div>
                                                </div>
                                            </c:forEach>
                                           	</form>
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
                                                        	<div id="s_recipient_modal">받은사람:</div>
                                                            <div>
                                                            	<textarea class="border-0" id="s_contents_modal" rows="8" cols="50" style="resize:none;" readonly></textarea>
                                                            </div>
                                                        	</div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /보낸쪽지클릭하면 내용띄워주기 -->
                                            <!-- 보낸쪽지 네비게이터 띄워주기 -->
                                            <div class="row">
                                            	<div class="col-12">
                                            		<ul class="pagination justify-content-center">
                                            		<c:forEach var="navi" items="${sentNavi }">
														<li class="page-item">
															<form>
																<a class="page-link text-decoration-none" href="#">${navi }</a>
															</form>
														</li>
                                            		</c:forEach>
                                            		</ul>
                                            	</div>
                                            </div>
                                            <!-- /보낸쪽지 네비게이터-->
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
                    	<button type="button" class="btn btn-outline-warning rounded" id="selectMsg_delete">선택 삭제하기</button>
                        <button type="button" class="btn btn-outline-warning rounded" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">쪽지보내기</button>
                    </div>
                    <div class="modal fade text-left" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                        <input type="hidden" value="${memberDTO.id }" name="sender">
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button id="msg_close_btn" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="msg_send_btn" type="button" class="btn btn-primary">Send message</button>
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
                $("#msg_close_btn").on("click",function(){
                    $("#msg_send_form")[0].reset();
                })
                $("#msg_send_btn").on("click",function(){
                    var recipient = $("#recipient-name").val();
                    var content = $('#message-text').val();
                    //alert(recipient + " : " + content);
                    if("${memberDTO.id}"==recipient){
                    	alert("쪽지는 본인에게 쓸수없습니다.");
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
                $(".received_check").on("change",function(){
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
                $(".sent_check").on("change",function(){
					var all = $("#s_allCheck");
					var check = $(".sent_check");
					partChecked(all,check);
                });
                
                $(".received_msg_click").on("click" , function(){
                	$("#r_sender_modal").html("");
                	$("#r_contents_modal").html("");
                	var contents = $(this).text();
                	var sender = $(this).attr("value");
                	$("#r_sender_modal").append("보낸사람 : "+sender+"<hr>");
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
                    			var yetMsg = $("#yet_noRead_msg").text();//msg안읽은 갯수 가져오기.
                    			$("#yet_noRead_msg").text(yetMsg-1);//msg안읽은 갯수 바꾸기.
                    			$(clickThis).addClass("readMsg");
                    		}
                    	}).fail(function(a,b,c){
                			alert("error");
                		});
                	}
                });
                $(".sent_msg_click").on("click" , function(){
                	$("#s_recipient_modal").html("");
                	$("#s_contents_modal").html("");
                	var contents = $(this).text();
                	var recipient = $(this).attr("value");
                	$("#s_recipient_modal").append("받은사람 : "+recipient+"<hr>");
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
            </script>
        </html>