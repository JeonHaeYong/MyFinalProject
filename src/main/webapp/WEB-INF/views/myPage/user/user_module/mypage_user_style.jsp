<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <!-- user 마이페이지 스타일 -->
<style>
@font-face { font-family: 'Binggrae-Bold'; 
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff'); 
font-weight: normal; font-style: normal; }
@font-face { font-family: 'LotteMartDream'; font-style: normal; font-weight: 400; 
src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff'); } @font-face { font-family: 'LotteMartDream'; font-style: normal; font-weight: 700; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff'); } @font-face { font-family: 'LotteMartDream'; font-style: normal; font-weight: 300; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff'); } .lottemartdream * { font-family: 'LotteMartDream', sans-serif; }
/* body{ */
/* 	font-family: LotteMartDream; */
/* } */
             	body *{ font-family: 'Gamja Flower' !important; font-size: 22px;}
             	::placeholder{font-family: 'Gamja Flower', cursive;}
                .topBackGround{
                    height: 100px;
                }
                .nav-link{
                    text-decoration: none;
                    color: #754F44;
                }
                .nav-link:hover{
                    color: #EC7357;
/*                     #FBFFB9 1번, #FDD692 2번, #EC7357 3번, #754F44 4번, */
                }
                .my_page_nav.active{
                    background-color: #EC7357 !important;
                    font-weight: bold !important;
                    color : #FBFFB9 !important;
                }
                .my_page_info{
                    text-align: center;
                }
                .nav_my_page_ul{
                    border-bottom: 1px solid #754F44 ; 
                }
                .nav_my_page_ul>li{
                    width: 16.6%;
                    text-align: center;
                }
                /*점보트론 이미지*/
                .jumbotron{
                    background-color: white;
                }
                .jumbotron>img{
                    width: 100%;
                    max-height: 600px;
                }
</style>
   <!-- /user 마이페이지 스타일 -->