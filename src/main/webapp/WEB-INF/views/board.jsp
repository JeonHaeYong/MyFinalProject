<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <title>DogLife &mdash; Website Template by Colorlib</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
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
    
    
    <!--  추가 -->
    
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
   rel="stylesheet">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

           
        <script>
        function sendFile(file,el){
            data = new FormData();
            data.append("file", file);
//             alert(file);
            $.ajax({
                data: data,
                type: "POST",
                url: "saveImageAjax.board",
                cache: false,
                contentType: false,
                processData: false,
                enctype:"multipart/form-data",
               success: function (data) {
//                alert(data);
               $(el).summernote('editor.insertImage', 'image'+data);
//                $(".note-editable").append("<img src='image/"+data+"'>");
                 }
            });
           };
            window.onload = function(){
            	$("#oxQuizBtn").on("click", function(){
            		location.href = "oxQuiz";
            	});
                document.getElementById("toMainBoard").onclick = function(){
                    location.href = "toBoard";
                }
                document.getElementById("writeComplete").onclick = function(){
                    var title= $("#title");
//                     var contents = document.getElementById("contents");
                    if(title.val()==""){
                        alert("제목을 입력해주세요.");
                        title.focus();
                        return;
                    }
                    if ($('#summernote').summernote('isEmpty')) {
                    alert('내용을 입력해주세요.');
                    return;
               }
//                     if(contents.value==""){
//                         alert("내용을 입력해주세요.");
//                         contents.focus();
//                         return;
//                     }
               $('textarea[name="contents"]').val($('#summernote').summernote('code'));
//                alert("val : "+$('textarea[name="contents"]').val());
                    document.getElementById("writeForm").submit();
                }
                $('#summernote').summernote({
                    placeholder: '내용을 입력해주세요.',
                    tabsize:2,
                    height: 500,
                    callbacks : {
                        onImageUpload: function(files, editor, welEditable) {
                            sendFile(files[0],this);
                        }
                    }
                });
            }
        </script>
    
   </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
    <div id="wrapper">
		<h1>Mini Game Home</h1>
		<input type="button" id="oxQuizBtn" value="OX상식퀴즈">
	</div>
    
    <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>

  <div class="site-wrap">
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
       
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner" >
      <div class="container">
        <div class="row align-items-center">       
          <div class="col-6 col-xl-2">
            <h1 class="mb-0 site-logo"><a href="index.html" class="h2 mb-0"><strong>Dog</strong>Life<span class="text-primary">.</span> </a></h1>
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="#home-section" class="nav-link">Home</a></li>
                <li><a href="#about-section" class="nav-link">About</a></li>
                <li><a href="#trainers-section" class="nav-link">Doctor</a></li>
                <li><a href="#pricing-section" class="nav-link">Pricing</a></li>
                <li><a href="#blog-section" class="nav-link">Blog</a></li>
                <li><a href="#services-section" class="nav-link">Services</a></li>
                <li><a href="#contact-section" class="nav-link">Contact</a></li>
              </ul>
            </nav>
          </div>
          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3"></span></a></div>
        </div>
     </div>
    
    </header>

  
    <section class="site-blocks-cover overflow-hidden bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-5 mr-auto align-self-center text-center text-md-left">
            <div class="intro-text">
              <h1>We Love Dogs</h1>
              <p class="mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque odio exercitationem iste, excepturi similique omnis.</p>
              <p><a href="#" class="btn btn-primary">Get In Touch</a></p>
            </div>
          </div>
          <div class="col-md-5 align-self-center text-center text-md-right">
            <img src="resources/images/dog_1.jpg" alt="Image" class="img-fluid cover-img">
            <img src="resources/images/dog_2.jpg" alt="Image" class="img-fluid cover-img2">
          </div>
        </div>
      </div>
    </section> 

  


    <form id="writeForm" action="inputBoard" method="post">
        <textarea name="contents" style="display:none"></textarea>
            <div class="container">
                <div class="row top">
                    <div class="col-lg-12 col-md-12 col-sm-12">게시판 글쓰기</div>
                </div>
                <div class="row">
                    <div class="input-group col-lg-12 col-md-12 col-sm-12">
                        <div class="input-group-prepend">
                            <span class="input-group-text">제목</span>
                        </div>
                        <input id="title" name="title" type="text" class="form-control" placeholder="제목을 입력하세요">
                    </div>
                </div>
                <div class="row">
                    <!--
<div class="input-group col-lg-12 col-md-12 col-sm-12">
<div class="input-group-prepend">
<span id="smContents" class="input-group-text">내용</span>
</div>
</div>
-->
                    <div class="col-lg-12 col-md-12 d-md-block d-none">
                        <div id="smContents">
                            <span>내용</span>
                        </div>
                    </div>
                    <div id="smNote" class="col-lg-12 col-md-12 col-sm-12">
                        <div id="summernote"></div>
                    </div>
                </div>
                <div class="row p-1">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <button id="writeComplete" type="button" class="btn">작성하기</button>
                        <button id="toMainBoard" type="button" class="btn">글 목록으로</button>
                    </div>
                </div>
            </div>
        </form>


  

    

    
    


  





    
    
  
    
    
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-5">
                <h2 class="footer-heading mb-4">About Us</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque facere laudantium magnam voluptatum autem. Amet aliquid nesciunt veritatis aliquam.</p>
              </div>
              <div class="col-md-3 ml-auto">
                <h2 class="footer-heading mb-4">Quick Links</h2>
                <ul class="list-unstyled">
                  <li><a href="#about-section" class="smoothscroll">About Us</a></li>
                  <li><a href="#trainers-section" class="smoothscroll">Trainers</a></li>
                  <li><a href="#services-section" class="smoothscroll">Services</a></li>
                  <li><a href="#testimonials-section" class="smoothscroll">Testimonials</a></li>
                  <li><a href="#contact-section" class="smoothscroll">Contact Us</a></li>
                </ul>
              </div>
              <div class="col-md-3">
                <h2 class="footer-heading mb-4">Follow Us</h2>
                <a href="#" class="pl-0 pr-3 social-link"><span class="icon-facebook"></span></a>
                <a href="#" class="pl-3 pr-3 social-link"><span class="icon-twitter"></span></a>
                <a href="#" class="pl-3 pr-3 social-link"><span class="icon-instagram"></span></a>
                <a href="#" class="pl-3 pr-3 social-link"><span class="icon-linkedin"></span></a>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
            <form action="#" method="post" class="footer-subscribe">
              <div class="input-group mb-3">
                <input type="text" class="form-control border-secondary text-white bg-transparent" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn btn-primary text-black" type="button" id="button-addon2">Send</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
              <p>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
                with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </p>
        
            </div>
          </div>
          
        </div>
      </div>
    </footer>

  </div> <!-- .site-wrap -->

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

  
  </body>
</html>