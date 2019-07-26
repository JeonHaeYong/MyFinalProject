<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i" rel="stylesheet">
<link rel="stylesheet" href="resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/style.css">

<style>

#container {
	margin-top: 5%;
}

.my_buttons{
font-family: 'Gamja Flower', cursive !important;
background-color:#FDD69270 !important;
color:#754F44;
border-radius: 25% !important;
}
.my_buttons:hover {
background-color:#FDD692 !important;
font-weight:bold;
}

</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->


	<section class="site-section bg-light block-13">

		<div id="container" class="container">
			
			<div class="row justify-content-center">
				
				<div class="col-4 col-md-12 col-lg-12 text-center my-3">
					
					<label>제목</label>
				
				</div>
				
				<div class="col-8 col-md-12 col-lg-12 text-center my-1">
					
					<input type="text" id="title_text" class="form-control" name="title" required>
				
				</div>
				
				<div class="col-12 col-md-12 col-lg-12 text-center my-3">
					
					<label>내용</label>
				
				</div>
				
				<div class="col-12 col-md-12 col-lg-12 my-1">
					
					<div id="summernote" contenteditable="true"></div>
				
				</div>
				
				<div class="col-12 col-md-12 col-lg-12 my-3 text-right">
					
					<input id="write_btn" class="btn my_buttons" type="button" value="작성 완료">
				
				</div>
				
			</div>

		</div>

	</section>


	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.countdown.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/aos.js"></script>
<script src="resources/js/jquery.fancybox.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/isotope.pkgd.min.js"></script>
<script src="resources/js/main.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>



<script>
	$(function()
    {
		$("#summernote").summernote
		({
			height : 400,
			minHeight : null,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR',
			dialogsInBody: true,
			callbacks :
			{
				onImageUpload : function(files, editor, welEditable)
				{
					for(var i = files.length - 1 ; i >= 0 ; i--)
					{
						sendFile(files[i], this);
					}
				}
			}
		});
		
		function sendFile(file, editor)
	    {
			var data = new FormData(); // <form></form>
			data.append("image", file); // <form><input type="file"></form>
			$.ajax
			({
				url : "notice-write-image",
				data : data,
				type : "POST",
				cache : false,
				contentType : false,
				enctype : "multipart/form-data",
				processData : false
			})
			.done(function(resp) 
			{
				$(".note-editable").append("<img src='"+resp+"'>");
			})
		    
	    }
		
		$("#title_text").val("${dto.title}");
		$(".note-editable").children("p").html(`${ dto.contents }`);
		
    });
    
    onload = function()
    {
		
    };
</script>
<c:if test="${dto != null}">
<script>



	$("#write_btn").on("click", function()
	{
		var form = $('<form></form>');
		form.attr('action', 'notice-update-do');
		form.attr('method', 'POST');
		form.appendTo('body');
	           	               		
		var text = $(".note-editable").html();
	           	    	
		if((text != "<br>") && ($("#title_text").val() != ""))
		{
			var seq = $('<input type="hidden" name="seq" value="${dto.seq}">');
			var title = $('<input type="hidden" name="title">');
			var contents = $('<input id="contents_hidden" type="hidden" name="contents">');
		           		    	
			form.append(seq).append(title).append(contents);
		           		   		
			title.val($("#title_text").val());
			contents.val(text);
		           		               			    
			form.submit();
		}
		else
		{
			alert("작성 내용을 확인하세요.");
		}
	});
</script>
</c:if>
<c:if test="${dto == null}">
<script>
	$("#write_btn").on("click", function()
	{
		var form = $('<form></form>');
		form.attr('action', 'notice-write-do');
		form.attr('method', 'POST');
		form.appendTo('body');
	           	               		
		var text = $(".note-editable").html();
	           	    	
		if((text != "<br>") && ($("#title_text").val() != ""))
		{
			var title = $('<input type="hidden" name="title">');
			var contents = $('<input type="hidden" id="contents_hidden" name="contents">');
		           		    	
			form.append(title).append(contents);
		           		   		
			title.val($("#title_text").val());
			contents.val(text);
		           		               			    
			form.submit();
		}
		else
		{
			alert("작성 내용을 확인하세요.");
		}
	});
</script>
</c:if>
</html>