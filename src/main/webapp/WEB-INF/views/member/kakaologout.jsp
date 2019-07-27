<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
    <style>
        
    </style>
    
    <script src="https://code.jquery.com/jquery-3.4.0.min.js">
    </script>    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <script>
       
        $(function()
        {
           Kakao.init('158c89adb3b9e4e64ef9002fd15b6f66');
        window.opener.location.href = "https://developers.kakao.com/logout";

         setInterval
         (
            Kakao.Auth.getStatus(function(statusObj)
            {
               console.log("실행");
               if(statusObj.status == "not_connected")
               {
                  opener.close();
                  self.close();
               }
            })//수정했음         
         ,300);
         window.opener.location.href="/";
        });
        
        onload = function()
        {
              
        };
    </script>
    
    
</head>
</head>
<body>

</body>
</html>