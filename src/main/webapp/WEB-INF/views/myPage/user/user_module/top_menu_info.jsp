<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	            <div class="jumbotron px-0 pb-0">
                <img src="/mypage/dog_1.jpg">
            </div>
            <section id="wrapper" class="mb-5">
                <div class="container">
                    <div class="row">
                        <div class="col-4 p-2">
                            <div class="my_page_empty invisible">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" aria-controls="pills-home" aria-selected="true">Home</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="my_page_info">
                                <div>
                                    <img src="/resources/images/dog_1.jpg" class="rounded-circle" style="width: 100px; height: 100px;">
                                </div>
                                <div>
                                    ${memberDTO.name }님                                </div>
                                <div>
                                    현재포인트
                                </div>
                                <div>
                                    ${memberDTO.point } point
                                </div>
                                <div>
                                    안읽은 쪽지 : <a href="#" id="yet_noRead_msg">${msg }</a>개
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <!-- 마이페이지 상단메뉴 -->
                            <ul class="nav nav_my_page_ul nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="toMyPage" href="toMyPage">내 정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="toMyPage_writeList"  href="toMyPage_writeList">내 글목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="toMyPage_support" href="toMyPage_support">후원목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="toMyPage_cart" href="toMyPage_cart">장바구니</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="toMyPage_buyList" href="toMyPage_buyList">구매내역</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link my_page_nav" id="toMyPage_message" href="toMyPage_message">쪽지함</a>
                                </li>
                            </ul>