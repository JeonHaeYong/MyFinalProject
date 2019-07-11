<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"
	rel="stylesheet">
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
	.myJumbo{
		background-color: white;
	}
	#jumboImg{
		width: 100%;
		max-height: 600px;
	}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	<div class="jumbotron myJumbo pr-0 pl-0 pb-2">
		<img src="/resources/images/item/addItemImage.jpg" id="jumboImg">
	</div>
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-12 input-group mb-3">
	 			<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">제 목</span>
				</div>
				<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			<div class="col-12 row input-group mb-3">
<!-- 				<div class="row d-flex justify-content-center"> -->
					<div class="col-4 custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile01">
						<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
					</div>
					<div class="col-4 custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile01">
						<label class="custom-file-label" for="inputGroupFile02">Choose file</label>
					</div>
					<div class="col-4 custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile01">
						<label class="custom-file-label" for="inputGroupFile03">Choose file</label>
					</div>
<!-- 				</div> -->
			</div>
			<div class="inputContents col-12 p-0">
				<input type="hidden" id="submitContents" name="contents">
				<div id="contents" class="summernote" contenteditable="true"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 d-flex justify-content-end">
				<a class="btn" href="addItemProc">신청</a>
				<a class="btn" href="">취소</a>
			</div>
		</div>
	</div>

	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	<script>
		$(".summernote").summernote({
			placeholder : 'write text here!',
			height : 310, // 기본 높이값
			minHeight : 310, // 최소 높이값(null은 제한 없음)
			maxHeight : null, // 최대 높이값(null은 제한 없음)
			focus : true, // 페이지가 열릴때 포커스를 지정함
			lang : 'ko-KR',
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				},
				onMediaDelete : function(target) {
					deleteFile(target[0].src);
				}
			}
		});
		function sendFile(file, editor) {
			var data = new FormData(); // <form></form>
			data.append("image", file); // <form><input type="file"></form>
			$.ajax({
				url : "imageUpload",
				data : data,
				type : "POST",
				cache : false,
				contentType : false,
				enctype : "multipart/form-data",
				processData : false
			}).done(function(resp) {
				$(".note-editable").append("<img src='"+resp+"'>");
			})
		}
		function deleteFile(src) {
			$.ajax({
				data : {
					imagePath : src
				},
				type : "POST",
				url : "deleteImage",
				cache : false
			});
		}
	</script>
</body>
</html>