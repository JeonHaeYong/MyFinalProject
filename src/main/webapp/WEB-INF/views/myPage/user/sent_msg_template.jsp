<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <form class="sentList_part" id="sentMsg_delete_form" action="deleteMsg" method="post">
                                            <c:forEach var="s_list" items="${sentList }" varStatus="status">
                                            <!-- 보낸쪽지함 내용들 -->
                                                <div class="row s_list_row">
                                                    <div class="col-1">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input sent_check" id="s_${status.count }" name="msgSeq" value="${s_list.seq }">
                                                            <label class="custom-control-label" for="s_${status.count }"></label>
                                                        </div> 
                                                    </div>
                                                    <div class="col-2 text-truncate">${s_list.recipient }</div>
                                                    <div class="col-5 s_click_parent text-truncate">
                                                    	<a class="sent_msg_click text-decoration-none" href="javascript:void(0)"  seq="${s_list.seq }" data-toggle="modal" data-target="#s_msg_modal" value="${s_list.recipient }">${s_list.contents }</a>
                                                    </div>
                                                    <div class="col-lg-3 col-4">${s_list.message_date }</div>
                                                    <div class="col-lg-1 d-none d-lg-block s_readOk text-center">${s_list.readOk }</div>
                                                </div>
                                                <!-- //보낸쪽지함 내용들 -->
                                            </c:forEach>
                                           	</form>
                                            <!-- 보낸쪽지 네비게이터 띄워주기 -->
                                            <div class="row sentList_part my-4">
                                            	<div class="col-12 text-center">
                                            		<c:forEach var="navi" items="${sentNavi }">
															<a class="ml-1 navi navi_click_a" href="javascript:void(0)"  value="sender">${navi }</a>
                                            		</c:forEach>
                                            	</div>
                                            </div>
                                            <!-- /보낸쪽지 네비게이터-->