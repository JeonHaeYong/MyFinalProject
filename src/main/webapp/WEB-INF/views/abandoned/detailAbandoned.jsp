<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기동물 조회</title>
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

<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
<style>
 @font-face {
 	font-family: 'SeoulNamsanM';
 	src: */
 		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/SeoulNamsanM.woff') */
 		format('woff'); 
 	font-weight: normal; 
 	font-style: normal; 
}
body{
	color:#754F44;

}
table {
	width: 760px;
}


th {

	border-bottom: 1px solid #cfcfcf;
	text-align: center;
	padding: 5px;
}

td {
	border-bottom: 1px solid #cfcfcf;
	padding-left: 10px;
}

#toList {
	text-align: center;
}
.menu {
	font-family: 'Gamja Flower', cursive;
	color:#754F44;
}
.menu-bar {
	text-align: center;
	height: 200px;
}

.menu-bar>div {
	height: 40px;
}

.menu-bar>div:not (.menu ):hover {
	background-color: #FBFFB950;
	font-weight: bold;
}

.menu-bar div:first-child {
	font-size: 30px;
	font-weight: bold;
	border-bottom: 1px solid black;
	color: #754F44;
}

.menu-row {
	text-align: -webkit-center;
}

.s-menu1>a {
	text-decoration: none;
	color: #754F44;
	font-size: 20px;
	font-family: 'Gamja Flower', cursive;
}

.s-menu1:hover {
	background-color: #F3F78130;
	font-weight:bold;
}

.s-menu1 {
	padding-top: 10px;
	padding-left: 0px;
	padding-right: 0px;
}

.s-menu {
	color: #B45F04;
	border-bottom: 2px solid black;
}

.menu-box {
	width: 150px;
	height: 100px;
	padding-bottom: 120px;
	margin-bottom: 150px;
}
/*점보트론 이미지*/
.jumbotron {
	background-color: white;
	padding:0px 0px;
}

.jumbotron>img {
	width: 100%;
	max-height: 600px;
}

.btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44; padding:6px 12px;}
.btn:hover{background-color:#FDD692; font-weight:bold;}
.selected_navi {
	color: #EC7357 !important;
	font-weight: 600;
}
</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----ì¬ê¸°ê¹ì§ ê³ ì  Headerìëë¤----------------------------------------------------------------------------------------------------------- -->
	<section class="site-section bg-light block-13">
		<div class="jumbotron px-0 pb-0">
			<img src="/resources/images/abandoned/blackwhite.jpg">
		</div>
		<div class="container">

			<div class="row">
				<!--작은 메뉴랑 게시판목록이랑 나누는 row-->
				<div class="col-lg-2 col-md-2 col-sm-12 col-12 menu-bar">
					<!--작은 메뉴바-->
					<div class="menu">M E N U</div>
					<div class="s-menu1">
						<a href="toAbandoned?currentPage=1">유기동물조회</a>
					</div>
					<div class="s-menu1">
						<a href="listTempProtect?currentPage=1">임시보호중</a>
					</div>
					<div class="s-menu1">
						<a href="toHospital?currentPage=1">동물병원 조회</a>
					</div>
					<div class="s-menu1">
						<a href="toCenter?currentPage=1">보호센터 조회</a>
					</div>
				</div>

				<div class="col-1">
					<!--메뉴바랑 리스트 사이 빈 공간-->
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-12 row">
					<div style="width:100%; text-align:center; margin: 40px; font-family: 'SeoulNamsanM'; font-size:40px">
						유기동물 조회
					</div>
					<div style="margin-bottom:20px; font-family: 'SeoulNamsanM'; font-weight:bold;">「동물보호법」 제17조, 같은 법 시행령 제7조 및 같은 법 시행규칙 제20조에 따라 구조된 동물의
								보호상황을 아래와 같이 공고합니다.
					</div>			
					<table class="table table-striped" style="font-family: 'SeoulNamsanM';">
						<tbody>
							<tr>
								<th scope="row" style="width: 18%;">공고번호</th>
								<td>${dto.noticeNo }</td>
								<th colspan="2" rowspan="3"><img src="${dto.popfile }" style="width: 200px; height: 150px"></th>
							</tr>
							<tr>
								<th scope="row">품종</th>
								<td>${dto.kindCd }</td>
							</tr>
							<tr>
								<th scope="row">색상</th>
								<td>${dto.colorCd }</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>${dto.sexCd }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">중성화 여부</th>
								<td>${dto.neuterYn }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">나이/체중</th>
								<td>${dto.age }/ ${dto.weight }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">접수일시</th>
								<td><fmt:formatDate value="${dto.happenDt }"
										pattern="yyyy-MM-dd" /></td>
										<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">발생장소</th>
								<td>${dto.happenPlace }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">특징</th>
								<td>${dto.specialMark }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">공고기한</th>
								<td><fmt:formatDate value="${dto.noticeSdt }"
										pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
										value="${dto.noticeEdt }" pattern="yyyy-MM-dd" /></td>
										<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2">** 유기동물 문의는 보호센터에 연락하시기 바랍니다.</td>
								<th width="18%" scope="row"></th>
							
							</tr>
							<tr>
								<th scope="row">보호센터이름</th>
								<td width="46%">${dto.careNm }</td>
								<th width="18%" scope="row">전화번호</th>
								<td width="18%">${dto.careTel }</td>
							</tr>
							<tr>
								<th scope="row">보호장소</th>
								<td>${dto.careAddr }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">관할기관</th>
								<td>${dto.orgNm }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
							<tr>
								<th scope="row">담당자</th>
								<td>${dto.chargeNm }</td>
								<th scope="row">연락처</th>
								<td>${dto.officetel }</td>
							</tr>
							<tr>
								<th scope="row">특이사항</th>
								<td>${dto.noticeComment }</td>
								<th width="18%" scope="row"></th>
								<td width="18%"></td>
							</tr>
						</tbody>
					</table>
					<div style="font-family: 'SeoulNamsanM'; font-weight:bold;">
				
					상기 동물을 분실하신 소유주께서는 보호센터로 문의하시어 동물을 찾아가시기 바라며, 동물보호 법 제17조의 규정에 따른
					공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 유실물법 제12조 및 민법 제253조의 규정에
					불구하고 해당 시,군,구 자치구가 그 동물의 소유권을 취득하게 됩니다.
					<pre>
					</pre>
					</div>
					
					<div style="margin:auto"><button id="btnToList" class="btn btn-sm" type="button" onclick="goBack();">목록</button></div>
				</div>

			</div>
	</section>

	<!-- ----Footerë¶ë¶ìëë¤^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function goBack() {
			window.history.back();
		}
	</script>
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
	$(function(){
		$(".nav-link").each(function(i, item){
	        if($(item).attr("href").match("^toAbandoned")){
	           $(this).attr("class", "active");
	        }
	     });
	})
</script>

</html>