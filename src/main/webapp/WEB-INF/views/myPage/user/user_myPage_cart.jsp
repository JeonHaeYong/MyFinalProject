<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>마이페이지 - 장바구니</title>
            <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
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
            <jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
            <style>
                .itemImage{
                	width: 100%;
                	height: 100%;
                }
                .cardText{
                	font-size: 20px;
                	color: #754F44;
                }
                .cardTextSmall{
                	font-size: 15px;
                	color: #754F44;
                }
                .itemName{
                	text-decoration: none;
                }
                .itemName:hover{
                	text-decoration: underline;
                	color: #ec7357;
                }
                label:before{
					border-color: #adb5bd !important;
				}
				.custom-control-input:checked + label:before{
					background-color: #ec7357 !important;
					border-color: #ec7357 !important;
				}
                .btn{font-family: 'Gamja Flower', cursive; background-color:#FDD69270; color:#754F44;}
				.btn:hover{background-color:#FDD692; font-weight:bold;}
				.btn:hover span{font-weight:bold;}
				.delete{
					color: #ec7357;
					font-size: 17px;
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
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-profile">
                                <!-- 장바구니 -->
                                    <div id="cart_wrapper">
                                        <div class="row border-bottom border-success">
                                            <c:if test="${list.size() != 0 }">
	                                        	<div class="col-12 d-flex justify-content-left custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input" id="allCheck">
													<label class="custom-control-label" for="allCheck">전체선택</label>
												</div>
											</c:if>
											<c:if test="${list.size() == 0 }">
												<div class="col-12 mt-3" style="height: 300px;">
                                        			<div><h4 style="line-height: 150px; text-align: center;">장바구니가 비어있습니다.</h4></div>
                                        			<div style="text-align: center;"><a class="btn" href="freeMarket">무료나눔 가기</a></div>
                                        		</div>
											</c:if>
                                        </div>
                                        <div class="row cart_contents mt-3">
											<form class="row" action="toPayment" id="itemCheckForm" method="post">
	                                        	<c:forEach var="dto" items="${list }" varStatus="status">
		                                            <div class="col-lg-6 col-12 d-flex justify-content-center">
														<div class="custom-control custom-checkbox">
															<input type="hidden" class="soldoutCheck" value="${dto.soldout }" seq="${dto.cart_seq }">
															<input type="checkbox" class="custom-control-input itemCheck" id="customCheck${status.count }" name="items" value="${dto.cart_seq }">
															<label class="custom-control-label" for="customCheck${status.count }"></label>
														</div>
		                                                <div class="card mb-3">
		                                                    <div class="row no-gutters">
		                                                        <div class="col-md-5">
		                                                            <img src="${dto.imagePath1 }" class="card-img itemImage" soldout="${dto.soldout }">
		                                                        </div>
		                                                        <div class="col-md-7">
		                                                            <div class="card-body myCardBody text-truncate">
		                                                                <p class="card-title cardText">상품명 : <a class="itemName cardText" href="item?seq=${dto.seq }">${dto.name }</a></p>
		                                                                <p class="card-text cardText">금액 : ${dto.price }</p>
		                                                                <p class="card-text cardTextSmall">판매자 : ${dto.seller }</p>
		                                                            </div>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
	                                            </c:forEach>
                                            </form>
                                            <div class="col-12 d-flex justify-content-center">
	                                        	<a class="btn" href="freeMarket">무료나눔 가기</a>
	                                        </div>
                                            <div class="col-lg-6 col-12 d-lg-flex justify-content-left d-flex justify-content-center">
                                            	<button type="button" class="btn" id="delBtn">선택 상품 <span class="delete">삭제</span>하기</button>&nbsp;
                                            	<button type="button" class="btn" id="soldoutDelBtn">판매완료 상품 <span class="delete">삭제</span>하기</button>
                                            </div>
                                            <div class="col-lg-6 col-12 d-lg-flex justify-content-end d-flex justify-content-center">
	                                        	<input type="button" class="btn" id="payBtn" value="선택 상품 결제하기">&nbsp;
	                                        	<input type="button" class="btn" id="allPayBtn" value="전체 상품 결제하기">
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
        	$(".itemImage").each(function(i, item){
        		if($(item).attr("soldout") == 'y'){
        			$(this).css("filter", "brightness(60%)");
        			
        		}
        	});
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
        				if($(this).prev().val() == 'y'){
        					alert("판매완료된 상품입니다.");
        					$(this).prop("checked", false);
        				}
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
        		if($(".itemCheck").length == 0 || count == 0){
        			alert("삭제할 상품이 없습니다. 다시 선택해주세요.");
        		}else{
        			var checkedItem = new Array();
        			var index = 0;
        			$(".itemCheck").each(function(i, item){
            			if($(item).prop("checked")){
            				checkedItem[index] = $(this).val();
            				index++;
            			}
            		});
        			jQuery.ajaxSettings.traditional = true; 
        			$.ajax({
            			url: "deleteCart",
            			type: "post",
            			data: {
            				"seqs": checkedItem
            			}
            		}).done(function(resp){
            			window.location.reload();
            		});
        		}
        	});
        	
        	$("#soldoutDelBtn").on("click", function(){
        		var soldoutItem = new Array();
    			var index = 0;
    			$(".soldoutCheck").each(function(i, item){
        			if($(item).val() == 'y'){
        				soldoutItem[index] = $(this).attr("seq");
        				index++;
        			}
        		});
    			jQuery.ajaxSettings.traditional = true; 
    			$.ajax({
        			url: "deleteCart",
        			type: "post",
        			data: {
        				"seqs": soldoutItem
        			}
        		}).done(function(resp){
        			window.location.reload();
        		});
        	});
        	
        	$("#allPayBtn").on("click", function(){
        		if(!$("#allCheck").prop("checked")){
        			$("#allCheck").click();
        		}
        		if($(".itemCheck").length == 0 || count == 0){
        			alert("장바구니에 상품이 없습니다.");
        			return;
        		}
        		$("#itemCheckForm").submit();
        	});
        	
        	$("#payBtn").on("click", function(){
        		if($(".itemCheck").length == 0 || count == 0){
        			alert("선택하신 상품이 없습니다. 다시 선택해주세요.");
        			return;
        		}
        		$("#itemCheckForm").submit();
        	});
        	
        </script>
    </html>