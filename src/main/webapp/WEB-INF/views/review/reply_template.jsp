<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <div class="row reply_part">
            <!-- 댓글 목록 보여주기 -->
            <c:forEach var="list" items="${replyList }">
                <div class="col-12 border-bottom">
                    <div class="font-weight-bold">${list.writer }</div>
                    <div class="">${list.contents }</div>
                    <div class="d-flex justify-content-between">
                        <span>${list.formed_date }</span>
                        <span class="likeOk_check" value="${list.likeOk}" seq="${list.seq }" writer="${list.writer }">
                            <span class="mr-2 reply_likes">${list.likes }</span>
                            <a class="click_like_btn likeOk_n" href="javascript:void(0)" onclick="clickLikeImg(this);"><img src="review/like_1.png" style="width:25px;"></a>
                            <a class="click_like_btn likeOk_y" href="javascript:void(0)" onclick="clickLikeImg(this);"><img src="review/like_2.png" style="width:25px;"></a>
                        </span>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row reply_part">
            <c:if test="${reply_navi.size()!=0 }">
                <div class="col-12">
                    <ul class="pagination justify-content-center">
                        <c:forEach var="navi" items="${reply_navi }">
                            <li class="page-item reply_item" value="${navi }">
                                <a class="page-link text-decoration-none reply_navi" href="#toList" onclick="clickReplyNavi(this);">${navi }</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
        </div>