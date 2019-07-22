<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!--  module-->
<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
<style>
	.empty{width: 100%; text-align: center; margin: auto; margin-bottom: 50px; height:50px;}
	#title{width: 100%; text-align: center; margin: auto; margin-bottom: 50px;}
	h1{ font-family: 'Gamja Flower', cursive;}
        .aa{ width: 500px; height: 870px; margin: auto; box-sizing: border-box; margin-bottom: 100px;overflow: hidden;}
        /*기본 정보 */
        .basic,.animal{background-color:#EC7357; text-align: center; font-size:30px; color: white; font-weight: bold; font-family: 'Gamja Flower', cursive; }
        .basic-info{height:300px; width: 100%; }
        .basic-info>div{height: 100%; float: left;}
        .basic-info .title{width: 150px; font-family: 'Gamja Flower', cursive; }
        .basic-info .title div{height:70px; width: 100%; font-weight: bold;font-size: 20px; padding-top:35px; text-align: center;}
        .basic-info .input-box{width: 350px;   height: 100%;}
        .basic-info .input-box div{height:70px; width: 100%; padding-top:30px; text-align: left;}
        
        /*동물정보*/
        .animal-info{height:350px; width: 100%; }
        .animal-info>div{height: 100%; float: left;}
        .animal-info .title{width: 150px; height: 100%; font-family: 'Gamja Flower', cursive; }
        .animal-info .title div{height:55px; width: 100%; font-weight: bold;font-size: 20px; padding-top:20px; text-align: center;}
        .animal-info .input-box{width: 350px;  height: 100%;}
        .animal-info .input-box div{height: 55px; width: 100%; padding-top:20px;  }
        .check{float: left; width: 100px;}
        input[type="text"]{width: 300px;}
      
        
        /*footer 부분*/
        #footer{text-align: center; width: 100%; margin-top:50px;}
         .btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44;}
		.btn:hover{background-color:#FDD692; font-weight:bold;}
</style>
<script>
 	$(function(){
 			


    		$(".toList-btn").on("click",function(){
    			location.href="toDisappearList?currentPage=${currentPage}";
    		});
    		$(".alter-btn").on("click",function(){
    			if($("#disappearDate").val() !=""&& $(".disappearArea").val() !=""&& $(".tel").val() !=""&& $('input:radio[name=gender]').is(':checked')==true
    					&& $('input:checkbox[name=neuter]').is(':checked')==true && $(".furColor").val()!="" && $(".feature").val()!=""){
    				$("#reportForm").submit();
    			}else{alert("기타사항을 제외하고 모두 입력해주세요.");}
    		});
    	});
    </script>
</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
   <jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
<div class="px-0 pb-0 empty"></div>
 <div id="title"><h1>실종 신고</h1></div>

<div class="container">
	<div class="row">
		<div class="col-12">
			<div id="wrapper" class="aa">
	<form action="alterProc.dis" method="post" id="reportForm" enctype="multipart/form-data">
        <input type="hidden" name="seq" class="seq" value="${content.seq }">
        <div class="basic">기본정보</div>
        <div class="basic-info">
            <div class="title">
                <div>실종 날짜</div>
                <div>지역</div>
                <div>실종 장소</div>
                <div>연락처</div>
            </div>
            <div class="input-box">
                <div><input type="date" max=${todayDate } name="disappearDate" id="disappearDate"></div>
                <div>
                    <select name="areaList" id="areaList" >
                        <option value="모든지역">모든지역</option><option value="강원도">강원도</option>
                        <option value="경기도">경기도</option> <option value="경상남도">경상남도</option>
                        <option value="경상북도">경상북도</option><option value="광주광역시">광주광역시</option>
                        <option value="대구광역시">대구광역시</option> <option value="대전광역시">대전광역시</option>
                        <option value="부산광역시">부산광역시</option><option value="서울특별시">서울특별시</option> 
                        <option value="세종특별자치시">세종특별자치시</option> <option value="울산광역시">울산광역시</option>
                        <option value="인천광역시">인천광역시</option><option value="전라남도">전라남도</option> 
                        <option value="전라북도">전라북도</option> <option value="제주도">제주특별자치도</option>
                        <option value="충청남도">충청남도</option><option value="충청북도">충청북도</option>
                    </select>
                </div>
                <div><input type="text" name="disappearArea" class="disappearArea"></div>
                <div><input type="text" name="tel" class="tel"></div>
            </div>
        </div>
        
        
        <div class="animal">동물정보</div>
          <div class="animal-info">
            <div class="title">
                <div>품종</div>
                <div>성별</div>
                <div>나이</div>
                <div>털색</div>
                <div>특징</div>
                <div>기타</div>
                <div>사진</div>
            </div>
            <div class="input-box">
                <div><select name="kind" id="kind" >
                        <option value="개">개</option><option value="고양이">고양이</option><option value="기타">기타동물</option> 
                    </select>
                </div>
                <div>
                    <span class="check"><input type="radio" name="gender" value="남" class="radio">수컷</span>
                    <span class="check"><input type="radio" name="gender" value="여" class="radio">암컷</span>
                    <span class="check"><input type="checkbox" name="neuter" value="O">중성화완료</span>
                </div>
                <div><select name="age" id="age" >
                        <option value="나이모름">나이 모름</option><option value="1-5살">1-5살</option><option value="6-10살">6-10살</option> <option value="10-15살">10-15살</option>
                        <option value="16-20살">16-20살</option><option value="21이">21살이상</option>
                    </select>
                    </div>
                <div><input type="text" placeholder="털색을 설명해주세요" class="furColor" name="furColor"></div>
                <div><input type="text" placeholder="눈에 띄는 특징을 적어주세요" class="feature" name="feature"></div>
                <div><input type="text" placeholder="기타사항을 입력해주세요" class="et" name="et"></div>
                <div><input type="file" name="image"></div>
            </div>
        </div>
        
        <div id="footer">
            <input type="button" class="alter-btn btn" value="수정">
            <input type="button" class="toList-btn btn" value="취소">
        </div>
        </form>
			</div>
		</div>
	</div>
</div>
<script>
	$("#disappearDate").val('${content.disDate}');
	$("#areaList option[value='${content.areaList}']").attr("selected", true);
	$(".disappearArea").val('${content.disappearArea}');
	$(".tel").val('${content.tel}');
	$("#kind").val('${content.kind}');
	$("input:radio[name=gender][value=" + '<c:out value="${content.gender}"/>' + "]").attr("checked",true);
	$("input:checkbox[name=neuter][value="+'<c:out value="${content.neuter}"/>'+"]").attr("checked",true);
	$("#age").val('${content.age}');
	$(".furColor").val('${content.furColor}');
	$(".feature").val('${content.feature}');
	$(".et").val('${content.et}');
</script>

<!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->
   <jsp:include page="/WEB-INF/views/module/footer.jsp" ></jsp:include>
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
</body>
</html>