<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <div class="jumbotron px-0 pb-0">
        <img src="/mypage/dog_1.jpg">
    </div>
    <section id="wrapper" class="mb-5">
        <div class="container">
            <div class="row">
                <div class="col-3 p-2">
                    <div class="my_page_empty invisible">
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="pill" aria-controls="pills-home" aria-selected="true">Home</a>
                            </li>
                        </ul>
                    </div>
                    <div class="my_page_info">
                        <div class="img_wrapper position-relative">
                        	<img id="tabImg" class="position-absolute" src="/profile/tab.png" style="width: 50px; height: 50px; top:-10% ; right : 80%; ">
                        	<div style="font-size: 19px;">이미지 클릭!</div>
                            <a class="img_anchor" href="javascript:void(0)" onclick="changeProfileImg();"><img src="${memberDTO.imagepath }" class="profileImg_round rounded-circle" style="width: 180px; height: 180px;"></a>
                        </div>
                        <div>
                            ${memberDTO.name }님                                
                        </div>
                        <div>
                            현재포인트
                        </div>
                        <div>
                            ${memberDTO.point } point
                        </div>
                        <div>
                            안읽은 쪽지 : <a href="toMyPage_message" id="yet_noRead_msg">${msg }</a>개
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary d-none change_profileImg_mdBtn" data-toggle="modal" data-target="#change_profileImg_md">
                        change_profileImg_mdBtn
                    </button>
                    <!-- Modal -->
                    <div class="modal fade ft_gamja" id="change_profileImg_md" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h2 class="modal-title" id="change_img_title">프로필 사진 변경</h2>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- 파일 업로드 -->
                                    <form id="changeProfileImg_form" action="changeProfileImg" method="post" enctype="multipart/form-data">
	                                    <div class="form-group profile_upload_part">
	                                    	<h4 class="font-weight-bold">기본 아이콘 선택</h4>
	                                    	<div>
	                                    		<c:forEach var="i" begin="1" end="16" step="1">
	                                    			<a href="javascript:void(0)" onclick="defaultImgClick(this);"><img src="/profile/${i }.png" style="width: 50px; height: 50px;"></a>
	                                    		</c:forEach>
	                                    	</div>
	                                    	<hr>
	                                    	<h4 class="font-weight-bold">내 사진 업로드</h4>
	                                        <div class="filebox preview-image">
	                                            <input class="upload-name text-truncate" value="파일선택" disabled="disabled">
	                                            <label for="input-file">업로드</label> 
	                                            <input type="file" id="input-file" class="upload-hidden" name="image">
	                                        </div>
	                                    </div>
                                    <!-- /파일 업로드 -->
                                    <!-- 이미지변경 -->
                                    <div class="justify-content-around profile_upload_part hide my-5">
                                        <div class="d-flex">
                                            <div>변경전</div>
                                            <img src="${memberDTO.imagepath }" class="profileImg_round rounded-circle" style="width: 120px; height: 120px;">
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <img src="/mypage/right-arrow.png" class="profileImg_round rounded-circle" style="width: 80px; height: 80px;">
                                        </div>
                                        <div class="d-flex changeAfterImg">
                                            <div>변경후</div>
                                            <img src="" class="upload-display">
                                        </div>
                                    </div>
                                    <input type="hidden" value="${memberDTO.id }" name="id">
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="mx-1 btn btn-secondary" data-dismiss="modal">닫기</button>
                                    <button type="button" class="mx-1 btn btn-primary changeImg_btn">변경하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Modal -->
                </div>
                <div class="col-9">
                    <!-- 마이페이지 상단메뉴 -->
                    <ul class="nav nav_my_page_ul nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link my_page_nav" id="toMyPage" href="toMyPage">내 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link my_page_nav" id="toMyPage_writeList"  href="toMyPage_writeList">내 글목록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link my_page_nav" id="toMyPage_support" href="toMyPage_support">후원내역</a>
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