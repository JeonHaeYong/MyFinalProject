<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row reply_part">
                                <!-- 댓글 목록 보여주기 -->
                                <c:forEach var="list" items="${replyList }">
                                    <div class="col-12 border-bottom mb-1">
                                        <div class="firstLine d-flex justify-content-between">
                                            <div class="font-weight-bold"><span class="mr-2"><img src="${list.imagepath }" class="profileImg_round rounded-circle" style="width: 50px ; height: 50px;"></span>${list.writer }</div>
                                            <c:if test="${id==list.writer }">
                                                <div class="modifyReply_part">
                                                    <a href="javascript:void(0)" onclick="modifyReplyToggle(this)"><img src="review/edit.png" style="width: 20px; height: 20px;"></a>
                                                    <a href="javascript:void(0)" onclick="deleteReply(this)" value="${list.seq }"><img src="review/cancel.png" style="width: 20px; height: 20px;"></a>
                                                </div>
                                                <div class="modifyReply_part hide">
                                                    <a role="btn" class="btn btn-outline-warning rounded p-1" href="javascript:void(0)" onclick="modifyReply(this);" value="${list.seq }">완료</a>
                                                    <a role="btn" class="btn btn-outline-warning rounded p-1" href="javascript:void(0)" onclick="formReset(this)" value="${list.contents }">취소</a>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div>
                                        	<span>${list.formed_date }</span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span><input type="text" readonly class="form-control-plaintext reply_contents" value="${list.contents }" style="width: 600px;"></span>
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