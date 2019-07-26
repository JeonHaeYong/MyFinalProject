<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap&subset=korean"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
#wrapper {
	margin-left: 20px;
	margin-top: 0px;
	margin-right: 20px;
	padding-bottom: 70px;
}

#title {
	font-size: 35px;
	text-align: center;
	margin-bottom: 30px;
	font-family: 'Gamja Flower', cursive;
}

#number {
	font-size: 19px;
	margin-bottom: 10px;
	font-family: 'Gamja Flower', cursive;
}

#inputwrapper, #text, #btn {
	box-sizing: border-box;
}

#authkey {
	width: 180px;
	height: 27px;
}

#check {
	font-family: 'Gamja Flower', cursive;
	width: 50px;
	height: 30px;
	background-color: rgba(242, 154, 90, 0.92);
	border: 0px;
}

#check:hover {
	background-color: rgba(230, 57, 91, 0.85);
}
</style>
</head>
<body>

	<fieldset>
		<legend id="title">이메일 인증 번호</legend>
		<div id="wrapper" align="center">

			<div id="number">해당 이메일에 전송된 인증번호를 입력해주세요.</div>
			<span> <input type="text" placeholder="인증번호입력" id="authkey">
				<input type="button" value="확인" id="check">
			</span>
		</div>

	</fieldset>

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
						opener.alert("인증이 완료되었습니다");
						
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