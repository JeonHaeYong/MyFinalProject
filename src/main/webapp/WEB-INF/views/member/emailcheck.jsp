<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

   <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

<input type="text" placeholder="인증번호입력" id="authkey">
<input type="button" value="확인" id="check">

	<script>
		$("#check").on("click",function(){
			console.log($("#authkey").val());	
			$.ajax({
					url : " authkey.do",
					type : "post",
					data : {
						key :$("#authkey").val()
					 },
					 dataType:"json"
				}).done(function(resp) {
					if(resp==true)
						{
						opener.$("#email").prop("flag","true");
						window.close();
						}
					else{
						alert("인증번호가 잘못되었습니다 이메일 인증을 다시 작성하시오");
						opener.document.getElementById("email").value = "";
						window.close();
						
					}
				
				});

			
		});			
	</script>

</body>
</html>