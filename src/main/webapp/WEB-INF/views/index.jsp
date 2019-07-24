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
                	   if(result != "Y"){
                		   window.open(url,'','width=570,height=830,left=1300,top=70'); 
                	   } 
                   }
                   
function cookieToJson(cookies){
	var entry = cookies.split("=");
	entry[0] = entry[1];
	return entry[0];
}

	

</script>
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
         <div class="row justify-content-center" data-aos="fade-up">
            <div class="col-lg-6 text-center heading-section mb-5">

               <h2 class="text-black mb-2">전국 모든 지역 유기동물 현황</h2>
               <p>2019년 06월 01일~2019년 07월 10일</p>
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
                     <h2 class="text-black">Happy Pets</h2>
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
                     <img src="resources/images/dog_4.jpg" alt="Image"
                        class="img-fluid cover-img2" height="50"> 
                  </div>
                  <div class="mb-4 mb-lg-6 col-lg-6" data-aos="fade-right">
                     <h2 class="mb-2 text-black heading mt-5">이달의 후원 장소</h2>
                     <pre>후원할 업체 소개글~~~~~<br>후원할 업체 소개글~~~~~<br>후원할 업체 소개글~~~~~</pre>
                     
                  </div>
                  </div>
      
         <div class="row no-gutters">
            <div class="col-12 col-sm-6 col-md-6 col-lg-4 p-3 p-md-5" style="background-color: orange;"
               data-aos="fade-up" data-aos-delay="">

               <div class="pricing">
                  <span class="icon-paw d-block display-5 text-white mb-3"></span>
                  <h3 class="text-center text-white text-uppercase">Basic</h3>
                  <div class="price text-center mb-4 ">
                     <span><span>$50</span> / year</span>
                  </div>
                  <ul class="list-unstyled ul-check success mb-5">

                     <li>Officia quaerat eaque neque</li>
                     <li>Possimus aut consequuntur incidunt</li>
                     <li class="remove">Lorem ipsum dolor sit amet</li>
                     <li class="remove">Consectetur adipisicing elit</li>
                     <li class="remove">Dolorum esse odio quas architecto sint</li>
                  </ul>
                  <p class="text-center">
                     <a href="#" class="btn btn-secondary">Buy Now</a>
                  </p>
               </div>

            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-4 bg-dark  p-3 p-md-5"
               data-aos="fade-up" data-aos-delay="100">
               <div class="pricing">
                  <span class="icon-paw d-inline-block display-5 text-white mb-3"></span>
                  <span class="icon-paw d-inline-block display-5 text-white mb-3"></span>
                  <h3 class="text-center text-white text-uppercase">Premium</h3>
                  <div class="price text-center mb-4 ">
                     <span><span>$100</span> / year</span>
                  </div>
                  <ul class="list-unstyled ul-check success mb-5">

                     <li>Officia quaerat eaque neque</li>
                     <li>Possimus aut consequuntur incidunt</li>
                     <li>Lorem ipsum dolor sit amet</li>
                     <li>Consectetur adipisicing elit</li>
                     <li class="remove">Dolorum esse odio quas architecto sint</li>
                  </ul>
                  <p class="text-center">
                     <a href="#" class="btn btn-primary">Buy Now</a>
                  </p>
               </div>
            </div>
            
            <div
               class="col-12 col-sm-6 col-md-6 col-lg-4 bg-primary  p-3 p-md-5"
               data-aos="fade-up" data-aos-delay="200">
               <div class="pricing">
                  <span class="icon-paw d-inline-block display-5 text-white mb-3"></span>
                  <span class="icon-paw d-inline-block display-5 text-white mb-3"></span>
                  <span class="icon-paw d-inline-block display-5 text-white mb-3"></span>
                  <h3 class="text-center text-white text-uppercase">Professional</h3>
                  <div class="price text-center mb-4 ">
                     <span><span>$200</span> / year</span>
                  </div>
                  <ul class="list-unstyled ul-check success mb-5">

                     <li>Officia quaerat eaque neque</li>
                     <li>Possimus aut consequuntur incidunt</li>
                     <li>Lorem ipsum dolor sit amet</li>
                     <li>Consectetur adipisicing elit</li>
                     <li>Dolorum esse odio quas architecto sint</li>
                  </ul>
                  <p class="text-center">
                     <a href="#" class="btn btn-secondary">Buy Now</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
      </section>

   

      <section class="site-section bg-light block-13"
         id="testimonials-section" data-aos="fade">
      <div class="container">

         <div class="row justify-content-center" data-aos="fade-up">
            <div class="col-lg-6 text-center heading-section mb-5">

               <h2 class="text-black mb-2">분양 & 재회 후기</h2>
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

                     <figure> <img src="resources/images/person_2.jpg"
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
		
		$.ajax
		({
			url : "admin-chart-acs"
			, type : "POST"
			, dataType : "JSON"
		})
		.done(function(response)
		{
			console.log(response);
		})
		.fail(function()
		{
			alert("error");
		})
	  		
	})
</script>
</body>
</html>