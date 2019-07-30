<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>관리자 페이지 - 비밀변호변경</title>
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
							<a href="admin-msg" class="btn menu_btns">관리자쪽지함</a>
						</div>
						
						<div class="col-12 text-center px-1">
							<a href="admin-pwChange" class="btn selected_menu_btns">비밀번호변경</a>
						</div>
			
					</div>
				
				</div>
				
				
				
				
				<div class="col-1"></div>
				
				
				
				<div class="col-9">
				
					<div id="contents_row" class="row justify-content-center mt-5">
						<div class="col-12">
						<form id="modify_profile_form" action="modifyPwByMyPage" method="post">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="pw">현재 비밀번호</span>
                                                    </div>
                                                    <input id="currPw" type="password" class="form-control" placeholder="Password" aria-label="password" aria-describedby="pw">
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="pw1">변경할 비밀번호</span>
                                                    </div>
                                                    <input type="password" id="changePw1" class="form-control" placeholder="알파벳,숫자조합으로 8~15글자" aria-label="password" aria-describedby="pw1" name="pw">
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="pw2">변경할 비밀번호 확인</span>
                                                    </div>
                                                    <input type="password" id="changePw2" class="form-control" placeholder="변경할 비밀번호 다시 입력" aria-label="password" aria-describedby="pw2">
                                                </div>
												<div>
													<button id="change_pw_btn" type="button" class="btn laon_btn_style">비밀번호 변경</button>
												</div>
												</form>
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
            $("#change_pw_btn").on("click",function(){
                var currPw = $("#currPw").val();
                var pw1 = $("#changePw1").val();
                var pw2 = $("#changePw2").val();
                if(currPw==""){
                    alert("현재비밀번호를 입력해주세요.");
                    $("#currPw").focus();
                    return false;
                }
                if(pw1!=pw2){//pw1 , pw2가 같은 값인지
                    alert("변경할 비밀번호가 다릅니다.");
                    $("#changePw2").focus();
                    return false;
                }
                //pw regex확인
                var pwRegex = /^[a-zA-Z0-9]{8,15}$/g;
                var regexResult = pwRegex.exec(pw1);
                var pwRegex2 = /^[a-zA-Z]{8,15}$/g;
                var regexResult2 = pwRegex2.exec(pw1);
                var pwRegex3 = /^[0-9]{8,15}$/g;
                var regexResult3 = pwRegex3.exec(pw1);
                if(regexResult==null||regexResult2!=null||regexResult3!=null){	
                    alert("변경할 비밀번호의 조건을 확인해주세요.\r\n조건->알파벳과 숫자의 조합으로 8~15이하");
                    $("#changePw1").focus();
                    return false;
                }
                //현재비밀번호가 맞는지->ajax로 확인
                $.ajax({
                    url : "currPwCheck",
                    type : "post",
                    data : {
                        id : "${sessionScope.id}",
                        pw : currPw
                    }
                }).done(function(resp){
                    if(resp=="false"){
                        alert("현재비밀번호가 틀립니다.\r\n현재" + (++PwInputCount) + "회/5회 입력 틀렸습니다."  );
                        if(PwInputCount==5){
                            alert("현재비밀번호를 5번 틀리셨습니다.로그아웃됩니다.");
                            $("#modify_profile_form").attr("action","logout");
                            $("#modify_profile_form").submit();
                        }
                    }else{
                        alert("비밀번호를 변경합니다.");
                        $("#modify_profile_form").submit();
                    }
                });
            });
            </script>
        </html>