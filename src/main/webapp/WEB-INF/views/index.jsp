<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라온펫</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>

<style>
/* 만화 부분 */
.no-gutters {
	text-align: center;
}

.pricing {
	height: 845px;
}

.pricing img {
	width: 405px;
	height: 800px;
	border: 5px dashed #754F44;
}

.from {
	font-family: 'Gamja Flower', cursive;
	font-size: 22px;
}

.cartoon-container {
	max-width: 1300px;
}
.cartoonTitle{text-align:center; font-size:40px;font-family: 'Gamja Flower', cursive;}
.cartoonTitle>div:nth-child(2){text-align:center; font-size:15px;font-family: 'Gamja Flower', cursive;}
.cartoonTitle>span{color:#EC7357; font-size:60px;}
/* 만화 부분 끝*/
#acs_div {
	width: 100%;
	height: 600px;
}

.btn.btn-primary:hover {
	background: #EC7357;
	border-color: #EC7357;
	color: #fff;
	font-weight: bold;
}

.effect {
	display: inline-block;
	box-shadow: 0px 0px 20px -5px rgba(0, 0, 0, 0.8);
}
#donation_img
{
	width: 100%;
	height: 100%;
	border-radius: 20px;
}
.small-title{font-family: 'Gamja Flower', cursive; font-size:50px;}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section" >
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	<section class="site-blocks-cover overflow-hidden bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-5 mr-auto align-self-center text-center text-md-left">
				<div class="intro-text" style="font-family: 'Gamja Flower'">
					<p style="font-size: 50px; color: black;">라온펫은?</p>
					<p class="mb-4" style="color: #754F44; font-weight: bold;">유기동물을 조회하여 주인을 찾아주고, 실종신고를 통해 반려동물을 찾을 수 있도록 도와드립니다. 또 반려동물 관련 물품 거래를 통해 보호센터에 후원을 할 수도 있고, 반려동물 관련 지식정보도 제공해 드립니다.</p>
					<p>
						<a href="notice-view-page" class="btn btn-primary">-> 공지사항</a>
					</p>
					
					<p>
					<!--  날씨-->
					<div class="col-12 weather" align="left">
						<p style="font-size: 30px; color: black;">오늘의 날씨요정</p>
						<div class="row">
							<div class=" col-5 pr-0 ">
								<img src="" alt="Image" id="kk">
							</div>
							<div class=" col-7 pl-0" >
								<p id="temp"
									style="color:#754F44; font-family: 'Gamja Flower'; font-size: 20px;"
									class="mb-0"></p>
								<p id="humidity"
									style="color:#754F44; font-family: 'Gamja Flower'; font-size: 20px;"
									class="mb-0"></p>
								<p id="country"
									style="color: #754F44; font-family: 'Gamja Flower'; font-size: 20px;"
									class="mb-0"></p>
									
							</div>
						</div>
						<div class="row col-12 mt-3 " >
						<p id="weathertext"
									style="color: #754F44; font-family: 'Gamja Flower'; font-size: 22px;"
									class="mb-0 pl-2"></p> </div>
									<div class="row col-12">
						<p id="weathertext2"
									style="color: #754F44; font-family: 'Gamja Flower'; font-size: 22px;"
									class="mb-0 pl-2"></p> </div>
					</div>
					
					</p>
					
				</div>
			</div>
			<div class="col-md-5 align-self-center text-center text-md-right">
				<img src="resources/images/dog_girl.jpg" alt="Image" class="img-fluid cover-img"> <img src="resources/images/cat_dog.jpg" alt="Image" class="img-fluid cover-img2">
			</div>
		</div>
	</div>
	</section>

	<section class="site-section" id="about-section">
	
	<div class="container cartoon-container">
		<div class="row">
			<div class="col-12 cartoonTitle" data-aos="fade-up" data-aos-delay="100"><span>"공고"</span>와<span> "보호"</span>의 차이를 알고 있니~? </div>
			<div class="col-12 cartoonTitle" data-aos="fade-up" data-aos-delay="150">지금부터 알아보자!!</div>
		</div>
		<div class="row no-gutters mb-5">
			<div class="col-12 col-sm-12 col-md-12 col-lg-4" data-aos="fade-up" data-aos-delay="200">
				<div class="row pricing">
					<div class="col-12">
						<span class="icon-paw d-block display-5 text-white mb-2 pt-2"></span>
					</div>
					<div class="col-12 ">
						<img src="/resources/images/abandonedAnimalStory01.png">
					</div>
				</div>

			</div>

			<div class="col-12 col-sm-12 col-md-12 col-lg-4" data-aos="fade-up" data-aos-delay="300">
				<div class="row pricing">
					<div class="col-12 ">
						<span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span> <span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span>
					</div>
					<!-- 발자국2 -->
					<div class="col-12 ">
						<img src="/resources/images/abandonedAnimalStory02.png">
					</div>
				</div>
			</div>

			<div class="col-12 col-sm-12 col-md-12 col-lg-4" data-aos="fade-up" data-aos-delay="400">
				<div class="row pricing">
					<div class="col-12">
						<span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span> <span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span> <span
							class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span>
					</div>
					<div class="col-12 ">
						<img src="/resources/images/abandonedAnimalStory03.png">
					</div>
				</div>
			</div>
			<div class="col-12 from" data-aos="fade-up" data-aos-delay="410">
				출처-포인핸드<img src="/resources/images/pet.png">
			</div>
		</div>
	</div>
	<div class="container" style="font-family: 'SeoulNamsanM'">
		<div class="row justify-content-center" data-aos="fade-up">
			<div class="col-lg-6 text-center heading-section mb-5">

				<h2 id="acs_title" class="text-black mb-2"></h2>

				<p>이번 달 유기 동물 현황</p>
			</div>
		</div>

		<div class="row hover-1-wrap mb-5 mb-lg-0" data-aos="fade-up">
			<div id="acs_div" class="col-12">
				<!--                <div class="row"> -->
				<!--                   <div class="mb-4 mb-lg-0 col-lg-6 order-lg-2" data-aos="fade-left"> -->
				<!--                      <a href="#" class="rotate10"> <img -->
				<!--                         src="resources/images/dog_3.jpg" alt="Image" class="img-fluid"> -->
				<!--                      </a> -->
				<!--                   </div> -->
				<!--                   <div -->
				<!--                      class="col-lg-5 mr-auto text-lg-right align-self-center order-lg-1" -->
				<!--                      data-aos="fade-right"> -->
				<!--                      <h2 class="text-black">Happy Pets</h2> -->
				<!--                      <p class="mb-4">Far far away, behind the word mountains, -->
				<!--                         Separated they live in Bookmarksgrove right at the coast of the -->
				<!--                         Semantics, a large language ocean.</p> -->
				<!--                      <p> -->
				<!--                         <a href="#" class="btn btn-primary">Read More</a> -->
				<!--                      </p> -->
				<!--                   </div> -->
				<!--                </div> -->
			</div>
		</div>



	</div>
	</section>


	<section class="site-section" id="about-section">
	<div class="container" style="font-family: 'SeoulNamsanM'; font-weight: bold;">
		<div class="row justify-content-center" data-aos="fade-up">
			<div class="col-lg-6 text-center heading-section mb-5">

				<h2 class="text-black mb-2 small-title">주인을 찾습니다!</h2>
				<p style="color: #754F44; font-size: 20px; font-weight: bold;">[공고중 or 보호중]</p>
			</div>
		</div>

		<div class="row hover-1-wrap mb-5 mb-lg-0">
			<div class="col-12">
				<div class="row">
					<div class="mb-4 mb-lg-0 col-lg-6 order-lg-2" data-aos="fade-left">
						<img class="effect" src="${list[0].popfile }" alt="Image" class="img-fluid" style="width: 400px; border-radius: 20px;">

					</div>
					<div class="col-lg-5 mr-auto text-lg-right align-self-center order-lg-1" data-aos="fade-right" style="color: black; font-size: 18px;">
						<h2 class="text-black"></h2>
						<p class="mb-4" style="color: #754F44;">
							발견장소 : ${list[0].happenPlace}<br>${list[0].kindCd }<br>${list[0].age }<br> ${list[0].weight }<br>${list[0].specialMark }</p>
						<p>
							<a href="detailAbandoned?seq=${list[0].seq }" class="btn btn-primary">자세히 보기</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row hover-1-wrap mb-5 mb-lg-0">
			<div class="col-12">
				<div class="row">
					<div class="mb-4 mb-lg-0 col-lg-6" data-aos="fade-right">
						<img class="effect" src="${list[1].popfile }" alt="Image" class="img-fluid" style="width: 400px; border-radius: 20px;">
					</div>
					<div class="col-lg-5 ml-auto align-self-center" data-aos="fade-left" style="color: black; font-size: 18px;">
						<h2 class="text-black"></h2>
						<p class="mb-4" style="color: #754F44;">
							발견장소 : ${list[1].happenPlace}<br>${list[1].kindCd }<br>${list[1].age }<br> ${list[1].weight }<br>${list[1].specialMark }</p>
						<p>
							<a href="detailAbandoned?seq=${list[1].seq }" class="btn btn-primary">자세히 보기</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</div>
	</section>

	<section class="site-section" id="pricing-section">
	<div class="container">
		<div class="row justify-content-center" data-aos="fade-up">
			<div class="col-lg-12 text-center heading-section mb-5">

				<h2 class="text-black mb-2 small-title">후원하기</h2>
			</div>
		</div>
		<div class="row">
			<div class="mb-4 mb-lg-6 col-lg-6" data-aos="fade-right">
				<img id="donation_img" alt="Image" class="img-fluid cover-img2" height="50">
			</div>
			<div class="mb-4 mb-lg-6 col-lg-6" data-aos="fade-right">

				<h2 id="donation_name" class="mb-2 text-black heading my-3"></h2>

				<h3 id="donation_title" class="mb-2 text-black heading my-3"></h3>

				<pre id="donation_explanation">후원할 업체 소개글~~~~~<br>후원할 업체 소개글~~~~~<br>후원할 업체 소개글~~~~~</pre>

			</div>
		</div>


	</div>
	</section>


	<!-- 재회후기부분 -->
	<section class="site-section bg-light block-13" id="testimonials-section" data-aos="fade">
	<div class="container">

		<div class="row justify-content-center" data-aos="fade-up">
			<div class="col-lg-6 text-center heading-section mb-5">

				<h2 class="text-black mb-2 small-title">재회 후기</h2>
			</div>
		</div>
		<c:choose>
			<c:when test="${reList==null }">
				<div>재회후기가 없습니다.</div>
			</c:when>
			<c:otherwise>
				<!-- 재회후기 내용 -->
					<div data-aos="fade-up" data-aos-delay="200">
						<div class="owl-carousel nonloop-block-13">
							<c:forEach var="list" items="${reList }" varStatus="i">
								<div>
									<div class="block-testimony-1 text-center">
										<blockquote class="mb-4" style="font-family: 'Gamja Flower';font-weight: bold;">
											<p class="text-break text-break reviewContent_part">${list.contents }</p>
										</blockquote>
				
										<figure> <img src="review/${list.image_path1}" alt="Image" class="img-fluid rounded-circle mx-auto" style="width: 120px; height: 120px; max-width: 120px;"> </figure>
										<h3 class="font-size-20 text-black">${list.writer }</h3>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- /재회후기 내용 -->
			</c:otherwise>
		</c:choose>
	</div>
	</section>


	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->

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
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i" rel="stylesheet">
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
	<!-- 로그인시enter -->
	<script>
		//엔터 입력시 로그인
        function press(f)
        {
	        if(f.keyCode == 13)
	        {
		        formname.submit();
	        }
        }

        $("#findId").on("click", function()
        {
	        
	        location.href = "page?url=WEB-INF/modifyid.jsp";
        })

        $.ajax(
        {
            url : "admin-donation-index",
            dataType : "JSON"
        
        })

        $("#joinMem").on("click", function()
        {
	        location.href = "page?url=WEB-INF/joinMem.jsp";
        })
        document.getElementById("login").onclick = function()
        {
	        document.getElementById("form").submit();
        }
        //                            로그인 버튼과 회원가입 버튼의 script
        $(".reviewContent_part").each(function(i,item){
        	var content = $(item).text();
        	content = content.substr(0,100);
        	contentStr = "&ldquo;";
        	contentStr += content;
        	contentStr += "!&rdquo;";
        	$(item).html(contentStr);
        });
	</script>

	<script>
		$(function()
        {
	        var temp3;
	        
	        $.ajax(
	        {
	            url : "admin-chart-acs",
	            type : "POST",
	            dataType : "JSON"
	        }).done(function(response)
	        {
		        
		        var array = response.array;
		        
		        // 			console.log(array);
		        
		        if(array.length != 0)
		        {
			        
			        google.charts.load('current',
			        {
				        'packages' :
				        [
					        'corechart'
				        ]
			        });
			        
			        google.charts.setOnLoadCallback(drawChart);
			        
			        function drawChart()
			        {
				        
				        var data3 = google.visualization.arrayToDataTable(
				        [
				            [
				                '지역',
				                '유기 동물 수'
				            ],
				            [
				                array[0].area,
				                array[0].num
				            ],
				            [
				                array[1].area,
				                array[1].num
				            ],
				            [
				                array[2].area,
				                array[2].num
				            ],
				            [
				                array[3].area,
				                array[3].num
				            ],
				            [
				                array[4].area,
				                array[4].num
				            ],
				            [
				                array[5].area,
				                array[5].num
				            ],
				            [
				                array[6].area,
				                array[6].num
				            ],
				            [
				                array[7].area,
				                array[7].num
				            ],
				            [
				                array[8].area,
				                array[8].num
				            ],
				            [
				                array[9].area,
				                array[9].num
				            ],
				            [
				                array[10].area,
				                array[10].num
				            ],
				            [
				                array[11].area,
				                array[11].num
				            ],
				            [
				                array[12].area,
				                array[12].num
				            ],
				            [
				                array[13].area,
				                array[13].num
				            ],
				            [
				                array[14].area,
				                array[14].num
				            ],
				            [
				                array[15].area,
				                array[15].num
				            ],
				            [
				                array[16].area,
				                array[16].num
				            ]
				        ]);
				        
				        var sum = 0;
				        for(var i = 1 ; i <= array.length ; i++)
				        {
					        sum = sum + array[i - 1].num;
				        }
				        
				        $("#acs_title").text(new Date().getMonth() + 1 + "월 전국 지역별 유기동물 현황")

				        var options3 =
				        {
				            title : '총 개체수 : ' + sum,
				            // 	    				vAxis: {title: '단위 : 1'},
				            //	     				hAxis: {title: '단위 : 월'},
				            seriesType : 'bars',
				            //	    					series: {1: {type: 'line'}},
				            chartArea :
				            {
				                width : '60%',
				                height : '70%'
				            }
				        };
				        
				        if(temp3 != null)
				        {
					        temp3.clearChart();
				        }
				        
				        var chart3 = new google.visualization.ComboChart(document.getElementById('acs_div'));
				        chart3.draw(data3, options3);
				        
				        temp3 = chart3;
			        }
			        
		        }
		        else
		        {
			        console.log("유기 동물 현황 오류 발생");
		        }
	        }).fail(function()
	        {
		        console.log("유기 동물 현황 오류 발생");
	        });
	        
	        $.ajax(
	        {
	            url : "admin-donation-index",
	            dataType : "JSON"
	        }).done(function(response)
	        {
		        
		        var name = response.name;
		        var title = response.title;
		        var explanation = response.explanation.replace(/<br>/g, "\n");
		        var image1 = response.image1;
		        var image2 = response.image2;
		        var image3 = response.image3;
		        
		        $("#donation_name").text(name);
		        $("#donation_title").text(title);
		        $("#donation_explanation").text(explanation);
		        
		        if(image1 != "없음")
		        {
			        $("#donation_img").attr("src", image1)
		        }
		        else if(image2 != "없음")
		        {
			        $("#donation_img").attr("src", image2)
		        }
		        else if(image3 != "없음")
		        {
			        $("#donation_img").attr("src", image3)
		        }
		        else
		        {
			        $("#donation_img").attr("src", "resources/images/dog_3.jpg")
		        }
		        
	        }).fail(function()
	        {
		        // 			alert("error");
		        console.log("index ajax error");
	        });
	        
	        //팝업창!!!--왜망가진거야 ㅠㅠㅠ-------------------------------------------------------------------
	        
	        openPopup('popUp.home');
	        
	        function openPopup(url)
	        {
		        var cookies = document.cookie;
		        var result = cookieToJson(cookies);
		        if(result != "N")
		        {
			        window.open(url, '', 'width=430,height=625,left=1300,top=70');
		        }
	        }
	        function cookieToJson(cookies)
	        {
		        var entry = cookies.split("=");
		        entry[0] = entry[1];
		        return entry[0];
	        }
        })

        
        
        
        //날씨
            var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=078b2ce4ce1dc66e407d2f265bdfdd41";
    		$.ajax({
    			url : apiURI,
    			dataType : "json",
    			type : "GET",
    			async : "false",
    			success : function(resp) {
    				var temp=resp.main.temp - 273;
    				console.log(resp);
    				$("#temp").html("현재온도 : " + temp.toFixed(2));
    				$("#humidity").html("현재습도 : " + resp.main.humidity);
    				console.log("날씨 : " + resp.weather[0].main);
    				console.log("상세날씨설명 : " + resp.weather[0].description);
    				console.log("날씨 이미지 : " + resp.weather[0].icon);
    				console.log("바람 : " + resp.wind.speed);
    				$("#country").html("나라 : " + resp.sys.country);
    				console.log("도시이름 : " + resp.name);
    				console.log("구름 : " + (resp.clouds.all) + "%");
    				if(resp.weather[0].icon=="01d" || resp.weather[0].icon=="01n"){
    					//clear sky
    					var imgURL ="resources/images/weather/clearsky.png";
    					$("#weathertext").html("오늘은 맑은 날씨입니다.");
    					$("#weathertext2").html("애완동물과 신나는 산책 어떠세요?");
    					
    				}
    				else if(resp.weather[0].icon=="02d" || resp.weather[0].icon=="02n"|| resp.weather[0].icon=="03d" || resp.weather[0].icon=="03n"){
    					//few clouds //scattered clouds
    					var imgURL ="resources/images/weather/fewcloud.png";
    					$("#weathertext").html("오늘은 구름이 가득한 날씨 입니다.");
    					$("#weathertext2").html("오랜만에 애완동물 목욕 어떠세요?");
    				}
    				
    				else if(resp.weather[0].icon=="04d" || resp.weather[0].icon=="04n"){
    					//broken clouds
    					var imgURL ="resources/images/weather/cloud.png";
    					$("#weathertext").html("오늘은 흐린 날씨입니다.");
    					$("#weathertext2").html("애완동물과 공놀이 어떠세요?");
    				}
    				else if(resp.weather[0].icon=="09d" || resp.weather[0].icon=="09n"||resp.weather[0].icon=="10d" || resp.weather[0].icon=="10n"){
    					//shower rain
    					var imgURL ="resources/images/weather/rain.png";
    					$("#weathertext").html("오늘은 비 오는 날씨입니다.");
    					$("#weathertext2").html("애완동물과의 산책은 삼가해주세요!");
    				}
    			
    				else if(resp.weather[0].icon=="11d" || resp.weather[0].icon=="11n"){
    					//thunderstorm
    					var imgURL ="resources/images/weather/strom.png";
    					$("#weathertext").html("오늘은 찌릿!천둥 치는 날입니다.");
    					$("#weathertext2").html("애완동물이 놀라지 않게 조심 해주세요!");
    				}
    				else if(resp.weather[0].icon=="13d" || resp.weather[0].icon=="13n"){
    					//snow
    					var imgURL ="resources/images/weather/snow.png";
    					$("#weathertext").html("오늘은 눈오는 날입니다.");
    					$("#weathertext2").html("애완동물과 뽀송뽀송 눈밭 산책 어떠세요?");
    				}
    				else if(resp.weather[0].icon=="50d" || resp.weather[0].icon=="50n"){
    					//mist
    					var imgURL ="resources/images/weather/mist.png";
    					$("#weathertext").html("오늘은 안개 낀 입니다.");
    					$("#weathertext2").html("애완동물과 청소 어떠세요?");
    				}
    				else{//이미지 없는 경우대비 
    				
    					var imgURL = "http://openweathermap.org/img/w/"
    						+ resp.weather[0].icon + ".png";
    					$("#weathertext").html("");
    					
    				}
    				$("#kk").attr("src", imgURL);
    				
    			}
    		});

	</script>
</body>
</html>