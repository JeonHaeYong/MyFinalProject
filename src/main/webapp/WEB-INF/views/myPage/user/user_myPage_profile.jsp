<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>마이페이지</title>
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
            </style>
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
                <!-- 내정보 -->
                <div class="tab-pane fade show active" id="pills-profile">
                    <form>
                        <div class="form-group row">
                            <label for="my_id" class="col-sm-2 col-form-label">ID</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_id" value="${memberDTO.id }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <button type="button" id="my_password" class="btn btn-outline-warning rounded" data-toggle="modal" data-target="#password_change_modal">비밀번호 변경하기</button>
                                <!-- Modal -->
								<div class="modal fade" id="password_change_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1">현재 비밀번호</span>
											</div>
											<input type="text" class="form-control" placeholder="Username" aria-label="password" aria-describedby="basic-addon1">
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1">변경할 비밀번호</span>
											</div>
											<input type="text" class="form-control" placeholder="Username" aria-label="password" aria-describedby="basic-addon1">
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1">변경할 비밀번호 확인</span>
											</div>
											<input type="text" class="form-control" placeholder="Username" aria-label="password" aria-describedby="basic-addon1">
										</div>
									</div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								        <button type="button" class="btn btn-primary">비밀번호 변경</button>
								      </div>
								    </div>
								  </div>
								</div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_nickname" class="col-sm-2 col-form-label">Nickname</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_nickname" value="${memberDTO.name }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_email" value="${memberDTO.email }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_birth" class="col-sm-2 col-form-label">Birthday</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_birth" value="${memberDTO.birthDay }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_gender" class="col-sm-2 col-form-label">Gender</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_gender" value="${memberDTO.gender }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_phone" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_phone" value="${memberDTO.phone }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_zipcode" class="col-sm-2 col-form-label">Zipcode</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_zipcode" value="${memberDTO.zipcode }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="my_address" value="${memberDTO.address1 }">
                            </div>
                        </div>
                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-outline-warning rounded">수정하기</button>
                        </div>
                    </form>
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
    </html>