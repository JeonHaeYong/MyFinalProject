<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
							<div class="row reply_part font_11rem">
                                <!-- 댓글 목록 보여주기 -->
                                <c:forEach var="list" items="${replyList }">
                                    <div class="col-12 border-bottom mb-1">
                                        <div class="firstLine d-flex justify-content-between">
                                            <div class="font-weight-bold"><span class="mr-2"><img src="${list.imagepath }" class="profileImg_round rounded-circle" style="width: 50px ; height: 50px;"></span>${list.writer }</div>
                                            <c:if test="${id==list.writer }">
                                                <div class="modifyReply_part">
                                                    <a class="mx-1" href="javascript:void(0)" onclick="modifyReplyToggle(this)"><img src="review/edit.png" style="width: 20px; height: 20px;"></a>
                                                    <a class="mx-1" href="javascript:void(0)" onclick="deleteReply(this)" value="${list.seq }"><img src="review/cancel.png" style="width: 20px; height: 20px;"></a>
                                                </div>
                                                <div class="modifyReply_part hide">
                                                    <a role="btn" class="laon_btn_style btn p-1" href="javascript:void(0)" onclick="modifyReply(this);" value="${list.seq }">완료</a>
                                                    <a role="btn" class="laon_btn_style btn p-1" href="javascript:void(0)" onclick="formReset(this)" value="${list.contents }">취소</a>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div>
                                        	<span>${list.formed_date }</span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span><input type="text" readonly class="form-control-plaintext reply_contents" value="${list.contents }" style="width: 600px;"></span>
                                            <span class="likeOk_check" value="${list.likeOk}" seq="${list.seq }" writer="${list.writer }">
                                                <span class="mr-2 reply_likes">${list.likes }</span>
                                                <a class="click_like_btn likeOk_n" href="javascript:void(0)" onclick="clickLikeImg(this);"><img src="review/like_1.png" style="width:25px;"></a>
                                                <a class="click_like_btn likeOk_y" href="javascript:void(0)" onclick="clickLikeImg(this);"><img src="review/like_2.png" style="width:25px;"></a>
                                            </span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row reply_part my-4">
                                <c:if test="${reply_navi.size()!=0 }">
                                    <div class="col-12 text-center">
										<c:forEach var="navi" items="${reply_navi }">
                                        	<c:choose>
                                        		<c:when test="${currentPage==navi }">
                                        			<a class="ml-1 navi active reply_navi" href="#toList" onclick="clickReplyNavi(this);">${navi }</a>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<a class="ml-1 navi reply_navi" href="#toList" onclick="clickReplyNavi(this);">${navi }</a>
                                        		</c:otherwise>
                                        	</c:choose>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>