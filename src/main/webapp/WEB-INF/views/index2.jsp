<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/module/linkCdn.jsp"></jsp:include>
<script>
	$(function(){
		$("#oxQuizBtn").on("click", function(){
			location.href = "oxQuiz";
		});
	});
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	<div id="wrapper">
		<h1>Mini Game Home</h1>
		<input type="button" id="oxQuizBtn" value="OX상식퀴즈">
	</div>

 	
<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
 	
 <jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
 <jsp:include page="/WEB-INF/views/module/scriptCdn.jsp"></jsp:include>
</body>
</html>