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
                .myJumbo{
                	background-color: white;
                }
                #jumboImg{
					width: 100%;
					max-height: 600px;
                }
                .itemImage{
                	height: 100%;
                }
                .itemName{
                	text-decoration: none;
                	color: grey;
                }
                .itemName:hover{
                	text-decoration: underline;
                	color: #ec7357;
                }
                #delBtn{
                	padding: 5px;
                	margin-bottom: 5px;
                	border-color: grey;
                	font-size: 15px;
                }
                #delBtn:hover{
                	border-color: #ec7357;
                	background-color: #ec7357;
                	color: white;
                }
            </style>

        </head>
        <body data-spy="scroll" data-target=".site-navbar-target"
              data-offset="300" id="home-section">
            <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
            <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
            <div class="jumbotron myJumbo px-0 pb-0">
                <img src="/mypage/dog_4.jpg" id="jumboImg">
            </div>
            <section id="wrapper" class="mb-5">
                <div class="container text-center">
                    <div class="row">
                        <div class="col-4 p-2">
                            <div class="my_page_empty invisible">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" aria-controls="pills-home" aria-selected="true">Home</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="my_page_info">
                                <div>
                                    <img src="/resources/images/dog_1.jpg" class="rounded-circle" style="width: 100px; height: 100px;">
                                </div>
                                <div>
                                    윤혜영님(닉네임)
                                </div>
                                <div>
                                    현재포인트
                                </div>
                                <div>
                                    200pt
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <!-- 마이페이지 상단메뉴 -->
                            <ul class="nav nav_my_page_ul nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-profile-tab" href="toMyPage">내 정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-writeList-tab"  href="toMyPage_writeList">내 글목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-support-tab" href="toMyPage_support">후원목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav active" id="pills-cart-tab" href="toMyPage_cart">장바구니</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-buyList-tab" href="toMyPage_buyList">구매내역</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="pills-message-tab" href="toMyPage_message">쪽지함</a>
                                </li>
                            </ul>
                            <!-- /마이페이지 상단메뉴 -->
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-profile">
                                <!-- 장바구니 -->
                                    <div id="cart_wrapper">
                                        <div class="row border-bottom border-success">
                                            <div class="col-12"> </div>
                                        </div>
                                        <div class="row cart_contents">
                                        	<div class="col-12 d-flex justify-content-left custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="allCheck">
												<label class="custom-control-label" for="allCheck">전체선택</label>
											</div>
											<c:if test="${list.size() == 0 }">
												<div class="col-12 d-flex justify-content-center">
                                        			<h4>장바구니가 비어있습니다.</h4>
                                        		</div>
											</c:if>
                                        	<c:forEach var="dto" items="${list }" varStatus="status">
	                                            <div class="col-lg-6 col-12 d-flex justify-content-center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input itemCheck" id="customCheck${status.count }" seq="${dto.seq }">
														<label class="custom-control-label" for="customCheck${status.count }"></label>
													</div>
	                                                <div class="card mb-3" style="width: 90%;">
	                                                    <div class="row no-gutters">
	                                                        <div class="col-md-4">
	                                                            <img src="${dto.imagePath1 }" class="card-img itemImage">
	                                                        </div>
	                                                        <div class="col-md-8">
	                                                            <div class="card-body">
	                                                                <h5 class="card-title">상품명 : <a class="itemName" href="item?seq=${dto.seq }">${dto.name }</a></h5>
	                                                                <p class="card-text">금액 : ${dto.price }</p>
	                                                                <p class="card-text"><small class="text-muted">판매자 : ${dto.seller }</small></p>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </div>
                                            </c:forEach>
                                            <div class="col-12 d-flex justify-content-left">
                                            	<button class="btn rounded" id="delBtn">선택 상품 삭제하기</button>
                                            </div>
                                        </div>
                                        <div class="row">
	                                        <div class="col-12">
	                                        	<button class="btn btn-outline-warning rounded" id="payBtn">선택 상품 결제하기</button>
	                                        	<button class="btn btn-outline-warning rounded" id="allPayBtn">전체 상품 결제하기</button>
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
      		var count = 0;
        	$("#allCheck").on("change", function(){
        		if($("#allCheck").prop("checked")){
        			$(".itemCheck").prop("checked", true);
        			count = $(".itemCheck").length;
        		}else{
        			$(".itemCheck").prop("checked", false);
        			count = 0;
        		}
        	});
        	$(".itemCheck").on("change", function(){
        		var allChecked = true;
        		$(".itemCheck").each(function(i, item){
        			if(!($(item).prop("checked"))){
        				allChecked = false;
        			}else{
        				count++;
        			}
        		});
        		if(allChecked){
        			$("#allCheck").prop("checked", true);
        		}
        		if(!$(this).prop("checked")){
        			$("#allCheck").prop("checked", false);
        		}
        	});
        	
        	$("#delBtn").on("click", function(){
        		console.log(count);
        		if($(".itemCheck").length == 0 || count == 0){
        			alert("삭제할 상품이 없습니다. 다시 선택해주세요.");
        		}else{
        			$(".itemCheck").each(function(i, item){
            			if($(item).prop("checked")){
            				$.ajax({
                    			url: "deleteCart",
                    			data: {
                    				item_seq: $(item).attr("seq")
                    			}
                    		});
            			}
            		});
            		window.location.reload();
        		}
        	});
        	
        </script>
    </html>