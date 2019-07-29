<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- 로그인 Modal 영역입니다 -->
<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div id="modal-title" class="col" >로그인</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="body">
				<form action="login" id="loginform" name="formname" method="post">
					<div class="form-group">
						<label for="exampleFormControlInput1">ID</label> <input
							type="text" class="form-control" id="joinemail"
							placeholder="ID를 입력하시오" required name="id"
							>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">Password</label> <input
							type="password" class="form-control" id="joinpassword"
							placeholder="비밀번호 입력하시오" required name="password"
							>
					</div>

					<div id="loginwrapper">
						<div id="login">
							<input type="submit" id="loginbtn" class="col pl-2 pr-2" value="login">
						</div>
						<div id="search_and_join" align="center" class="col pb-1 pb-1">
							<hr>

							<div id="search"><a href="findId"class="pr-3">아이디 찾기</a>| <a class="p1-3 pr-3 " href="findPassword"> 비밀번호 찾기</a>| <a href=join
								class="pl-3" target="_blank">회원가입 </a></div>
							<hr>
						</div>
						<div id="naverlogin" >
							<a href="${url}"> <img
								src="resources/images/member/naver.png"  class="col pb-2 pl-3"
								alt="네이버 이미지" id="loginimg" /></a>
						</div>
						<div id="kakaologin">
							<a
								href="https://kauth.kakao.com/oauth/authorize?client_id=8f0beb524de484b185f094b0604de956&redirect_uri=http://localhost/oauth&response_type=code">
								<img src="resources/images/member/kakaobtn.png" class="col" id="kakaoimg">
							</a>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- footer영역입니다 -->
<footer class="site-footer" style="padding:2em;">
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-5">
						<img class="mr-3" src="/resources/images/doglogo2.png" width="50px" style="float:left;"><h2 class="footer-heading ml-4 mb-4" style="font-family: 'Gamja Flower';font-size:27px">라온펫</h2>
						<p style="color:#fff;font-family: 'Gamja Flower';font-size:20px;">라온펫은 유기동물의 숫자가 '제로'가 되는 그 날을 향해 달립니다. </p>
					</div>
					<div class="col-md-3 ml-auto">

					</div>
					<div class="col-md-3">
						<h2 class="footer-heading mb-4">Follow Us</h2>
						<a href="#" class="pl-0 pr-3 social-link"><span
							class="icon-facebook"></span></a> <a href="#"
							class="pl-3 pr-3 social-link"><span class="icon-twitter"></span></a>
						<a href="#" class="pl-3 pr-3 social-link"><span
							class="icon-instagram"></span></a> <a href="#"
							class="pl-3 pr-3 social-link"><span class="icon-linkedin"></span></a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
				<form action="#" method="post" class="footer-subscribe">
					<div class="input-group mb-3">
						<input type="text"
							class="form-control border-secondary text-white bg-transparent"
							placeholder="Enter Email" aria-label="Enter Email"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary text-black" type="button"
								id="button-addon2">Send</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row pt-3 text-center">
			<div class="col-md-12">
				<div class="border-top pt-3">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>

				</div>
			</div>

		</div>
	</div>
	
</footer>

</div>
<!--구글폰트-->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap&subset=korean" rel="stylesheet">
<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
<script>

onload = function()
{
	
	
// 	$(document).on("mouseenter", "#site_logo_col", function() 
// 	{
// 		$("#site_logo_img").fadeOut(200, function() 
// 		{
// 			$("#site_logo_img").attr("src", "resources/images/catlogo.png");
// 		})
// 		.fadeIn(200);
// 	});
// 	$(document).on("mouseleave", "#site_logo_col", function() 
// 	{
// 		$("#site_logo_img").fadeOut(200, function() 
// 		{
// 			$("#site_logo_img").attr("src", "resources/images/doglogo2.png");
// 		})
// 		.fadeIn(200);
// 	});
//
//
//	
// 	$(document).on("hover", "#site_logo_col", 
// 	function()
// 	{
// 		$("#site_logo_img").attr("src", "resources/images/catlogo.png");
// 	},
// 	function()
// 	{
// 		$("#site_logo_img").attr("src", "resources/images/doglogo2.png");
// 	});


	//카카오 로그아웃
	$("#logout").on("click",function(){
		window.open('kakaologout',
				'window팝업',
				'width=470, height=300, menubar=no, status=no, toolbar=no');

	});
	if(${errorLogin!=null}){
		   alert("로그인을 먼저 해주세요.");
		   $(".login-btn").trigger("click");
	}


};

</script>	

