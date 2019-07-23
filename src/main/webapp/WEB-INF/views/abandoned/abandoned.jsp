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

<style>
body {
	min-width: 375px;
}

.container {
	margin-bottom: 30px;
	color: #754F44;
}

.header {
	background-color: #EC7357;
	color: white;
	text-align: center;
	font-size: 20px;
	height: 40px;
	line-height: 40px;
}

.section {
	text-align: center;
	border-bottom: 1px solid black
}

.section:hover {
	background-color: #FDD69250;
}

.section
>
div








:not




 




(
.addr




 




){
line-height








:




 




50
px








;
}
.addr {
	text-align: left;
}

.footer {
	text-align: center;
	padding-top: 15px;
	font-size: 18px;
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
	font-size: 20px;
	font-weight: bold;
	border-bottom: 1px solid black;
	color: #754F44;
}

.card {
	width: 243px;
	min-width: 243px;
	max-width: 243px;
}

.card-body {
	height: 200px;
	padding: 0px 0px;
	margin-bottom: 20px;
}

.title {
	width: 37%;
	margin-bottom: 0px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.content {
	width: 57%;
	margin-bottom: 0px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.naviBtn {
	cursor: pointer;
	font-family: 'Gamja Flower', cursive;
	font-size: 23px;
}

.naviBtn:hover {
	font-weight: 600;
}

#btnSelect {
	background-color: #EC7357;
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
}

.selected_navi {
	color: #EC7357 !important;
	font-weight: 600;
}

label {
	width: 70px;
}

#dataNotExist {
	text-align: center;
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

#btnSelect:hover {
	background-color: #c16049;
	font-weight: 900;
}
/*점보트론 이미지*/
.jumbotron {
	background-color: white;
}

