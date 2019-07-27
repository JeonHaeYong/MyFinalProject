<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>무료나눔 - ${item.name }</title>
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
            .myJumbo{
                background-color: white;
                padding: 0px;
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
            	color: #754F44;
            	cursor: default;
            }
            .column{
            	display: inline-block;
            	width: 20%;
            }
            .cell{
            	display: inline-block;
            }
			.contents{
				border: 1px solid #00000030;
				padding: 20px;
				font-size: 20px;
			}
			.contents img{
				max-width: 100%;
			}
			.btn{font-family: 'Gamja Flower', cursive; font-size: 22px; background-color:#FDD69270; color:#754F44;}
			.btn:hover{background-color:#FDD692; font-weight:bold;}
		 	.addBtn{
		 		background-color: #ec7357;
		 		color: white;
		 		font-weight: bold !important;
		 		font-size: 18px;
		 	}
		 	.addBtn:hover, #searchBtn:hover{
		 		background-color: #cf654c;
		 		color: white;
		 		font-weight: bold !important;
		 		cursor: pointer;
		 	}
        </style>
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target"
          data-offset="300" id="home-section">
        <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
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
	                		<p><span class="column">Seller</span><span class="cell" id="sendMsg_btn" data-toggle="modal" data-target="#msg_modal" data-whatever="@mdo">${item.seller }</span></p><hr>
	                		<p><span class="column">Date</span><span class="cell">${item.fomredDate }</span></p>
	                	</div>
	                	<div class="col-12 align-self-center text-center">
	                		<a class="btn" id="goCart" href="javascript:void(0)">미리보기중</a>
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
        </div>
        <!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
		<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap&subset=korean" rel="stylesheet">
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