<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
</head>
<body>
<c:choose>

	<c:when test="${type == 'fail'}">
		
		<script>
			
			alert("로그인 실패하셨습니다. 아이디와 비밀번호 확인 후 다시 입력바랍니다");
			document.location.href="/"
			
		</script>
		
	</c:when>
	
	<c:when test="${type == 'black'}">
		
		<script>
			
			alert("블랙리스트에 등록된 아이디입니다.\n로그인 실패");
			document.location.href="/"
			
		</script>
		
	</c:when>
	
</c:choose>

</body>
</html>