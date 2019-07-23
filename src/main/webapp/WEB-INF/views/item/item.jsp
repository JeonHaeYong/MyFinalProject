<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>무료나눔 - ${item.name }</title>
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
            .myJumbo{
                background-color: white;
            }
            #jumboImg{
                width: 100%;
                max-height: 600px;
            }
            body, h1{
				font-family: 'Gamja Flower';
			}
            .itemImage{
                width: 100%;
                height: 500px;
            }
            .itemInfoRow{
            	position: relative;
            	height: 100%;
            }
            .itemInfo{
            	position: relative;
            	bottom: 0px;
            	font-size: 25px;
            }
            .itemInfo p{
            	width: 100%;
            }
            .column{
            	display: inline-block;
            	width: 20%;
            }
            .cell{
            	display: inline-block;
            	width: 80%;
            }
            #soldout{
            	color: white;
            	background-color: #bf5e47;
            }
            #soldout:hover{
            	
            }
            .cartBtn{
				background-color: #ec7357;
				color: white;
				border-radius: 10px;
				width: 100px;
				padding: 10px;
				font-size: 20px;
			}
			.cartBtn:hover{
				background-color: #00000030;
			}
			.myBtn{
				background-color: #00000030;
				border-radius: 10px;
				width: 30px;
				padding: 10px;
			}
			.myBtn:hover{
				background-color: #ec7357;
				color: white;
			}
			.contents{
				border: 1px solid #00000030;
				padding: 20px;
				font-size: 20px;
			}
			.contents img{
				max-width: 100%;
			}
			.fixedMenu{
		 		position: absolute; 
				width: 180px;
				height: 200px;
		 		top: 790px;
				right: 0px;
				border: none;
				text-align: center;
				background-color: #754F4430;
				font-family: 'Gamja Flower';
				font-weight: bold !important;
				z-index: 100;
			}
			#cartImg{
				width: 50%;
			}
		 	.fixedMenu div{
		 		margin: 10px;
		 	}
		 	.addBtn{
		 		background-color: #ec7357;
		 		color: white;
		 		font-weight: bold !important;
		 	}
		 	.addBtn:hover, #searchBtn:hover{
		 		background-color: #cf654c;
		 		color: white;
		 		font-weight: bold !important;
		 		cursor: pointer;
		 	}
		 	.cartAddBtn{
		 		background-color: #ec7357;
		 		color: white;
		 		width: 30px;
		 		height:25px;
		 		padding: 0px;
		 	}
		 	#searchForm{
		 		width: 106px;
		 		margin-left: 10px;
		 	}
		 	#select{
		 		font-size: 18px;
		 	}
		 	.op{
		 		font-size: 20px;
		 	}
			#searchBtn{
				background-color: #ec7357;
				border-radius: 5px 10px 10px 5px;
				width: 38px;
			}
			.cartBadge{
				position: absolute;
				right: 53px;
				width: 20px;
				height: 20px;
				cursor: pointer;
			}
        </style>
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target"
          data-offset="300" id="home-section">
        <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
        <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

        <div class="jumbotron myJumbo pr-0 pl-0 pb-2">
            <img src="/resources/images/item/itemImage.jpg" id="jumboImg">
        </div>
        <div class="container">
            <div class="row m-3">
                <div class="col-md-6 col-12">
                    <div id="demo" class="carousel slide" data-ride="carousel">
                        <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                            <c:if test="${item.imagePath2 != null}">
								<li data-target="#demo" data-slide-to="1"></li>
                            </c:if>
                            <c:if test="${item.imagePath3 != null}">
								<li data-target="#demo" data-slide-to="2"></li>
                            </c:if>
                        </ul>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="${item.imagePath1 }" class="itemImage"> 
                            </div>
                            <c:if test="${item.imagePath2 != null}">
                            	<div class="carousel-item">
									<img src="${item.imagePath2 }" class="itemImage">  
								</div>
                            </c:if>
                            <c:if test="${item.imagePath3 != null}">
                            	<div class="carousel-item">
									<img src="${item.imagePath3 }" class="itemImage">  
								</div>
                            </c:if>
                        </div>
                        <c:if test="${item.imagePath2!=null || item.imagePath3!=null}">
	                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
	                            <span class="carousel-control-prev-icon"></span>
	                        </a>
	                        <a class="carousel-control-next" href="#demo" data-slide="next">
	                            <span class="carousel-control-next-icon"></span>
	                        </a>
                        </c:if>
                    </div>
                </div>
                <div class="col-md-6 col-12">
                	<div class="row itemInfoRow">
                		<div class="col-12 align-self-center text-center">
							<h1>${item.name }</h1>
						</div>
	                	<div class="col-12 itemInfo">
	                		<p><span class="column">Price</span><span class="cell">${item.price }</span></p><hr>
	                		<p><span class="column">Seller</span><span class="cell">${item.seller }</span></p><hr>
	                		<p><span class="column">Date</span><span class="cell">${item.fomredDate }</span></p>
	                	</div>
	                	<div class="col-12 align-self-center text-center">
	                		<c:choose>
	                			<c:when test="${item.soldout == 'y' }">
	                				<a class="btn cartBtn" id="soldout" disabled>판매완료 상품</a>
	                			</c:when>
	                			<c:otherwise>
	                				<a class="btn cartBtn" id="addCart" href="">장바구니 담기</a>
	                			</c:otherwise>
	                		</c:choose>
	                		<a class="btn cartBtn" id="goCart" href="">장바구니 가기</a>
	                	</div>
                	</div>
                </div>
            </div>
            <div class="row m-3">
            	<div class="col-12">
            		<div class="contents">
            			${item.contents }
            		</div>
            	</div>
            </div>
            <div class="row m-3">
            	<div class="col-12 d-flex justify-content-end">
            		<a class="btn cartBtn" href="freeMarket?currentPage=${currentPage }&category=${category}">목록으로</a> 
            	</div>
            </div>
        </div>
        
        <div class="fixedMenu">
	    	<div class="btnBox">
				<a class="btn addBtn" href="addItem">나눔신청</a>
	    	</div>
	    	<div class="input-group selectBox">
	    		<form action="freeMarket" id="searchForm">
	    			<input type="hidden" name="currentPage" value="1">
					<select class="custom-select" id="select" name="category">
						<option class="op" selected value="all">전체</option>
						<option class="op" value="food">사료&amp;간식</option>
						<option class="op" value="toy">장난감</option>
						<option class="op" value="clothing">의류</option>
						<option class="op" value="etc">기타</option>
					</select>
				</form>
				<div class="input-group-append m-0">
					<a id="searchBtn"><img alt="검색" src="/resources/images/item/searchIcon.png"></a>
				</div>
	    	</div>
	    	<div class="toCart">
	    		<span class="badge badge-danger cartBadge"><c:if test="${cartCount != 0 }">${cartCount }</c:if></span>
	    		<a href="toMyPage_cart"><img alt="" src="/resources/images/item/cart.png" id="cartImg"></a>
	    	</div>
	    </div>

        <!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->

        <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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
            $(function(){
                $(".nav-link").each(function(i, item){
                    if($(item).attr("href").match("^freeMarket")){
                        $(this).attr("class", "active");
                    }
                });
                if(${sessionScope.id == item.seller}){
                	$("#addCart").css("pointer-events", "none");
                	$("#addCart").css("background-color", "#ec735750");
                }
            });
           
            $("#addCart").on("click", function(){
            	if(${sessionScope.id == null}){
            		alert("로그인 후 이용하실 수 있습니다.");
            		return false;
            	}else{
            		$.ajax({
                		url: "addCart",
                		data:{
                			item_seq: ${item.seq}
                		}
                	}).done(function(resp){
                		if(resp == "1"){
                			if(confirm("장바구니에 담았습니다. 장바구니로 이동할까요?")){
                				location.href = "toMyPage_cart";
                			}else{
                				$.ajax({
                					url: "getCartCount"
                				}).done(function(resp){
                					$(".cartBadge").text(resp);
                				});
                			}
                		}else if(resp == "-1"){
                			alert("장바구니에 이미 존재하는 상품입니다.");
                		}else if(resp == "-2"){
                			alert("장바구니가 가득 찼습니다! 장바구니에는 최대 10개의 상품을 담으실 수 있습니다.");
                		}
                	});
                	return false;
            	}
			});
            
            function goCart(e){
            	e.preventDefault();
            	if(${sessionScope.id == null}){
            		alert("로그인 후 이용하실 수 있습니다.");
            		return false;
            	}else{
            		location.href = "toMyPage_cart";
            	}
            }
            
            $(".cartBadge").on("click", function(e){
            	goCart(e);
            })
            
            $("#goCart").on("click", function(e){
            	goCart(e);
            });
            
            var menu = $(".fixedMenu");
			var menuOffset = $(".fixedMenu").offset();
			$(window).scroll(function(){
				if($(this).scrollTop() >= 400){
					menu.css("position", "fixed").css("top", "325px");
				}else{
					menu.css("position", "absolute").css("top", "720px");
				}
			});
			
			$("#searchBtn").on("click", function(){
				$("#searchForm").submit();
			});
            
        </script>
</html>