.jumbotron>img {
	width: 100%;
	max-height: 600px;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script>
	$(function() {
		
		var dogArr = [ "골든 리트리버", "그레이 하운드", "그레이트 덴", "그레이트 피레니즈", "기타",
				"꼬똥 드 뚤레아", "네오폴리탄 마스티프", "노르포크 테리어", "노리치 테리어", "뉴펀들랜드",
				"닥스훈트", "달마시안", "댄디 딘몬트 테리어", "도고 까니리오", "도고 아르젠티노",
				"도고 아르젠티노", "도베르만", "도사", "동경견", "라브라도 리트리버", "라사 압소", "라이카",
				"래빗 닥스훈드", "랫 테리어", "레이크랜드 테리어", "로디지안 리즈백 ", "로트바일러", "롯트와일러",
				"마리노이즈", "마스티프", "말라뮤트", "말티즈", "맨체스터테리어", "미니어쳐 닥스훈트",
				"미니어쳐 불 테리어", "미니어쳐 슈나우저", "미니어쳐 푸들", "미니어쳐 핀셔", "미디엄 푸들",
				"미텔 스피츠", "믹스견", "바센지", "바셋 하운드", "버니즈 마운틴 독", "베들링턴 테리어",
				"벨기에 그로넨달", "벨기에 쉽독", "벨기에 테뷰런", "벨지안 셰퍼드 독", "보더 콜리", "보르조이",
				"보스턴 테리어", "복서", "부비에 데 플랑드르", "불 테리어", "불독", "브뤼셀그리펀",
				"브리타니 스파니엘", "블랙 테리어", "비글", "비숑 프리제", "비어디드 콜리", "비즐라", "빠삐용",
				"사모예드", "살루키", "삽살개", "샤페이", "세인트 버나드", "센트럴 아시안 오브차카",
				"셔틀랜드 쉽독", "셰퍼드", "슈나우져", "스코티쉬 테리어", "스코티시 디어하운드", "스탠다드 푸들",
				"스테포드셔불테리어", "스피츠", "시바", "시베리안 허스키", "시베리안라이카", "시잉프랑세즈",
				"시츄", "시코쿠", "실리햄 테리어", "실키테리어", "아나톨리안 셰퍼드", "아메리칸 불독",
				"아메리칸 스태퍼드셔 테리어", "아메리칸 아키다", "아메리칸 에스키모", "아메리칸 코카 스파니엘",
				"아메리칸 핏불 테리어", "아메리칸불리", "아이리쉬 세터", "아이리쉬 울프 하운드",
				"아이리쉬소프트코튼휘튼테리어", "아키다", "아프간 하운드", "알라스칸 말라뮤트", "에어델 테리어",
				"오브차카", "오스트랄리안 셰퍼드 독", "오스트랄리안 캐틀 독", "올드 잉글리쉬 불독",
				"올드 잉글리쉬 쉽독", "와이마라너", "와이어 폭스 테리어", "요크셔 테리어", "울프독",
				"웨스트하이랜드화이트테리어", "웰시 코기 카디건", "웰시 코기 펨브로크", "웰시 테리어",
				"이탈리안 그레이 하운드", "잉글리쉬 세터", "잉글리쉬 스프링거 스파니엘", "잉글리쉬 코카 스파니엘",
				"잉글리쉬 포인터", "자이언트 슈나우져", "재패니즈 스피츠", "잭 러셀 테리어", "저먼 셰퍼드 독",
				"저먼 와이어헤어드 포인터", "저먼 포인터", "제주개", "제페니즈칭", "진도견", "차우차우",
				"차이니즈 크레스티드 독", "치와와", "카레리안 베어독", "카이훗", "캐벌리어 킹 찰스 스파니엘",
				"케니스펜더", "케리 블루 테리어", "케언 테리어", "케인 코르소", "코리아 트라이 하운드",
				"코리안 마스티프", "코카 스파니엘", "코카 푸", "코카시안오브차카", "콜리", "클라인스피츠",
				"키슈", "키스 훈드", "토이 맨체스터 테리어", "토이 푸들", "티베탄 마스티프", "파슨 러셀 테리어",
				"팔렌", "퍼그", "페키니즈", "페터데일테리어", "포메라니안", "포인터", "폭스테리어", "푸들",
				"풀리", "풍산견", "프레사까나리오", "프렌치 불독", "프렌치 브리타니", "플랫 코티드 리트리버",
				"플롯하운드", "피레니안 마운틴 독", "필라 브라질레오", "핏불테리어", "허배너스", "화이트리트리버",
				"화이트테리어", "휘펫" ];

		var dogCdArr = [ "000054", "000056", "000055", "000118", "000115",
				"000037", "000081", "000204", "000083", "000082", "000038",
				"000039", "000040", "000043", "000042", "000153", "000041",
				"000120", "000155", "000069", "000071", "000142", "000093",
				"000167", "000070", "000166", "000094", "000121", "000152",
				"000073", "000146", "000072", "000159", "000076", "000075",
				"000079", "000078", "000077", "000074", "000080", "000114",
				"000133", "000012", "000017", "000015", "000164", "000157",
				"000148", "000016", "000020", "000021", "000022", "000024",
				"000023", "000026", "000027", "000169", "000025", "000019",
				"000013", "000018", "000014", "000162", "000085", "000096",
				"000095", "000001", "000034", "000104", "000031", "000099",
				"000122", "000123", "000097", "000132", "000105", "000154",
				"000124", "000100", "000103", "000151", "000139", "000101",
				"000102", "000098", "000136", "000202", "000160", "000203",
				"000008", "000131", "000009", "000119", "000150", "000057",
				"000058", "000059", "000006", "000004", "000007", "000005",
				"000143", "000011", "000010", "000137", "000084", "000163",
				"000112", "000113", "000149", "000110", "000205", "000108",
				"000109", "000060", "000046", "000047", "000044", "000045",
				"000053", "000062", "000061", "000052", "000165", "000051",
				"000156", "000129", "000067", "000035", "000033", "000032",
				"000158", "000144", "000030", "000029", "000064", "000207",
				"000028", "000002", "000068", "000125", "000141", "000145",
				"000036", "000066", "000065", "000063", "000140", "000107",
				"000106", "000086", "000088", "000090", "000087", "000138",
				"000089", "000126", "000127", "000128", "000091", "000003",
				"000161", "000050", "000168", "000049", "000147", "000092",
				"000048", "000135", "000206", "000130", "000134", "000111" ];

		var catArr = [ "고양이", "기타", "노르웨이 숲", "데본 렉스", "러시안 블루", "레그돌-라가머핀",
				"맹크스", "먼치킨", "메인쿤", "발리네즈", "버만", "벵갈", "봄베이", "브리티시 쇼트헤어",
				"사바나캣", "샤트룩스", "샴", "셀커크 렉스", "소말리", "스노우 슈", "스코티시폴드",
				"스핑크스", "시베리안 포레스트", "싱가퓨라", "아메리칸 쇼트헤어", "아비시니안", "재패니즈밥테일",
				"터키시 앙고라", "통키니즈", "페르시안-페르시안 친칠라", "하바나 브라운", "하일랜드 폴드",
				"한국 고양이" ];

		var catCdArr = [ "000116", "000201", "000170", "000171", "000172",
				"000173", "000174", "000175", "000176", "000177", "000178",
				"000179", "000180", "000181", "000182", "000183", "000184",
				"000185", "000186", "000187", "000188", "000189", "000190",
				"000191", "000192", "000193", "000194", "000195", "000196",
				"000197", "000198", "000199", "000200" ];

		var otherArr = [ "기타축종" ];
		var otherCdArr = [ "000117" ];

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
						"화천군", "횡성군" ]
				,
				// 충청북도	
				[ "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군",
						"진천군", "청주시", "충주시" ]
				,
				// 충청남도
				[ "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시",
						"서천군", "아산시", "연기군", "예산군", "천안시", "청양군", "태안군", "홍성군" ]
				,
				// 전라북도
				[ "고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군",
						"익산시", "임실군", "장수군", "전주시", "정읍시", "진안군" ]
				,
				// 전라남도
				[ "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시",
						"무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군",
						"장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ]
				,
				// 경상북도
				[ "경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군",
						"상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군",
						"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시" ]
				,
				// 경상남도
				[ "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군",
						"양산시", "의령군", "진주시", "창녕군", "창원 마산합포회원구", "창원 의창성산구",
						"창원 진해구", "통영시", "하동군", "함안군", "함양군", "합천군" ]
				,
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

		 
		  // 조건 선택 후 조회하여 새로운 페이지로 넘어갈 때 선택했던 조건들 그대로 표시
			if( (${from != null}) && (${from != ""}) ){
				$("#from").val("${from}");
			}
			if( (${to !=null}) && (${to != ""})){
				$("#to").val("${to}");
			}
	        $(".op_sido").each(function(i, item){
	            if($(item).text() == "${sido}"){
	               $(this).attr("selected", true);
	            }
	         });
	        
// 			if(${sido != null})
// 			{
// // 				sidoSelected();
// //	  			sigunguSelected();
// 			}
	        
	        $(".op_sigungu").each(function(i, item){
	            if($(item).text() == "${sigungu}"){
	               $(this).attr("selected", true);
	            }
	         });
	 		$(".op_shelter").each(function(i, item){
	            if($(item).text() == "${shelter}"){
	               $(this).attr("selected", true);
	            }
	         });
	        $(".op_species").each(function(i, item){
	            if($(item).text() == "${species}"){
	               $(this).attr("selected", true);
	            }
	         });
			$(".op_kind").each(function(i, item){
	            if($(item).text() == "${speciesKind}"){
	               $(this).attr("selected", true);
	            }
	         });
			$(".op_processState").each(function(i, item){
	            if($(item).text() == "${processState}"){
	               $(this).attr("selected", true);
	            }
	         });
		 
		$("#species_select")
				.on(
						"change",
						function() {
							var $kind = $("#kind_select");
							$kind.empty();
							var $species = $("#species_select");

							if ($species.val() != "0") {
								if ($species.val() == "417000") {
									var length = dogArr.length;

									var newOption = $("<option class='op_species' value='0'>전체</option>");
									$kind.append(newOption);

									for (var i = 1; i <= length; i++) {
										newOption = $("<option value='"+dogCdArr[i-1]+"'>"
												+ dogArr[i - 1] + "</option>");
										$kind.append(newOption);
									}
								} else if ($species.val() == "422400") {
									var length = catArr.length;

									var newOption = $("<option class='op_species' value='0'>전체</option>");
									$kind.append(newOption);

									for (var i = 1; i <= length; i++) {
										newOption = $("<option class='op_species' value='"+catCdArr[i-1]+"'>"
												+ catArr[i - 1] + "</option>");
										$kind.append(newOption);
									}
								} else if ($species.val() == "429900") {
									var length = otherArr.length;

									var newOption = $("<option class='op_species' value='0'>전체</option>");
									$kind.append(newOption);

									for (var i = 1; i <= length; i++) {
										newOption = $("<option value='"+otherCdArr[i-1]+"'>"
												+ otherArr[i - 1] + "</option>");
										$kind.append(newOption);
									}
								} else {
									alert("에러");
								}
							}
						});
		

		
		function sidoSelected(){
// 			if($("#sido_select").val() != 0)
			// 			{
			var selectedItem = $("#sido_select").val();
			var sigungu_select = $("#sigungu_select");
			var index;
			
			for (var i = 1; i <= sidoArr.length; i++) {
			
				if (selectedItem == sidoCdArr[i - 1]) {
					index = i - 1;
					break;
				}
			}

			sigungu_select.empty();
			$("#shelter_select").empty();
			
			var length = sigunguArr[index].length;

			var newOption = $("<option class='op_sigungu' value='0'>선택</option>");
			sigungu_select.append(newOption);

			for (var i = 1; i <= length; i++) {
				newOption = $("<option class='op_sigungu' value='"+sigunguCdArr[index][i-1]+"'>"
						+ sigunguArr[index][i - 1]
						+ "</option>");
				sigungu_select.append(newOption);
			}
			// 			}
			// 			else
			// 			{
			// 				$("#sigungu_select").empty();
			// 				$("#shelter_select").empty();
			// 			}
		}

		function sigunguSelected(){
			
		}
		
		$("#sido_select")
		.on(
				"change",
				function() {
					sidoSelected();
				});

		$("#sigungu_select")
				.on(
						"change",
						function() {
//				 			if($("#sigungu_select").val() != 0)
							// 			{
							$.ajax(
											{
												url : "shelterAjax",
												dataType : "JSON",
												contentType : "application/json; charset=UTF-8",
												data : {
													sidoCd : $("#sido_select")
															.val(),
													sigunguCd : $(
															"#sigungu_select")
															.val()
												}
											})
									.done(
											function(response) {
												//	 				var obj = JSON.stringify(response);
												//	 				alert(obj);

												//	 				var obj = JSON.parse(response);
												//	 				alert(obj+"");

												$("#shelter_select").empty();

												var newOption = $("<option class='op_shelter' value='0'>전체</option>");
												$("#shelter_select").append(
														newOption);

												for (var i = 1; i <= response.length; i++) {
													var newOption = $("<option class='op_shelter' value='"+response[i-1].careNm+"'>"
															+ response[i - 1].careNm
															+ "</option>");
													$("#shelter_select")
															.append(newOption);
												}
											}).fail(function() {
										alert("실패");

									});
							// 			}
							// 			else
							// 			{
							// 			}
						});

		$("#btnSelect")
				.on(
						"click",
						function() {
							if (($("#from").val() == "" || $("#to").val() == "")) {
								alert("날짜를 선택해 주세요.");
							} else {

								var speciesValue = "";
								var speciesKindValue = "";
								if ($("#species_select").val() == "0"
										|| $("#species_select").val() == null) {
									speciesValue = "";
								} else if ($("#species_select").val() == "417000") {
									speciesValue = "개";
									for (var i = 0; i < dogArr.length; i++) {
										if ($("#kind_select").val() == dogCdArr[i]) {
											speciesKindValue = dogArr[i];
										}
									}
								} else if ($("#species_select").val() == "422400") {
									speciesValue = "고양이";
									for (var i = 0; i < catArr.length; i++) {
										if ($("#kind_select").val() == catCdArr[i]) {
											speciesKindValue = catArr[i];
										}
									}
								} else {
									speciesValue = "기타축종";
									speciesKindValue = "기타축종";
								}

								var sidoValue = "";
								for (var i = 0; i < sidoArr.length; i++) {
									if ($("#sido_select").val() == sidoCdArr[i]) {
										sidoValue = sidoArr[i];
									}
								}

								var sigunguValue = "";
								for (var i = 0; i < sidoArr.length; i++) {
									if ($("#sido_select").val() == sidoCdArr[i]) {

										for (var j = 0; j < sigunguCdArr.length; j++) {

											if ($("#sigungu_select").val() == sigunguCdArr[i][j]) {
												sigunguValue = sigunguArr[i][j];
											}
										}
									}
								}
								for (var i = 0; i < sigunguCdArr.length; i++) {
									for (var j = 0; j < sigunguCdArr[i].length; j++) {
										if ($("#sigungu_select").val() == sigunguCdArr[i][j]) {
											sigunguValue = sigunguArr[i][j];
										}
									}
								}

								var form = $('<form></form>');
								form.attr('action', 'select?currentPage=1');
								form.attr('method', 'post');
								form.appendTo('body');

								var from = $('<input type="hidden" value="'
										+ $("#from").val()
										+ '" name="from" required>');
								var to = $('<input type="hidden" value="'
										+ $("#to").val()
										+ '" name="to" required>');
								var sido = $('<input type="hidden" value="'+sidoValue+'" name="sido">');
								var sigungu = $('<input type="hidden" value="'+sigunguValue+'" name="sigungu">');
								var shelter = $('<input type="hidden" value="'
										+ $("#shelter_select").val()
										+ '" name="shelter">');
								var species = $('<input type="hidden" value="'+speciesValue+'" name="species">');
								var speciesKind = $('<input type="hidden" value="'+speciesKindValue+'" name="speciesKind">');
								var processState = $('<input type="hidden" value="'
										+ $("#processState_select").val()
										+ '" name="processState">')
								form.append(from).append(to).append(sido)
										.append(sigungu).append(species)
										.append(speciesKind).append(processState);
								form.submit();
							} //else
						})
	});
</script>


</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----ì¬ê¸°ê¹ì§ ê³ ì  Headerìëë¤----------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron px-0 pb-0">
		<img src="/abandoned/threeDogs.jpg">
	</div>
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
						<a href="">동물병원 조회</a>
					</div>
					<div class="s-menu1">
						<a href="">보호센터 조회</a>
					</div>
				</div>

				<div class="col-1">
					<!--메뉴바랑 리스트 사이 빈 공간-->
				</div>

				<div class="col-lg-9 col-md-9 col-sm-12 col-12">

					<div class="text-center" style="margin: auto; margin-bottom: 40px">
						<h2>유기동물 조회</h2>
					</div>
					<div style="font-weight: 600; margin-bottom: 20px">
						**이 페이지에서 조회되는 유기동물 자료는 동물보호관리시스템에서 제공하는 OpenAPI 공공데이터입니다.<br>
						「동물보호법」 제 17조 및 동법 시행규칙 제 7조에 따라 유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치
						사실을 알 수 있도록 7일 동안 공고하여야 합니다. 공고중인 동물 소유자는 해당 시군구 및 동물보호센터에 문의하시어
						동물을 찾아가시기 바랍니다. 다만, 「동물보호법」제19조 및 동법 시행규칙 제21조에 따라 소유자에게 보호비용이 청구될
						수 있습니다. 또한 「동물보호법」제 17조에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는
						경우에는 「유실물법」 제12조 및 「민법」제253조의 규정에도 불구하고 해당 시·도지사 또는 시장·군수·구청장이 그
						동물의 소유권을 취득하게 됩니다.
					</div>

					<div id="formWrapper" style="font-weight: 600">
						<form action="select" method="get">
							<div class="row">
								<div class="col-lg-1">날짜</div>
								<div class="col-lg-11">
									<input id="from" type="date" max="${todayStr }" name="from"
										required> ~ <input id="to" type="date"
										max="${todayStr }" name="to" required>(날짜는 접수일 기준입니다.)
								</div>
							</div>
							<div class="row">

								<div class="col-lg-1">시도</div>
								<div class="col-lg-3">
									<select id="sido_select" name="sido">
										<option class="op_sido" value="0">전체</option>
										<option class="op_sido" value="6110000">서울특별시</option>
										<option class="op_sido" value="6260000">부산광역시</option>
										<option class="op_sido" value="6270000">대구광역시</option>
										<option class="op_sido" value="6280000">인천광역시</option>
										<option class="op_sido" value="6290000">광주광역시</option>
										<option class="op_sido" value="6300000">대전광역시</option>
										<option class="op_sido" value="6310000">울산광역시</option>
										<option class="op_sido" value="6410000">경기도</option>
										<option class="op_sido" value="6420000">강원도</option>
										<option class="op_sido" value="6430000">충청북도</option>
										<option class="op_sido" value="6440000">충청남도</option>
										<option class="op_sido" value="6450000">전라북도</option>
										<option class="op_sido" value="6460000">전라남도</option>
										<option class="op_sido" value="6470000">경상북도</option>
										<option class="op_sido" value="6480000">경상남도</option>
										<option class="op_sido" value="6500000">제주특별자치도</option>
									</select>
								</div>
								<div class="col-lg-2">시군구</div>
								<div class="col-lg-2">
									<select id="sigungu_select" name="sigungu">
										<option class="op_sigungu" value="0">전체</option>
									</select>
								</div>
								<div class="col-lg-2">보호센터</div>
								<div class="col-lg-2">
									<select id="shelter_select" name="shelter">
										<option value="0">전체</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1">품종</div>
								<div class="col-lg-5">
									<select id="species_select" name="species">
										<option class="op_species" value="0">전체</option>
										<option class="op_species" value="417000">개</option>
										<option class="op_species" value="422400">고양이</option>
										<option class="op_species" value="429900">기타</option>
									</select> <select id="kind_select" name="speciesKind">
										<option class="op_kind" value="0">전체</option>
									</select>
								</div>
								<div class="col-lg-1">상태</div>
								<div class="col-lg-2">
									<select id="processState_select" name="processState">
										<option class="op_processState" value="전체">전체</option>
										<option class="op_processState" value="공고중">공고중</option>
										<option class="op_processState" value="보호중">보호중</option>
									</select>
								</div>
								<div class="col-lg-3 text-right">
									<button id="btnSelect" class="btn btn-sm" type="button">조회</button>
								</div>
								<input type="hidden" name="currentPage" value=1>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-12 col-12 menu-bar"></div>
				<div class="col-1">
					<!--메뉴바랑 리스트 사이 빈 공간-->
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-12">
					<div class="row">
						<c:if test="${list != null }">

							<c:forEach var="dto" items="${list}">

								<div class="card myCard col-lg-4 col-md-4 col-sm-12">
									<a href="detailAbandoned?seq=${dto.seq }"><img
										src="${dto.popfile }" class="card-img-top" alt="..."
										style="width: 211px; height: 150px; margin-bottom: 10px;"></a>
									<div class="card-body">

										<p class="card-text">
											<label class="title"><strong>공고번호</strong> </label><label
												class="content">${dto.noticeNo}</label><br> <label
												class="title"><strong>접수일 </strong> </label><label
												class="content"><fmt:formatDate
													value="${dto.noticeSdt }" pattern="yyyy-MM-dd" /></label> <br>
											<label class="title"><strong>품종 </strong></label><label
												class="content">${dto.kindCd }</label><br> <label
												class="title"><strong>성별 </strong></label><label
												class="content">${dto.sexCd }</label><br> <label
												class="title"><strong>발견 장소 </strong></label><label
												class="content">${dto.happenPlace }</label><br> <label
												class="title"><strong>특징 </strong></label><label
												class="content">${dto.specialMark }</label><br> <label
												class="title"><strong>상태</strong></label> <label
												class="content">${dto.processState }</label>
										</p>
									</div>
								</div>
							</c:forEach>
						</c:if>

						<c:if test="${listsize == 0 }">
							<div id="dataNotExist">해당 데이터가 존재하지 않습니다.</div>
						</c:if>
					</div>

					<div id="naviBox" style="margin-top: 10px;" class="text-center">
						<c:if test="${pageNavi.needPrev == 1 }">
							<a class="naviBtn mx-3" currPage="${pageNavi.startNavi - 1 }">&laquo;&nbsp;</a>
						</c:if>
						<c:if test="${pageNavi.currentPage > pageNavi.startNavi }">
							<a class="naviBtn mx-3" currPage="${pageNavi.currentPage - 1}">&lt;&nbsp;</a>
						</c:if>
						<c:forEach var="i" begin="${pageNavi.startNavi}"
							end="${pageNavi.endNavi}">
							<c:if test="${i==pageNavi.currentPage}">
								<a class="naviBtn mx-3 selected_navi" currPage="${i }">${i }&nbsp;</a>
							</c:if>
							<c:if test="${i!=pageNavi.currentPage}">
								<a class="naviBtn mx-3" currPage="${i }">${i }&nbsp;</a>
							</c:if>

						</c:forEach>
						<c:if test="${pageNavi.currentPage < pageNavi.pageTotalCount }">
							<a class="naviBtn mx-3" currPage="${pageNavi.currentPage + 1}">&gt;&nbsp;</a>
						</c:if>
						<c:if test="${pageNavi.needNext == 1 }">
							<a class="naviBtn mx-3" currPage="${pageNavi.endNavi + 1}">&raquo;</a>
						</c:if>
					</div>

				</div>

			</div>
		</div>

		<form id="apiSelect" action="select" method="post">
			<input class="selectCondition" type="hidden" id="currentPage"
				value="" name="currentPage"> <input class="selectCondition"
				type="hidden" value="${from }" name="from"> <input
				class="selectCondition" type="hidden" value="${to }" name="to">
			<input class="selectCondition" type="hidden" value="${species }"
				name="species"> <input class="selectCondition" type="hidden"
				value="${speciesKind }" name="speciesKind"> <input
				class="selectCondition" type="hidden" value="${sido }" name="sido">
			<input class="selectCondition" type="hidden" value="${sigungu }"
				name="sigungu"> <input class="selectCondition" type="hidden"
				value="${shelter }" name="shelter"> <input
				class="selectCondition" type="hidden" value="${processState }"
				name="processState">
		</form>

	</section>


	<!-- ----Footerë¶ë¶ìëë¤^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>

</body>
<script>
	console.log(${listsize});
	$(".naviBtn").on("click", function() {
		$(".naviBtn").text("").css("color","#EC7357");
		var flag = "selectAll";
		$(".selectCondition").each(function(i,item){
			if($(item).val()!=""){
				flag = "condition";
			}
		})
		var currPage = $(this).attr("currPage");
		if(flag=="condition"){
			$("#currentPage").val(currPage);
			$("#apiSelect").submit();
		}else{
			location.href="toAbandoned?currentPage="+currPage;
		}
	})
</script>

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