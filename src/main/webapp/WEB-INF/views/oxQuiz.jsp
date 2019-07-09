<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>OX 상식 퀴즈</title>
<style>
	#wrapper{
		width: 70%;
		min-width: 400px;
		margin: auto;
		text-align: center;
	}
	#title{
		width: 100%;
		height: 10%;
	}
	#quizBox{
		width: 100%;
		height: 90%;
		border: 2px solid black;
		padding: 10px;
	}
	.btnImage{
		width: 40%;
		min-width: 150px;
		min-height: 150px;
		display: inline-block;
		cursor: pointer;
	}
	.btnImage img{
		width: 100%;
		height: 100%;
	}
	.quiz{
		display: none;
	}
	#quiz1{
		display: block;
	}
</style>
<script>
	$(function(){
		var quizNum = 1;
		var corr = new Array();
		var index = 0;
		$(".btnImage").on("click", function(){
			corr[index] = $(this).attr("ox");
			index++;
			$("#quiz" + quizNum).css("display", "none");
			quizNum++;
			$("#quiz" + quizNum).css("display", "block");
			if(index == 10){
				alert(corr);
				$("#quizBox").html("");
				$.ajax({
					url: "answerCheck",
					method: "post",
					traditional: true,
					dataType: "json",
					data: {
						corr: corr
					}
				}).done(function(resp){
					// resp에는 맞힌 문제 번호(answer), 총 획득 포인트(point)!!
					alert(resp.answer);
					alert(resp.answer.length);	// 맞힌 문제 개수
					alert(resp.point);
				});
			}
			
		});
	})
</script>
</head>
<body>
	<div id="wrapper">
		<div id="title"><h1>OX 상식 퀴즈</h1></div>
		<div id="quizBox">
			<c:forEach var="dto" items="${sessionScope.list }" varStatus="status">
				<div class="quiz" id="quiz${status.index+1 }">
					<h3>Q${status.index+1}. ${dto.quiz }</h3>
					<hr>
				</div>
			</c:forEach>
			<div id="choose">
				<div class="btnImage" ox="o"><img src="/resources/images/oImage.png"></div>
				<div class="btnImage" ox="x"><img src="/resources/images/xImage.png"></div>
			</div>
		</div>
	</div>
</body>
</html>