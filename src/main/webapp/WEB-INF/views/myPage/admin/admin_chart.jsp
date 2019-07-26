<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
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
#container {
	margin-top: 5%;
}
#mypage_link
{
	color: #EC7357 !important;
	font-weight: 600 !important;
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
}
.menu_btns:hover{
	background-color:#FDD692;
	font-weight:bold !important;
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





.no_radius {
	border-radius: 0px !important;
}

.chart_col {
	height: 10%;
}
#recent_chart_div
{
	height: 30%;
	min-height: 300px;
}
#compare_chart_div
{
	height: 30%;
	min-height: 300px;
}
#year_chart_div
{
	height: 50%;
	min-height: 500px;
}


</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->


	<section class="site-section block-13">

	<div id="container" class="container">
		
		
		
		
		
		
		<div id="menu_row" class="row justify-content-center">

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-member" class="btn menu_btns">회원 관리</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-item" class="btn menu_btns">무료 나눔 물품 승인</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-paylog" class="btn menu_btns">무료 나눔 거래 내역</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-donation" class="btn menu_btns">월 별 후원금 및 전달 기관</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-quiz" class="btn menu_btns">퀴즈 당첨자</a>
			</div>

			<div class="col-6 col-md-4 col-lg-2 text-center px-1">
				<a href="admin-chart" class="btn selected_menu_btns">통계</a>
			</div>

		</div>
		
		
		
		
		
		
		<div class="row justify-content-center mt-5">

			<div id="recent_chart_div" class="col-6 text-center my-3 chart_col">1번 영역</div>

			<div id="compare_chart_div" class="col-6 text-center my-3 chart_col">2번 영역</div>

		</div>

		<div class="row justify-content-center">

			<div id="year_chart_div" class="col-12 text-center my-3 chart_col">3번 영역</div>

		</div>
		
		<div class="row justify-content-center">
			<a href="admin-chart-insert">데이터 입력</a>		
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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	$(function()
    {
		drawChart();
		setInterval(drawChart, 5000);
	    
		var temp1;
		var temp2;
		var temp3;
		
		function drawChart()
	    {
			
	    	$.ajax
	    	({
				url : "admin-chart-visit"
				, type : "POST"
				, dataType : "JSON"
			})
			.done(function(response)
	    	{

	    		google.charts.load('current',{ 'packages' :['corechart'] });
	    		
	    		google.charts.setOnLoadCallback(drawChart);
	    		google.charts.setOnLoadCallback(compareChart);
	    		google.charts.setOnLoadCallback(yearChart);
	    		
	    		function drawChart()
	    		{
	    			var data1 = google.visualization.arrayToDataTable(
	    			[
	    				["Element", "Density",{ role : "style" }]
	    				,["오늘", response.todayVisitCount, "#b87333"]
	    				,["최근 7일", response.recentSevenVisitCount, "silver"]
	    				,["최근 30일", response.recentThirtyVisitCount, "gold"]
	    			]);
	    				    
	    			var view1 = new google.visualization.DataView(data1);
	    			view1.setColumns
	    			([
						0, 1,{calc : "stringify", sourceColumn : 1, type : "string", role : "annotation"}, 2
	    			]);
	    				    
	    			var options1 =
	    			{ 
	    				title : "일 평균 방문자 수", chartArea: {width: '80%', height: '80%'}, bar :{groupWidth : "95%"}, legend :{position : "none"}
	    			};
	    			if(temp1 != null)
	    			{
	    				temp1.clearChart();
	    			}
	    			
	    			var chart1 = new google.visualization.ColumnChart(document.getElementById("recent_chart_div"));
	    			chart1.draw(view1, options1);
	    			
	    			temp1 = chart1;
	    		}
	    			    
	    		function compareChart()
	    		{
	    			var data2 = google.visualization.arrayToDataTable(
	    			[
	    				["Element", "Density",{role : "style"}]
	    				,[response.year[1].time, response.year[1].count, "red"]
	    				,[response.year[0].time, response.year[0].count, "blue"]
	    			]);
	    			
	    			var view2 = new google.visualization.DataView(data2);
	    			view2.setColumns
	    			([
	    				0, 1,{ calc : "stringify", sourceColumn : 1, type : "string", role : "annotation" }, 2
	    			]);
	    			
	    			if(temp2 != null)
	    			{
	    				temp2.clearChart();
	    			}
	    			
	    			var options2 = { title : '전월 / 현월 방문자 수 비교', pieHole : 0.4, chartArea: {width: '80%', height: '80%'} };
	    			var chart2 = new google.visualization.PieChart(document.getElementById("compare_chart_div"));
	    			chart2.draw(view2, options2);
	    			
	    			temp2 = chart2;
	    		}
	    		
	    		function yearChart()
	    		{
	    			    	
					// Some raw data (not necessarily accurate)
	    			var data3 = google.visualization.arrayToDataTable
	    			([
	    				['월', '후원 금액', '월 평균 방문자 수']
	    				,[response.year[11].time, response.year[11].pay/10000, response.year[11].count]
	    				,[response.year[10].time, response.year[10].pay/10000, response.year[10].count]
	    				,[response.year[9].time, response.year[9].pay/10000, response.year[9].count]
	    				,[response.year[8].time, response.year[8].pay/10000, response.year[8].count]
	    				,[response.year[7].time, response.year[7].pay/10000, response.year[7].count]
	    				,[response.year[6].time, response.year[6].pay/10000, response.year[6].count]
	    				,[response.year[5].time, response.year[5].pay/10000, response.year[5].count]
	    				,[response.year[4].time, response.year[4].pay/10000, response.year[4].count]
	    				,[response.year[3].time, response.year[3].pay/10000, response.year[3].count]
	    				,[response.year[2].time, response.year[2].pay/10000, response.year[2].count]
	    				,[response.year[1].time, response.year[1].pay/10000, response.year[1].count]
	    				,[response.year[0].time, response.year[0].pay/10000, response.year[0].count]
	    			]);

	    			var options3 = 
	    			{
	    				title : '최근 1년간 월별 하루 평균 방문자 수 및 후원금액',
	    				vAxis: {title: '단위 : 10000'},
// 	    				hAxis: {title: '단위 : 월'},
	    				seriesType: 'bars',
	    				series: {1: {type: 'line'}},
	    				chartArea: {width: '60%', height: '70%'}
	    			};

	    			if(temp3 != null)
	    			{
	    				temp3.clearChart();
	    			}
	    			
	    			var chart3 = new google.visualization.ComboChart(document.getElementById('year_chart_div'));
	    			chart3.draw(data3, options3);
	    			
	    			temp3 = chart3;
	    		}
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
	    }
    });
    
    onload = function()
    {

    };
</script>
</html>