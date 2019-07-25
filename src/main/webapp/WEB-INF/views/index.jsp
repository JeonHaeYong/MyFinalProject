<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
<script>
//팝업창!!!---------------------------------------------------------------------
 function openPopup(url){
	 var cookies = document.cookie;
	var result = cookieToJson(cookies);
                	   if(result != "N"){
                		   window.open(url,'','width=570,height=830,left=1300,top=70,status=no,toolbar=no,scrollbars=no'); 
                	   } 
                   }
function cookieToJson(cookies){
	var entry = cookies.split("=");
	entry[0] = entry[1];
	return entry[0];
}

</script>
<style>
/* 만화 부분 */
	.no-gutters{}
	.pricing{height:845px;}
	.pricing img{width:405px; height:800px;  border: 5px dashed #754F44;}
	.from{font-family:'Gamja Flower', cursive; font-size:22px;}
	
	#acs_div
	{
		width: 100%;
		height: 600px;
	}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300" id="home-section" onload="javascript:openPopup('popUp.home')">
   <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
   <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

<section class="site-blocks-cover overflow-hidden bg-light">
      <div class="container">
         <div class="row">
            <div
               class="col-md-5 mr-auto align-self-center text-center text-md-left">
               <div class="intro-text">
                  <h1>We Love Dogs</h1>
                  <p class="mb-4">Lorem ipsum dolor sit amet consectetur
                     adipisicing elit. Cumque odio exercitationem iste, excepturi
                     similique omnis.</p>
                  <p>
                     <a href="#" class="btn btn-primary">Get In Touch</a>
                  </p>
               </div>
            </div>
            <div class="col-md-5 align-self-center text-center text-md-right">
               <img src="resources/images/dog_1.jpg" alt="Image"
                  class="img-fluid cover-img"> <img
                  src="resources/images/dog_2.jpg" alt="Image"
                  class="img-fluid cover-img2">
            </div>
         </div>
      </div>
      </section>

      <section class="site-section" id="about-section">
      <div class="container">
        <div class="row no-gutters mb-5" style="width: 1300px;">
            <div class="col-12 col-sm-6 col-md-6 col-lg-4 " style="background-color: #FDD692;"
               data-aos="fade-up" data-aos-delay="">

               <div class="pricing">
                  <span class="icon-paw d-block display-5 text-white mb-2 pt-2"></span><!-- 발자국 1 -->
                  <img src="/resources/images/abandonedAnimalStory01.png">
               </div>

            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-4"style="background-color: #FDD692;"
               data-aos="fade-up" data-aos-delay="100">
               <div class="pricing">
                  <span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span><!-- 발자국2 -->
                  <span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span><!-- 발자국2 -->
                 	 <img src="/resources/images/abandonedAnimalStory02.png">
               </div>
            </div>
            
            <div
               class="col-12 col-sm-6 col-md-6 col-lg-4"style="background-color: #FDD692;"
               data-aos="fade-up" data-aos-delay="200">
               <div class="pricing">
                  <span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span><!-- 발자국3 -->
                  <span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span><!-- 발자국3 -->
                  <span class="icon-paw d-inline-block display-5 text-white mb-2 pt-2"></span><!-- 발자국3 -->
                  <img src="/resources/images/abandonedAnimalStory03.png">
               </div>
            </div>
            <div class="row"><div class="col-12 from">출처-포인핸드<img src="/resources/images/pet.png"></div>
            </div>
         </div>
         <div class="row justify-content-center" data-aos="fade-up">
            <div class="col-lg-6 text-center heading-section mb-5">

               <h2 id="acs_title" class="text-black mb-2"></h2>
               
               <p>이번 달 유기 동물 현황</p>
            </div>
         </div>

         <div class="row hover-1-wrap mb-5 mb-lg-0">
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
      <div class="container">
         <div class="row justify-content-center" data-aos="fade-up">
            <div class="col-lg-6 text-center heading-section mb-5">

               <h2 class="text-black mb-2">유기동물을 도와주세요!</h2>
               <p>유기동물들을 도와주세요!(설명)유기동물들을 도와주세요!(설명)유기동물들을 도와주세요!(설명)유기동물들을
                  도와주세요!(설명)</p>
            </div>
         </div>

         <div class="row hover-1-wrap mb-5 mb-lg-0">
            <div class="col-12">
               <div class="row">
                  <div class="mb-4 mb-lg-0 col-lg-6 order-lg-2" data-aos="fade-left">
                     <a href="#" class="rotate10"> <img
                        src="resources/images/dog_3.jpg" alt="Image" class="img-fluid">
                     </a>
                  </div>
                  <div
                     class="col-lg-5 mr-auto text-lg-right align-self-center order-lg-1"
                     data-aos="fade-right">
                     <h2 class="text-black">종류 성별/나이/체중/특징</h2>
                     <p class="mb-4">Far far away, behind the word mountains,
                        Separated they live in Bookmarksgrove right at the coast of the
                        Semantics, a large language ocean.</p>
                     <p>
                        <a href="#" class="btn btn-primary">Read More</a>
                     </p>
                  </div>
               </div>
            </div>
         </div>

         <div class="row hover-1-wrap mb-5 mb-lg-0">
            <div class="col-12">
               <div class="row">
                  <div class="mb-4 mb-lg-0 col-lg-6" data-aos="fade-right">
                     <img src="resources/images/dog_4.jpg" alt="Image"
                        class="img-fluid"> </a>
                  </div>
                  <div class="col-lg-5 ml-auto align-self-center"
                     data-aos="fade-left">
                     <h2 class="text-black">종류 성별/나이/체중/특징</h2>
                     <p class="mb-4">Far far away, behind the word mountains,
                        Separated they live in Bookmarksgrove right at the coast of the
                        Semantics, a large language ocean.</p>
                     <p>
                        <a href="#" class="btn btn-primary">Read More</a>
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

               <h2 class="text-black mb-2">후원하기</h2>
            </div>
         </div>
               <div class="row">
                  <div class="mb-4 mb-lg-6 col-lg-6" data-aos="fade-right">
                     <img id="donation_img" alt="Image"
                        class="img-fluid cover-img2" height="50"> 
                  </div>
                  <div class="mb-4 mb-lg-6 col-lg-6" data-aos="fade-right">
					
					<h2 id="donation_name" class="mb-2 text-black heading my-3"></h2>
					
					<h3 id="donation_title" class="mb-2 text-black heading my-3"></h3>
                     
					<pre id="donation_explanation">후원할 업체 소개글~~~~~<br>후원할 업체 소개글~~~~~<br>후원할 업체 소개글~~~~~</pre>
                     
                  </div>
                  </div>
      
       
      </div>
      </section>

   

      <section class="site-section bg-light block-13"
         id="testimonials-section" data-aos="fade">
      <div class="container">

         <div class="row justify-content-center" data-aos="fade-up">
            <div class="col-lg-6 text-center heading-section mb-5">

               <h2 class="text-black mb-2">재회 후기</h2>
            </div>
         </div>
         <div data-aos="fade-up" data-aos-delay="200">
            <div class="owl-carousel nonloop-block-13">
               <div>
                  <div class="block-testimony-1 text-center">

                     <blockquote class="mb-4">
                        <p>&ldquo;Lorem ipsum dolor sit amet consectetur adipisicing
                           elit. Quidem porro aliquam quisquam perferendis illum ad
                           corporis tempore voluptatum, obcaecati, a unde? Aliquam
                           suscipit dicta, error velit quaerat eligendi quam ipsa..&rdquo;</p>
                     </blockquote>

                     <figure> <img src="resources/images/person_1.jpg"
                        alt="Image" class="img-fluid rounded-circle mx-auto"> </figure>
                     <h3 class="font-size-20 text-black">Ricky Fisher</h3>
                  </div>
               </div>

               <div>
                  <div class="block-testimony-1 text-center">



                     <blockquote class="mb-4">
                        <p>&ldquo;Lorem ipsum dolor sit amet, consectetur
                           adipisicing elit. Quaerat ad provident ipsa similique quidem.
                           Fugit nam deserunt ipsam? Excepturi, possimus.&rdquo;</p>
                     </blockquote>

                     <figure> <img src="resources/images/person_2.jpg"
                        alt="Image" class="img-fluid rounded-circle mx-auto"> </figure>
                     <h3 class="font-size-20 mb-4 text-black">Ken Davis</h3>


                  </div>
               </div>

               <div>
                  <div class="block-testimony-1 text-center">


                     <blockquote class="mb-4">
                        <p>&ldquo;Lorem ipsum dolor sit amet consectetur adipisicing
                           elit. Dolores numquam, animi est ratione aut explicabo fuga
                           illum a nesciunt tempora! Incidunt laborum blanditiis quidem
                           voluptatibus enim placeat!&rdquo;</p>
                     </blockquote>

                     <figure> <img src="resources/images/person_1.jpg"
                        alt="Image" class="img-fluid rounded-circle mx-auto"> </figure>
                     <h3 class="font-size-20 text-black">Mellisa Griffin</h3>


                  </div>
               </div>

               <div>
                  <div class="block-testimony-1 text-center">



                     <blockquote class="mb-4">
                        <p>&ldquo;Lorem ipsum dolor sit amet, consectetur
                           adipisicing elit. A nemo distinctio ratione numquam. Magni quae
                           a adipisci hic laborum voluptate optio ab tenetur. Officiis
                           mollitia nam itaque laborum?.&rdquo;</p>
                     </blockquote>

<!--                      <figure> <img src="resources/images/person_2.jpg" -->
                        alt="Image" class="img-fluid rounded-circle mx-auto"> </figure>
                     <h3 class="font-size-20 mb-4 text-black">Robert Steward</h3>


                  </div>
               </div>


            </div>
         </div>
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
     <jsp:include page="/WEB-INF/views/module/footer.jsp" ></jsp:include>
      <!-- 로그인시enter -->
   <script>
         //엔터 입력시 로그인
         function press(f){ if(f.keyCode == 13){  
        	 formname.submit();  
        	 } }

         
         $("#findId").on("click",function(){

     		location.href = "page?url=WEB-INF/modifyid.jsp";
     		})
     		
                           $("#reinputpw").on("click",function(){
                           location.href = "page?url=WEB-INF/modifypassword.jsp";
                           })

                           $("#joinMem").on("click",function() {
                           location.href = "page?url=WEB-INF/joinMem.jsp";
                           })
                           document.getElementById("login").onclick = function() {
                           document.getElementById("form").submit();
                           }
                           //                            로그인 버튼과 회원가입 버튼의 script
		
		
  		 </script>
  	
<script>
	$(function()
	{
		var temp3;
		
		$.ajax
		({
			url : "admin-chart-acs"
			, type : "POST"
			, dataType : "JSON"
		})
		.done(function(response)
		{
			
			var array = response.array; 
			
// 			console.log(array);

			if(array.length != 0)
			{
				
				google.charts.load('current',{ 'packages' :['corechart'] });
	    		
	    		google.charts.setOnLoadCallback(drawChart);
				
	    		function drawChart()
	    		{
	    			
	    			var data3 = google.visualization.arrayToDataTable
	    			([
	    				['지역', '유기 동물 수']
	    				,[array[0].area, array[0].num]
	    				,[array[1].area, array[1].num]
	    				,[array[2].area, array[2].num]
	    				,[array[3].area, array[3].num]
	    				,[array[4].area, array[4].num]
	    				,[array[5].area, array[5].num]
	    				,[array[6].area, array[6].num]
	    				,[array[7].area, array[7].num]
	    				,[array[8].area, array[8].num]
	    				,[array[9].area, array[9].num]
	    				,[array[10].area, array[10].num]
	    				,[array[11].area, array[11].num]
	    				,[array[12].area, array[12].num]
	    				,[array[13].area, array[13].num]
	    				,[array[14].area, array[14].num]
	    				,[array[15].area, array[15].num]
	    				,[array[16].area, array[16].num]
	    			]);
					
	    			var sum = 0;
	    			for(var i = 1 ; i <= array.length ; i++)
	    			{
	    				sum = sum + array[i-1].num;
	    			}
	    			
	    			$("#acs_title").text(new Date().getMonth() + 1 + "월 전국 지역별 유기동물 현황")
	    			
	    			var options3 = 
	    			{
	    				title : '총 개체수 : ' + sum,
// 	    				vAxis: {title: '단위 : 1'},
//	     				hAxis: {title: '단위 : 월'},
	    				seriesType: 'bars',
//	    					series: {1: {type: 'line'}},
	    				chartArea: {width: '60%', height: '70%'}
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
		})
		.fail(function()
		{
			alert("error");
		});
	  	
		
		$.ajax
		({
			url : "admin-donation-index"
			, dataType : "JSON"
		})
		.done(function(response)
		{
			
			console.log(response);
			
			var name = response.name;
			var title = response.title;
			var explanation = response.explanation;
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
			
		})
		.fail(function()
		{
// 			alert("error");
			console.log("index ajax error");
		});
		
	})
</script>
</body>
</html>