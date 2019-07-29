<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>OX 상식 퀴즈</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
<!--  font-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"
	rel="stylesheet">
<!-- template -->
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

<!-- summernote-->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<!--  로그인 style-->
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>


<style>
.jumbotron {
	background-color: white;	padding: 5rem;
}

.jumbotron>img {
	width: 100%;
	height: 600px;
}

#title {
	width: 100%;
	text-align: center;
	margin: auto;
	margin-bottom: 50px;
}

h3, h1 {
	font-family: 'Gamja Flower', cursive;
}

.container {
	border: 0px solid black;
	min-width: 400px;
	box-sizing: border-box;
	text-align: center;
	
}

.info-box {
	padding: 10px;
	text-align: center;
	margin: 0px;
	margin-top: 15px;
	padding: 0px;
}

.menu-box {
	width: 150px;
	height: 100px;
	color: #754F44;
	font-family: 'Gamja Flower', cursive;
	font-size: 22px;
	margin-top: 50px;
}

.menu-box>div {
	height: 35px;
}

.menu-box>div:first-child {
	font-weight: bold;
	border-bottom: 1px solid #754F44;
	line-height: 33px;
	color: #B45F04;
	font-size: 40px;
}

.menu-box>div:not (.s-menu ):hover {
	background-color: #FBFFB950;
}

.menu-row {
	text-align: -webkit-center;
}

a[name="s-menu"] {
	color: #754F44;
	text-decoration-line: none;
}

a[name="s-menu"]:hover {
	color: #754F44;
	text-decoration-line: none;
	font-weight: bold;
}

/* -------------------infobox -----------------   */
.infowrapper {
	box-sizing: border-box;
	height: 300px;
	overflow: hidden;
	border: 1px solid black;
}

.infoimg, .infotext {
	border-bottom: 1px solid black;
	height: 150px;
}

/*---------------summernote and btn-----------------------  */
#smNote {
	text-align: left;
}

#infowritebtn, #tomainboard {
	font-family: 'Gamja Flower', cursive;
	background-color: #FDD69270;
	color: #754F44;
}

#infowritebtn:hover, #tomainboard:hover {
	background-color: #FDD692;
	font-weight: bold;
}
</style>


</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron px-0 pb-0">
		<img src="/resources/images/dog_7.png">
	</div>
	<!--  body부분-->
	<div id="title">
		<h1>유용한 정보</h1>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
				<div class="row menu-box">
					   <div class="col-12 s-menu">M E N U</div>
                        <div class="col-12 "><a name="s-menu" href="oxQuiz">OX QUIZ</a></div>
                          <div class="col-12"><a name="s-menu" href="information_t?currentPage=1">반려동물 정보</a></div>
                            <c:choose>
                        	<c:when test="${type == 4}">
                        		<div class="col-12"><a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a></div> <!-- 관리자만 볼 수 있게! -->
                        	</c:when>
                        	<c:otherwise>
                        		 <div class="col-12" hidden><a name="s-menu" href="quizAdmin.admin?currentPage=1">관리자 설정</a></div> 
                        	</c:otherwise>
                        </c:choose> 
				</div>
			</div>
			<div class="col-1"></div>
			<div class="col-lg-9 col-md-8 col-sm-12 col-12 info-box mt-5">
				<!--summernote body   -->

				<form id="writeForm" action="writeformproc" method="post">
					<textarea name="contents" style="display: none"></textarea>

					<div class="container">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12" align="left">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">Options</label>
									</div>
									<input type="hidden" name=type id="type"> <select
										class="custom-select" id="inputGroupSelect01">
										<option selected>카테고리</option>
										<option value="info">정보</option>
										<option value="training">훈련</option>

									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="input-group col-lg-12 col-md-12 col-sm-12 mb-2 ">

								<div class="input-group-prepend">
									<span class="input-group-text">제목</span>

								</div>
								<input id="inputtitle" name="title" type="text"
									class="form-control" placeholder="제목을 입력하세요" maxlength="20">

							</div>
						</div>
						<div class="row">

							<div class="col-lg-12 col-md-12 d-md-block d-none">
								<div id="smContents"></div>
							</div>

							<div id="smNote" class="col-lg-12 col-md-12 col-sm-12">
								<div id="summernote"></div>
							</div>
						</div>
						<div class="row m-5">
							<div class="col-lg-12 col-md-12 col-sm-12 mt-2">
								<button id="infowritebtn" class="btn" type="button">작성완료</button>
								<button id="tomainboard" class="btn" type="button">글목록으로</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
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

	<!--  summernote script-->

<script>
		//파일 업로드        
		function sendFile(files, editor) {
			var data = new FormData(document.getElementById("writeForm"));
			data.append("files", files);
			$.ajax({
				data : data,
				type : "post",
				url : "fileajax",
				cache : false,
				contentType : false,
				processData : false,
				enctype : "multipart/form-data",
			}).done(
					function(resp) {

						$(".note-editable").append(
								"<img src='" + resp
										+ "' width='100%' height='100%'' >");
					})
		}

	
			//이전으로 버튼 
			document.getElementById("tomainboard").onclick = function() {
				location.href = "information_t?currentPage=1";
			
			}
			//작성 완료 보튼 
			document.getElementById("infowritebtn").onclick = function() {
				
				//제목을 입력하지 않았을 경우     
				var inputtitle = $("#inputtitle");
				if (inputtitle.val() == "") {
					alert("제목을 입력해주세요.");
					inputtitle.focus();
					return					
					}
				
				$("#type").attr("value",$("#inputGroupSelect01").val());
						
				if($("#inputGroupSelect01").val() =="카테고리") {
					
					alert("카테고리를 지정해주세요");
					$("#inputGroupSelect01").focus();
					return
				}
				//summernote가 비어있을 경우 
			 if ($('#summernote').summernote('isEmpty')) {
					alert('내용을 입력해주세요.');		return				
				}
				//summernote 작성이 완료된경우 
				$('textarea[name="contents"]').val(
						$('#summernote').summernote('code'));
				
				document.getElementById("writeForm").submit();
				
				}
			$('#summernote').summernote({
				placeholder : '내용을 입력해주세요.',
				tabsize : 2,
				height : 500,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[0], this);
						}
					}
				}
			});
		
	</script>

</body>
</html>