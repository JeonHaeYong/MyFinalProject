<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<div class="row">
			        	<div id="title" class="col-12"><h1>나는 얼마나 잘 알고 있을까??</h1></div>
            		</div>
		<c:choose>
			<c:when test="${incorrCount == 0}">
				<div class="row">
					<div class="col-12 getPoint">획득 포인트: ${getPoint }점</div>
					<div class="col-12 perfect">다 맞췃어요~!!</div>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 맞힌문제 개수 / 획득 포인트 -->
		
		<div class="row">
			<div class="col-6 corrCount">맞은 개수 : ${answer }개</div><div class="col-6 getPoint">획득 포인트: ${getPoint }점</div>
		</div>
		<!-- 틀린문제 / 해설 -->
		
		<div class="col-12 incorrCount">틀린문제들~</div>
		<div class="row header">
			<div class="col-5">문제</div>
			<div class="col-2">정답</div>
			<div class="col-5">설명</div>
		</div>
		<c:forEach var="wrongL" items="${wrongList }">
		<div class="row wrong ">
		    <div class='col-5 wrong-q my-auto'>${wrongL.quiz }</div>
		    <div class='col-2 answer my-auto'>${wrongL.correct }</div>
            <div class='col-5 ex'>${wrongL.explain }</div>
		</div>
		</c:forEach>
			</c:otherwise>	
		</c:choose>
		
	
		<!--랭킹  -->
		<div class='row header'>
			<div class='col-4'>RANK</div>
			<div class='col-4'>ID</div>
			<div class='col-4'>POINT</div>
		</div>
		<c:forEach var="rankL" items="${rankList }" >
			<div class='row section'>
				<div class='col-4 rank my-auto'>${rankL.rank }</div>
				<div class='col-4 id my-auto'>${rankL.id }</div>
				<div class='col-4 point my-auto'>${rankL.point }</div>
			</div>
			</c:forEach>
		<!-- 재시작 버튼 -->
		<div class='row footer'>
			<div class='col-12'>
				<input type="button" id='restart-btn' class="btn" value="R E S T A R T"><!-- <img alt='' src='/resources/images/restart-btn.png' id='restart-btn'> -->
			</div>
		</div>

