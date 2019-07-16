<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- 로그인 Modal 영역입니다 -->
<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Login</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="login" id="loginform" name="formname" method="post">
					<div class="form-group">
						<label for="exampleFormControlInput1">ID</label> <input
							type="text" class="form-control" id="joinemail"
							placeholder="ID를 입력하시오" required name="id"
							onkeypress="press(this.form)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">Password</label> <input
							type="password" class="form-control" id="joinpassword"
							placeholder="비밀번호 입력하시오" required name="password"
							onkeypress="press(this.form)">
					</div>

					<div class="modal-footer">


						<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
						<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->

						<c:if test="${id eq null}">
							<a	href="https://kauth.kakao.com/oauth/authorize?client_id=8f0beb524de484b185f094b0604de956&redirect_uri=http://localhost/oauth&response_type=code">
								<img src="resources/images/member/kakaobtn.png">
							</a>

							<div id="naver_id_login">
								<a href="${url}"> <img src="resources/images/member/naver.png"
									width="60" height="60px" alt="네이버 이미지" /></a>
							</div>
						</c:if>
						<br>
						<button type="button" type="button" id="findId">ID 찾기</button>
						<button type="button" type="button" id="reinputpw">PW 찾기</button>
						<button type="button" type="button" id="joinMem">회원 가입</button>
						<button type="submit" id="login">login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- footer영역입니다 -->
<footer class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-5">
						<h2 class="footer-heading mb-4">About Us</h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Neque facere laudantium magnam voluptatum autem. Amet aliquid
							nesciunt veritatis aliquam.</p>
					</div>
					<div class="col-md-3 ml-auto">
						<h2 class="footer-heading mb-4">Quick Links</h2>
						<ul class="list-unstyled">
							<li><a href="#about-section" class="smoothscroll">About
									Us</a></li>
							<li><a href="#trainers-section" class="smoothscroll">Trainers</a></li>
							<li><a href="#services-section" class="smoothscroll">Services</a></li>
							<li><a href="#testimonials-section" class="smoothscroll">Testimonials</a></li>
							<li><a href="#contact-section" class="smoothscroll">Contact
									Us</a></li>
						</ul>
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
		<div class="row pt-5 mt-5 text-center">
			<div class="col-md-12">
				<div class="border-top pt-5">
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