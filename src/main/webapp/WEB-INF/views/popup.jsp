<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
	$(function(){
		$("#noPopup").on("change",function(){
			var exdate = new Date();
			if($("#noPopup").prop("checked")){
				exdate.setDate(exdate.getDate()+1);
				document.cookie = "noPopup=N;expires="+exdate.toGMTString();
				self.close();
			}
		})
	});
</script>
</head>
<body>
	<img src="/resources/images/index/popupImg.png" width="100%"><br>
	<input type="checkbox" id="noPopup">하루동안 보지 않기
</body>
</html>