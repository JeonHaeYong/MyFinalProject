<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                                            <form class="receivedList_part" id="receivedMsg_delete_form" action="deleteMsg" method="post">
                                            <!-- 받은쪽지함 내용들 -->
                                            <c:forEach var="r_list" items="${receivedList }" varStatus="status">
                                                <div class="row r_list_row">
                                                    <div class="col-1">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input received_check" id="r_${status.count }" name="msgSeq" value="${r_list.seq }">
                                                            <label class="custom-control-label" for="r_${status.count }"></label>
                                                        </div> 
                                                    </div>
                                                    <div class="col-2 text-truncate">${r_list.sender }</div>
                                                    <div class="col-5 r_click_parent text-truncate">
                                                    	<c:if test="${r_list.readOk =='N'}">
                                                    		<a class="received_msg_click text-decoration-none" href="javascript:void(0)"  seq="${r_list.seq }" data-toggle="modal" data-target="#received_msg_modal" value="${r_list.sender }">${r_list.contents }</a>
                                                    	</c:if>
                                                    	<c:if test="${r_list.readOk =='Y'}">
                                                    		<a class="received_msg_click text-decoration-none readMsg" href="javascript:void(0)"  seq="${r_list.seq }" data-toggle="modal" data-target="#received_msg_modal" value="${r_list.sender }">${r_list.contents }</a>
                                                    	</c:if>
                                                    </div>
                                                    <div class="col-lg-3 col-4">${r_list.message_date }</div>
                                                    <div class="col-lg-1 d-none d-lg-block r_readOk text-center">${r_list.readOk }</div>
                                                </div>
                                            </c:forEach>
                                            <!-- 받은쪽지함 내용들 -->
                                            </form>
                                            <!-- 받은쪽지 네비게이터 띄워주기 -->
                                            <div class="row receivedList_part my-4">
                                            	<div class="col-12 text-center">
                                            		<c:forEach var="navi" items="${receivedNavi }">
															<a class="ml-1 navi navi_click_a" href="javascript:void(0)"  value="recipient">${navi }</a>
                                            		</c:forEach>
                                            	</div>
                                            </div><!-- /받은쪽지 네비게이터-->