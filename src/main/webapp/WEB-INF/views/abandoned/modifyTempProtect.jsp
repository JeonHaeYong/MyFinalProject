<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function() {

	var sidoArr = [ "서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시",
			"울산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도",
			"경상남도", "제주특별자치도" ];
	var sidoCdArr = [ "6110000", "6260000", "6270000", "6280000",
			"6290000", "6300000", "6310000", "6410000", "6420000",
			"6430000", "6440000", "6450000", "6460000", "6470000",
			"6480000", "6500000" ];

	var sigunguArr = [
			//서울특별시
			[ "가정보호", "강남구", "강동구", "강북구", "강서구", "개별사업", "관악구", "광진구",
					"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
					"서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구",
					"용산구", "은평구", "종로구", "중구", "중랑구" ]
			// 부산광역시
			,
			[ "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구",
					"사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구" ]
			// 대구광역시
			,
			[ "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구" ]
			// 인천광역시
			,
			[ "강화군", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "옹진군",
					"중구" ]
			// 광주광역시
			,
			[ "광산구", "남구", "동구", "북구", "서구" ]

			// 대전광역시
			,
			[ "대덕구", "동구", "서구", "유성구", "중구" ]
			// 울산광역시
			,
			[ "남구", "동구", "북구", "울주군", "중구" ]
			// 경기도
			,
			[ "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시",
					"남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시",
					"안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시",
					"용인시 기흥구", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시",
					"하남시", "화성시" ]
			// 강원도
			,
			[ "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군",
					"원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군",
					"화천군", "횡성군" ],
			// 충청북도	
			[ "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군",
					"진천군", "청주시", "충주시" ],
			// 충청남도
			[ "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시",
					"서천군", "아산시", "연기군", "예산군", "천안시", "청양군", "태안군", "홍성군" ],
			// 전라북도
			[ "고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군",
					"익산시", "임실군", "장수군", "전주시", "정읍시", "진안군" ],
			// 전라남도
			[ "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시",
					"무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군",
					"장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ],
			// 경상북도
			[ "경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군",
					"상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군",
					"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시" ],
			// 경상남도
			[ "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군",
					"양산시", "의령군", "진주시", "창녕군", "창원 마산합포회원구", "창원 의창성산구",
					"창원 진해구", "통영시", "하동군", "함안군", "함양군", "합천군" ],
			// 제주특별자치도
			[ "서귀포시", "제주시" ]

	];

	var sigunguCdArr = [
			// 서울특별시	
			[ "6119999", "3220000", "3240000", "3080000", "3150000",
					"6119998", "3200000", "3040000", "3160000", "3170000",
					"3100000", "3090000", "3050000", "3190000", "3130000",
					"3120000", "3210000", "3030000", "3070000", "3230000",
					"3140000", "3180000", "3020000", "3110000", "3000000",
					"3010000", "3060000" ]
			// 부산광역시
			,
			[ "3360000", "3350000", "3400000", "3310000", "3270000",
					"3300000", "3290000", "3320000", "3390000", "3340000",
					"3260000", "3380000", "3370000", "3280000", "3250000",
					"3330000" ]
			// 대구광역시
			,
			[ "3440000", "3470000", "3480000", "3420000", "3450000",
					"3430000", "3460000", "3410000" ]
			// 인천광역시
			,
			[ "3570000", "3550000", "3530000", "3500000", "3510500",
					"3540000", "3560000", "3520000", "3580000", "3490000" ]
			// 광주광역시
			,
			[ "3630000", "3610000", "3590000", "3620000", "3600000" ]
			// 대전광역시
			,
			[ "3680000", "3640000", "3660000", "3670000", "3650000" ]
			// 울산광역시
			,
			[ "3700000", "3710000", "3720000", "3730000", "3690000" ]
			// 경기도
			,
			[ "4160000", "3940000", "3970000", "3900000", "5540000",
					"3980000", "4020000", "4090000", "3990000", "3920000",
					"3860000", "3780000", "3740000", "4010000", "3930000",
					"4080000", "3830000", "5590000", "4170000", "5700000",
					"4140000", "4000000", "4050000", "5630000", "4030000",
					"3820000", "4070000", "4060000", "3910000", "5600000",
					"4040000", "5530000" ]
			// 강원도
			,
			[ "4200000", "4340000", "4210000", "4240000", "4230000",
					"4320000", "4350000", "4270000", "4190000", "4330000",
					"4290000", "4300000", "4180000", "4220000", "4280000",
					"4250000", "4310000", "4260000" ]

			// 충청북도 6430000	
			,
			[ "4460000", "4480000", "4420000", "4440000", "4430000",
					"4470000", "4400000", "5570000", "4450000", "5710000",
					"4390000" ]
			// 충청남도 6440000	
			,
			[ "5580000", "4500000", "4550000", "4540000", "5680000",
					"4510000", "4570000", "4530000", "4580000", "4520000",
					"4560000", "4610000", "4490000", "4590000", "4620000",
					"4600000" ]
			// 전라북도 6450000	
			,
			[ "4780000", "4670000", "4710000", "4700000", "4740000",
					"4790000", "4770000", "4720000", "4680000", "4760000",
					"4750000", "4640000", "4690000", "4730000" ]
			// 전라남도 6460000 	
			,
			[ "4920000", "4880000", "4860000", "4840000", "4870000",
					"4830000", "4850000", "4800000", "4950000", "4890000",
					"4820000", "5010000", "4810000", "4970000", "4940000",
					"4990000", "4980000", "4910000", "5000000", "4960000",
					"4930000", "4900000" ]
			// 경상북도 6470000	
			,
			[ "5130000", "5050000", "5200000", "5080000", "5140000",
					"5060000", "5120000", "5240000", "5110000", "5210000",
					"5070000", "5180000", "5170000", "5090000", "5100000",
					"5230000", "5260000", "5250000", "5150000", "5190000",
					"5160000", "5220000", "5020000" ]
			// 경상남도 6480000	
			,
			[ "5370000", "5470000", "5420000", "5350000", "5430000",
					"5360000", "5340000", "5450000", "5380000", "5390000",
					"5310000", "5410000", "5280000", "5670000", "5320000",
					"5330000", "5440000", "5400000", "5460000", "5480000" ]
			// 제주특별자치도 6500000	
			, [ "6520000", "6510000" ] ];

	
	function sidoSelected(){
//			if($("#sido_select").val() != 0)
		// 			{
		var selectedItem = $("#sido_select").val();
		var sigungu_select = $("#sigungu_select");
		var index;
		
		for (var i = 1; i <= sidoArr.length; i++) {
		
			if (selectedItem == sidoArr[i - 1]) {
				index = i - 1;
				break;
			}
		}

		sigungu_select.empty();
		console.log(index);
		var length = sigunguArr[index].length;

		var newOption = $("<option class='op_sigungu' value='0'>선택</option>");
		sigungu_select.append(newOption);

		for (var i = 1; i <= length; i++) {
			newOption = $("<option class='op_sigungu' value='"+sigunguArr[index][i-1]+"'>"
					+ sigunguArr[index][i - 1]
					+ "</option>");
			sigungu_select.append(newOption);
		}
		
	}
	
	$("#sido_select")
	.on(
			"change",
			function() {
				sidoSelected();
			});
	
	function readURL(input) {
		 
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	 
	        reader.onload = function (e) {
	            $("#showImg").attr("src", e.target.result);
	        }
	 
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$("#img").change(function(){
		readURL(this);
	});
	
	
})
</script>
<style>
table {
	width: 760px;
}


th {
	background-color: #f7f7f7;
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

.btn {
	background-color: #EC7357;
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
}
.menu-row {
	text-align: -webkit-center;
}

.s-menu1>a {
	text-decoration: none;
	color: black;
	font-size: 20px;
	font-family: 'Gamja Flower', cursive;
}

.s-menu1:hover {
	background-color: #F3F78130;
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
.inputHidden{
	background-color:none;
	border:none;
}
</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----ì¬ê¸°ê¹ì§ ê³ ì  Headerìëë¤----------------------------------------------------------------------------------------------------------- -->
	<section class="site-section bg-light block-13">

		<div class="container">

			<div class="row">
				<!--작은 메뉴랑 게시판목록이랑 나누는 row-->
				<div class="col-lg-2 col-md-2 col-sm-12 col-12 menu-bar">
					<!--작은 메뉴바-->
					<div class="menu">MENU</div>
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
				<div class="col-lg-9 col-md-9 col-sm-12 col-12 row">
					<div class="text-center" style="margin: auto; margin-bottom: 40px;">
						<h2>임시보호중</h2>
					</div>
					<form action="modifyTempProtect?seq=${dto.seq }" method="post" enctype="multipart/form-data">
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th scope="row" style="width:20%">제목</th>
								<td width="20%"><input id="title" type="text" name="title" placeholder="${dto.title }"></td>
								<th width="20%">이미지</th>
								<td><input type="file" id="img" name="image"></td>
							</tr>
							<tr>
								<th scope="row">시도</th>
								<td><select id="sido_select" name="sido" required>
											<option class="op_sido" value="0">선택</option>
											<option class="op_sido" value="서울특별시">서울특별시</option>
											<option class="op_sido" value="부산광역시">부산광역시</option>
											<option class="op_sido" value="대구광역시">대구광역시</option>
											<option class="op_sido" value="인천광역시">인천광역시</option>
											<option class="op_sido" value="광주광역시">광주광역시</option>
											<option class="op_sido" value="대전광역시">대전광역시</option>
											<option class="op_sido" value="울산광역시">울산광역시</option>
											<option class="op_sido" value="경기도">경기도</option>
											<option class="op_sido" value="강원도">강원도</option>
											<option class="op_sido" value="충청북도">충청북도</option>
											<option class="op_sido" value="충청남도">충청남도</option>
											<option class="op_sido" value="전라북도">전라북도</option>
											<option class="op_sido" value="전라남도">전라남도</option>
											<option class="op_sido" value="경상북도">경상북도</option>
											<option class="op_sido" value="경상남도">경상남도</option>
											<option class="op_sido" value="제주특별자치도">제주특별자치도</option>
									</select></td>
									<td rowspan="2"></td>
									<td rowspan="2"><img id="showImg" src="http://upload.wikimedia.org/wikipedia/commons/c/ce/Transparent.gif" style="width:200px;height:150px"></td>
							</tr>
							<tr>
								<th scope="row">시군구</th>
								<td><select id="sigungu_select" name="sigungu" required>
											<option class="op_sigungu" value="0">선택</option>
									</select></td>
								
							</tr>

							<tr>
								<th width="15%">발견 장소</th>	
								<td width="20%"><input id="place" type="text" name="place" placeholder="${dto.place }"></td>
								<th scope="row">발견 날짜</th>
								<td><input id="findDate" type="date" name="findDateString" placeholder="${dto.findDate }"></td>
								
							</tr>
							<tr>
								<th scope="row">품종</th>
								<td><input id="type" type="text" name="type" placeholder="${dto.type }"></td>
								<th scope="row">성별</th>
								<td><select id="sex_select" name="sex">
											<option class="op_sex" value="암컷">암컷</option>
											<option class="op_sex" value="수컷">수컷</option>
									</select></td>
									
							</tr>
							<tr>
								<th scope="row">색깔</th>
								<td><input id="color" type="text" name="color" placeholder="${dto.color }"></td>
								<th scope="row">특징</th>
								<td><input id="feat" type="text" name="feat" placeholder="${dto.feat }"></td>
								
							</tr>
							<tr>
								<th scope="row">연락처</th>
								<td><input id="phone" type="text" name="phone" placeholder="${dto.phone }"></td>
							</tr>
						</tbody>
					</table>
					<div class="text-center">
						<button type="submit" id="modifyDone" class="btn btn-sm">완료</button>
						<button type="button" id="cancel" class="btn btn-sm" onclick="goBack();">취소</button>
					</div>
					</form>
				</div>
			</div>
	</section>

	<!-- ----Footerë¶ë¶ìëë¤^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>

</body>
	<script>
		function goBack() {
			window.history.back();
		}
	
		$("#delete").on("click",function(){
			location.href="deleteMyTempProtect";
		})
	</script>
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