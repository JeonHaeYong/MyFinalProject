<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	                                        <div class="row border-bottom">
	                                            <div class="col-lg-2 col-5">게시판</div>
	                                            <div class="col-7">글 제목</div>
	                                            <div class="col-lg-3 d-lg-block d-none">글 쓴날짜</div>
	                                        </div>
	                                        <c:if test="${list.size()==0 }">
	                                        	<div style="height: 300px; line-height: 300px" class="text-center">작성한 글이 없습니다.</div>
	                                        </c:if>
	                                        
	                                        <c:if test="${list.size()!=0 }">
	                                        	<div style="min-height: 300px;">
		                                        	<c:forEach var="list" items="${list }">
		                                        		<c:if test="${list.type }=='재회후기'">
		                                        			<form action="toReviewDetail" method="post">
		                                        		</c:if>
		                                        		<c:if test="${list.type }=='무료나눔'">
		                                        			<form action="item" method="post">
		                                        		</c:if>
		                                        		<c:if test="${list.type }=='실종신고'">
		                                        			<form action="toReportContent" method="post">
		                                        		</c:if>
			                                        		<input type="hidden" value="${list.seq }" name="seq">
			                                        		<div class="row write_contents">
					                                            <div class="col-lg-2 col-5">${list.type }</div>
					                                            <div class="col-7 text-truncate">${list.title}</div>
					                                            <div class="col-lg-3 d-lg-block d-none">${list.formed_date }</div>
					                                       	</div>
			                                        	</form>
		                                        	</c:forEach>
		                                        </div>
	                                            <div class="row my-4">
	                                            	<div class="col-12 text-center">
	                                            		<c:forEach var="navi" items="${navi }">
	                                            			<a class="ml-1 navi boardList_navi" href="javascript:void(0)">${navi }</a>
	                                            		</c:forEach>
	                                            	</div>
	                                            </div>
	                                        </c:if>
                                    	</div>