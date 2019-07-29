<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 Modal Style영역입니다 -->
<style>
@font-face {
	font-family: 'SeoulNamsanM';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.login-btn {
	background: none;
	border: none;
	font-family: 'Gamja Flower', cursive;
	color: #754F44;
	font-weight: bold;
}

.login-btn:hover {
	color: #ed461f;
}

#loginbtn {
	height: 50px;
	background-color: #FFBF00;
	border: 0;
	outline: 0;
	color: white;
}

#logout, .logoutBtn {
	background: none;
	border: none;
	font-family: 'Gamja Flower', cursive;
	font-size: 20px;
	color: #754F44;
	font-weight: bold;
	cursor: pointer;
}

#loginbtn:hover {
	background-color: #F5505D;
}

#loginimg {
	height: 60px;
}

#kakaoimg {
	height: 53px;
}

#body {
	padding-left: 80px;
	padding-right: 80px;
	padding-top: 20px;
	padding-bottom: 50px;
}

#search {
	font-size: 12px;
}

#search>a:hover {
	color: #F5505D;
	cursor: pointer
}

#search>a {
	text-decoration: none;
	color: black;
}

#modal-title {
	text-align: center;
	font-size: 50px;
	font-family: 'Gamja Flower', cursive;
}

.modal-header {
	padding-bottom: 0px;
}

.modal-open {
	padding-right: 0px !important;
}

.top_menu_container {
	max-width: 1270px !important;
}

.badge-danger {
	background-color: rgba(236, 115, 87, 0.95);
}

.inquire_form label {
	color: white;
}

.inquire_btn {
	text-decoration: none;
	background-color: #FDD69270;
	color: #754F44;
	padding: 6px 12px;
	border-radius: 30px;
	cursor: pointer;
}

.inquire_btn:hover {
	font-weight: bold;
	background-color: #FDD692;
}
.footer_font_namsan{
	font-family: 'Gamja Flower';
}
.footer_font_namsan::placeholder{
	font-family: 'Gamja Flower';
}
.footer_ftc_white{
	color: white;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap&subset=korean"
	rel="stylesheet">