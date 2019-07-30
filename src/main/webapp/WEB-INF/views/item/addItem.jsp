<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나눔 신청</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
<style>
	body{
		font-family: 'Gamja Flower' !important;
	}
	::placeholder{
		font-family: 'Gamja Flower';
	}
	.myJumbo{
		background-color: white !important;
		padding: 5rem !important;
	}
	#jumboImg{
		width: 100%;
		height: 100%;
		max-height: 600px;
	}
	#writeBtn, #cancelBtn{font-family: 'Gamja Flower', cursive; font-size: 22px; background-color:#FDD69270; color:#754F44; border-radius: 25px;}
	#writeBtn:hover, #cancelBtn:hover{background-color:#FDD692; font-weight:bold;}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

	<div class="jumbotron myJumbo pr-0 pl-0 pb-2">
		<img src="/resources/images/item/addItemImage.jpg" id="jumboImg">
	</div>
	<div class="container">
		<form id="itemForm" action="addItemProc" method="post" enctype="multipart/form-data">
			<div class="row d-flex justify-content-center">
				<div class="col-12 input-group mb-3">
		 			<div class="input-group-prepend">
						<span class="input-group-text">상품명</span>
					</div>
					<input type="text" class="form-control" name="name" id="name" placeholder="상품 이름을 입력해주세요">
					<div class="input-group-append">
					    <span class="input-group-text byteCheck">0/30</span>
					</div>
				</div>
				<div class="col-md-7 col-12 input-group mb-3">
		 			<div class="input-group-prepend">
						<span class="input-group-text">금액</span>
					</div>
					<input type="number" class="form-control" name="price" id="price" min="0" max="100000" placeholder="금액은 이 달의 후원단체로 보내집니다!">
				</div>
				<div class="col-md-5 col-12">
					<div class=" input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text">카테고리</label>
						</div>
						<select class="custom-select" id="selectCategory" name="category">
							<option selected value="none">선택안함</option>
							<option value="food">사료&amp;간식</option>
							<option value="toy">장난감</option>
							<option value="clothing">의류</option>
							<option value="etc">기타</option>
						</select>
					</div>
				</div>
				<div class="col-12 row input-group mb-3">
					<div class="col-4 custom-file">
						<input type="file" class="custom-file-input inputFile" id="image1" name="image1" labelId="imagePath1" accept=".jpg,.jpeg,.png,.gif,.bmp">
						<label class="custom-file-label overflow-hidden" id="imagePath1">Choose file</label>
					</div>
					<div class="col-4 custom-file">
						<input type="file" class="custom-file-input inputFile" name="image2" id="image2" labelId="imagePath2" accept=".jpg,.jpeg,.png,.gif,.bmp" disabled>
						<label class="custom-file-label overflow-hidden" id="imagePath2">Choose file</label>
					</div>
					<div class="col-4 custom-file">
						<input type="file" class="custom-file-input inputFile" name="image3" id="image3" labelId="imagePath3" accept=".jpg,.jpeg,.png,.gif,.bmp" disabled>
						<label class="custom-file-label overflow-hidden" id="imagePath3">Choose file</label>
					</div>
				</div>
				<div class="inputContents col-12 p-0">
					<input type="hidden" id="submitContents" name="contents">
					<div id="contents" class="summernote"></div>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-12 d-flex justify-content-end mt-3 mb-3">
				<input type="button" class="btn myBtn mx-2" id="writeBtn" value="신청">
				<input type="button" class="btn myBtn mx-2" id="cancelBtn" value="취소">
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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->
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
		
		$("#name").on("input", function(e){
			name = $("#name").val();
			if(name.length > 30){
				alert("글자수를 초과하였습니다.");
				name = name.substring(0, 30);
				$("#name").val(name);
			}
			$(".byteCheck").text(name.length + "/30");
		});
		
		$(".inputFile").change(function(){
			var label = "#" + $(this).attr("labelId");
			$(label).text(this.value.split("\\").pop());
			if(label == "#imagePath1"){
				$("#image2").attr("disabled", false);
			}else if(label == "#imagePath2"){
				$("#image3").attr("disabled", false);
			}
		});
		
		$("#writeBtn").on("click", function(){
			$("#submitContents").val($(".note-editable").html());
			var name = $("#name").val();
			name = name.replace(/<.?script>/g, "/");
			
			var price = $("#price").val();
			var regex = /^[0-9]{1,6}$/
			var regexPrice = parseInt(regex.exec(price));
			
			var category = $("#selectCategory option:selected").val();
			
			var image1 = $("#image1").val();
			
			var contents = $("#submitContents").val();
			contents = contents.replace(/<.?script>/g, "/");
			contents = contents.replace(/(&nbsp;)+/ig, "");
			contents = contents.replace(/^[ ]+/ig, "");	// &nbsp;자르고나서 또 맨앞에 오는 공백 자르기
			contents = contents.replace(/(<p><br><\/p><p><br><\/p>)+/ig, "<p><br><\/p>");// 내용없이 엔터쳤을때
			contents = contents.replace(/(<p>[ ]*?<\/p>)/ig, "<p><br><\/p>");// 공백만 넣고 엔터쳤을때
			
			if($("#name").val() == "" || $("#name").val().length > 30){
				alert("상품명을 30자 이내로 입력해주세요.");
				$("#name").focus();
				return;
			}else if(price == "" || regexPrice > 100000 || regexPrice < 0 || isNaN(regexPrice)){
				alert("금액을 100,000원 이하 숫자로 입력해주세요.");
				$("#price").val("").focus();
				return;
			}else if(category == "none" || category == ""){
				alert("카테고리를 선택해주세요.");
				return;
			}else if(image1 == ""){
				alert("이미지를 등록해주세요.");
				return;
			}else if(contents == "<p><br></p>"){
				alert("내용을 입력해주세요.");
				$("#contents").focus();
				return;
			}
			$("#itemForm").submit();
		});
		$("#cancelBtn").on("click", function(){
			if(confirm("입력하신 내용이 모두 사라집니다. 그래도 취소하시겠습니까?")){
				location.href = "freeMarket?currentPage=1&category=all";
			}
			return false;
		});
	</script>
</body>
</html>