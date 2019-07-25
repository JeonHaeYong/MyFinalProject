<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무료나눔</title>
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
		padding: 5rem;
	}
	#jumboImg{
		width: 100%;
		max-height: 600px;
	}
	.explainHeader{
		background-color: #EC7357;
		color: white;
	}
	.freeMarketInfo{
		font-family: 'SeoulNamsanM';
	}
	.blockquote-footer{
		font-family: 'Gamja Flower';
	}
	h3, h4{
		font-family: 'Gamja Flower';
	}
	.container-contents{
		font-family: 'Gamja Flower';
	}
	.checkboxDiv{
		text-align: right;
	}
	#wsLabel::before{
		border-color: #adb5bd;
	}
	#withoutSoldout:checked + #wsLabel::before{
		background-color: #ec7357;
		border-color: #ec7357;
	}
	.menu-box{width: 150px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px; margin-top: 50px;}
    .menu-box>div{height: 35px;}
    .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px;}
    .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
    .menu-row{text-align: -webkit-center;}
    a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
    a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
	.myCard{
		width: 90%;
		margin: auto;
	}
	.cardImg{
 		height: 265px;
	}
	.itemName{
		height: 58px;
	}
	.detail{
		text-decoration: none;
		color: #754F44;
	}
	.detail:hover{
		font-weight: bold;
		background-color: #FBFFB950;
	}
	.price{
		text-align: right;
		font-size: 25px;
	}
	
    .navi{
    	color: #754F44;
		text-decoration: none;
		margin: 0px 5px;
		font-size: 25px;
	}
	.navi:hover{
		font-weight: bold;
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
		<img src="/resources/images/item/freemarketImage.jpg" id="jumboImg">
	</div>
	<div class="container container-contents" id="conta">
		<div class="row m-3">
			<div class="col-2 d-md-block d-none"></div>
			<div class="col-lg-10 col-12 align-self-center text-center">
				<div class="card">
					<div class="card-header explainHeader">
						<h3 class="m-0">무료나눔과 기부를 함께</h3>
					</div>
					<div class="card-body">
						<blockquote class="blockquote mb-0 freeMarketInfo">
							<p>무료나눔 상품을 구매하신 분은 저렴한 가격에 원하는 물건을 살 수 있고,<br> 나눔을 하신 분은 본인의 이름으로 후원단체에 기부를 하실 수 있어요!<br>
							<small>무료나눔을 신청하면 관리자의 승인을 받은 후 무료나눔이 가능해요.</small></p>
							<footer class="blockquote-footer">나눔 신청하러 가기 <a class="btn addBtn cartAddBtn" href="addItem">Go</a></footer>
						</blockquote>
					</div>
				</div>
				<div class="custom-control custom-switch checkboxDiv mt-3">
					<input type="checkbox" class="custom-control-input" id="withoutSoldout">
					<label class="custom-control-label" for="withoutSoldout" id="wsLabel">판매완료 상품 제외하기</label>
				</div>
			</div>
		</div>
		<div class="row m-3 ajaxRow">
			<div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                <div class="row menu-box">
                    <div class="col-12 s-menu">M E N U</div>
                    <div class="col-12 "><a name="s-menu" href="freeMarket">무료나눔</a></div>
                   	<c:if test="${type == 4}">
                   		<div class="col-12"><a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a></div> <!-- 관리자만 볼 수 있게! -->
                   	</c:if>
                </div>
            </div>
<!--             <div class="col-1"></div> -->
            <div class="col-lg-10 col-md-9 col-12 d-flex justify-content-center mb-4">
				<div class="row cardBox">
					<c:if test="${itemList.size() == 0 }">
						<div class="col-12 m-3"><h3>등록된 상품이 없습니다.</h3></div> 
					</c:if>
					<c:forEach var="dto" items="${itemList }">
						<div class="col-lg-4 col-md-6 col-12 p-0">
							<div class="card myCard mb-3">
								<img class="card-img-top cardImg" src="${dto.imagePath1 }" alt="Card image" soldout="${dto.soldout }">
								<div class="card-body">
									<div class="itemName text-wrap text-truncate">
										<h4 class="card-title"><a href="item?currentPage=${pageNavi.currentPage }&category=${category }&seq=${dto.seq }" class="detail">
											<c:if test="${dto.soldout == 'y' }">[판매완료] </c:if>${dto.name }
										</a></h4>
									</div>
									<p class="card-text price">${dto.price } 원</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row mb-3 ajaxRow">
			<div class="col-2"></div>
			<div class="col-10 d-flex justify-content-center" id="naviBox">
				<c:if test="${pageNavi.needPrev == 1 }">
					<a class="navi" href="#conta" value="${pageNavi.startNavi - 1}">&laquo;</a>
				</c:if>
				<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
					<a class="navi" href="#conta" value="${pageNavi.currentPage - 1}">&lt;</a>
				</c:if>
				<c:forEach var="i" begin="${pageNavi.startNavi}" end="${pageNavi.endNavi}">
					<a class="navi" href="#conta" class="pageNum" value="${i }">${i}</a>
				</c:forEach>
				<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
					<a class="navi" href="#conta" value="${pageNavi.currentPage + 1}">&gt;</a>
				</c:if>
				<c:if test="${pageNavi.needNext == 1 }">
					<a class="navi" href="#conta" value="${pageNavi.endNavi + 1}">&raquo;</a>
				</c:if>
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
    		<c:if test="${cartCount != 0 }">
    			<span class="badge badge-danger cartBadge">${cartCount }</span>
    		</c:if>
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
			
			var withoutSoldout = "Y";
			function withoutSoldoutChanged(){
				$.ajax({
					url: "freeMarket",
					data: {
						currentPage: "${pageNavi.currentPage}",
						category: "${category}",
						soldout: withoutSoldout
					}
				}).done(function(resp){
					$(".ajaxRow").remove();
					$("#conta").append(resp);
					$(".navi").each(function(i, item){
						if($(item).text() == "${pageNavi.currentPage}"){
							$(this).css("color", "#EC7357");
						}
					});
					$(".cardImg").each(function(i, item){
						if($(item).attr("soldout") == 'y'){
							$(this).css("filter", "brightness(60%)");
						}
					});
				});
			}
			
			if(document.cookie != ""){
				var cookies = cookieToJson(document.cookie);
				$("#withoutSoldout").prop("checked", true);
				withoutSoldout = "N";
				withoutSoldoutChanged();
				console.log(cookies);
			}
			$("#withoutSoldout").on("change", function(){
				var exdate = new Date();
				if($(this).prop("checked")){
					withoutSoldout = "N";
					exdate.setDate(exdate.getDate() + 30);
				}else{
					withoutSoldout = "Y";
					exdate.setDate(exdate.getDate() - 1);
				}
				document.cookie = "withoutSoldout=" + $("#withoutSoldout").prop("checked") + ";expires=" + exdate.toGMTString();
				withoutSoldoutChanged();
			});
			function cookieToJson(cookie){
				var cookieJson = {};
				var cookies = document.cookie;
				var cookieArr = cookies.replace(/ /g, "").split(";");
				for(var i = 0; i < cookieArr.length; i++){
					var entry = cookieArr[i].split("=");
					cookieJson[entry[0]] = entry[1];
				}
				return cookieJson;
			}
			
			$(".site-navbar").css("z-index", "100 !important");
			$(".nav-link").each(function(i, item){
				if($(item).attr("href").match("^freeMarket")){
					$(this).attr("class", "active");
				}
			});
			
			$(".op").each(function(i, item){
				if($(item).val() == "${category}"){
					$(this).attr("selected", true);
				}
			});
			
			$(".navi").each(function(i, item){
				if($(item).text() == ${pageNavi.currentPage}){
					$(this).css("color", "#EC7357");
				}
			});
			
			$(".cardImg").each(function(i, item){
				if($(item).attr("soldout") == 'y'){
					$(this).css("filter", "brightness(60%)");
				}
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
			
			$(document).on("click", ".navi", function(){
				var currentPage = $(this).attr("value");
				$.ajax({
					url: "freeMarket",
					data: {
						currentPage: currentPage,
						category: "${category}",
						soldout: withoutSoldout
					}
				}).done(function(resp){
					$(".ajaxRow").remove();
					$("#conta").append(resp);
					$(".navi").each(function(i, item){
						if($(item).text() == currentPage){
							$(this).css("color", "#EC7357");
						}
					});
					$(".cardImg").each(function(i, item){
						if($(item).attr("soldout") == 'y'){
							$(this).css("filter", "brightness(60%)");
						}
					});
				});
			})
		})
	</script>
</body>
</html>