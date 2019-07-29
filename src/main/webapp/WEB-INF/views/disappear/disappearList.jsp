<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"rel="stylesheet">
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
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
<style>
	
	
	/*점보트론  */
	.myJumbo {
	background-color: white;
	padding: 5rem;
}

#jumboImg {
	width: 100%;
	max-height: 600px;
}
#disappear_link
		{
			color: #EC7357 !important;
			font-weight: 600 !important;
		}	
	.empty{width: 100%; text-align: center; margin: auto; margin-bottom: 50px; height:50px;}
  #title{text-align: center;}
  h1{ font-family: 'Gamja Flower', cursive;}
    .disappearList{width: 80%; margin: auto;}
.infowrapper {
font-family: 'Gamja Flower', cursive;
	box-sizing: border-box;
	height:500px;
	overflow: hidden;
	border: 2px solid #754F4470;
}

.dtocol {
	padding-top: 50px;
}

.infoimg, .animal-kind,.infoextra {

	
overflow: hidden;

}
.infoimg{
margin-left:15px;
margin-top:15px;
margin-right:15px;
box-sizing: border-box;
height:60%;
}

.animal-kind{

font-size:18px;
text-align:left;
margin-left:15px;
margin-right:15px;
padding-left:5px;
height:10%;
margin-top:2px;
}
.animal-feature{width:70%; font-size:25px; color:#754F44; font-weight:bold; margin-left:15px; overflow:hidden; text-overflow:ellipsis; white-space: nowrap;}
.w-100 {
width:100%;
	top: 0;
	left: 0;
height: 350px;
}
.animal-kind>img{margin-left:5px;}
.writer{padding-left:20px;}
.writer,.writeDate{width:50%;  float:left; font-size:25px;}
/* .writeInfo>div{float: left; height:15%;} */
.petInfo>div{float: left; heigth:15%; margin-left:15px; font-size:23px;}


.footer{text-align:right; margin-right:170px; margin-bottom: 30px;}




.btns{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44; border-radius:30px; border:none; font-size:25px;}
.btns:hover{background-color:#FDD692; font-weight:bold;}



.navi-section{text-align: center; margin-top:20px; font-family: 'Gamja Flower', cursive; font-size:25px;}
.navi-btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44; border:none; border-radius:50px; margin-left:5px; width:60px;}
.navi-btn:hover{background-color:#FDD692; font-weight:bold;}
.furColor{overflow:hidden; text-overflow:ellipsis; white-space;nowrop;}
#menu-disappear{color:#EC7357;}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" id="home-section">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
	<div class="jumbotron myJumbo pr-0 pl-0 pb-2">
		<img src="resources/images/disappear/disapperjumbo.jpg" id="jumboImg">

	</div>
	
	<div class="px-0 pb-0 empty"></div>
	<div id="title"><h1>잠시 길 잃은 동물들</h1></div>
	<div class="containier ">
	<form action="selectDeleteDisappearReport" id="listForm" method="get">
		<div class="row disappearList"><!--ajax 여기에 어팬드  -->
		
		   <c:forEach var="list" items="${list }"> 
			<div class="col-lg-4 col-md-6 col-sm-6 dtocol">
				<c:if test="${type == 4 }">
					<input type="checkbox" value="${list.seq }" name="check">
				</c:if>
				<div class="infowrapper">
						<div class="infoimg">
							
								<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
									<div class="carousel-inner">
									
										<div class="carousel-item active">
											<a href="toReportContent?seq=${list.seq }">	<img src="${list.image1 }" class="d-block w-100"></a>
										</div>
										<div class="carousel-item">
											<a href="toReportContent?seq=${list.seq }">	<img src="${list.image2 }" class="d-block w-100"></a>
										</div>
										<div class="carousel-item">
											<a href="toReportContent?seq=${list.seq }">	<img src="${list.image3 }" class="d-block w-100"></a>
										</div> 
									</div>
								</div>
						</div>
				
                   <div class="animal-kind">${list.kind }<img src=""></div>
                   <div class="animal-feature">${list.feature }</div>
                    <div class="petInfo">
                    	<div>${list.gender} </div>
                    	<div>${list.age }</div>
                    	<div class="furColor">${list.furColor }</div>
                    </div><br><br>
                  <!--   <div class="writeInfo"> -->
                    	<div class="writer">${list.writer }</div>
                    	<div class="writeDate">${list.writeDate }</div>
                    	<!-- </div>  -->
             
				</div>
			</div>
			  </c:forEach> 
			  
			
			
		</div>
		<div class="row navi-section">
			<div class="col-12">${navi }</div>
		</div>
		<div class="row mt-5 footer" align="right">
			<div class="col-12">
				<c:if test="${type == 4 }">
					<input type="button" value="선택삭제" class="select-delete-btn btns">
					</c:if>
					<input type="button" value="글쓰기" class="write-btn btns">
			</div>
		</div>
		</form>
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
	<script>
		$(".write-btn").on("click",function(){
			location.href="toReportForm";
		});
		$(".pageNum").each(function(index,items){
			if($(this).text() == ${currentPage}){
				$(this).css("color","#FDD692");
				$(this).css("font-weight","bold");
			}
		})
		$(".carousel-item img").each(function(index,items){
			if($(this).attr("src") =='noImage'){
				 $(this).parent().parent().remove();
				 $(this).parent().remove();
				 $(this).remove();
			}
		});
		$(".animal-kind").each(function(index,items){
			if($(this).text()=="개"){
				$(this).children("img").attr("src","/resources/images/disappear/dog_02.png");
			}else if($(this).text()=="고양이"){
				$(this).children("img").attr("src","/resources/images/disappear/cat_01.png");

			}else if($(this).text()=="기타동물"){
				$(this).children("img").attr("src","/resources/images/disappear/rabbit_02.png");

			}
		});
		$(".pageNum").each(function(index,items){ // 네비버튼 클릭하면 ajax로 정보 가져오기
			$(this).on("click",function(){
				var currentPage = $(this).val();
				$.ajax({
					url:"list_ajax",
					data:{currentPageStr:currentPage},
					type:"get"
				}).done(function(resp){
					$(".disappearList").html("");
					$(".disappearList").append(resp);
					
				});
			})
		});
		$(".prev").on("click",function(){
			var currentPage = $(".prev").attr("currentPage");
			location.href="toDisappearList?currentPage="+currentPage;

		
		});
		$(".next").on("click",function(){
			var currentPage = $(".next").attr("currentPage");
			location.href="toDisappearList?currentPage="+currentPage;
		});
		$(".select-delete-btn").on("click",function(){
			var result = confirm("정말로 삭제하시겠습니까?");
        	if(result == true){
        		$("#listForm").submit();
        	}
		})

</script>
</body>
</html>