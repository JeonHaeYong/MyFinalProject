<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실종신고</title>
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
 		.empty{width: 100%; text-align: center; margin: auto; margin-bottom: 50px; height:50px;}
        .title{text-align: center;}
        h1{ font-family: 'Gamja Flower', cursive;}
        div{ box-sizing: border-box; overflow:hidden; border: 0px solid black;}
        #wrapper{border: 2px solid #754F44; width: 1200px; height: 400px; margin: auto; margin-bottom:20px;}
        #wrapper>div{float: left;}
        .pet{width: 35%; height: 97%; margin: 5px;}
        .infoImg{height:200px;}
        .w-100{height:400px;}
        
        .feature,.et{float:left; }
        .feature{width: 50%; }
        .feature>div:first-child{height: 20%; width: 100%; font-weight: bold; font-family: 'Gamja Flower', cursive; font-size:20px;}
        .feature>div:nth-child(2){height: 80%; width: 100%; overflow-y: auto; word-wrap: break-word;}
        .petInfo{width: 63%; height: 97%; margin-left: 6px; margin-top:5px;}
        
        .content{width: 100%; height: 70%;}
        .content>div{float: left;width: 50%; height: 100%;}
        .first-col{font-weight: bold; font-family: 'Gamja Flower', cursive; font-size:20px;}
       .first-col,.second-col{float: left; width: 50%; height: 100%;}
        
        .first-col>div,.second-col>div{height: 20%; text-align: center; line-height: 50px;}
        .et{width: 50%;  padding-left: 75px;}
        .content>div:nth-child(2)>.first-col>div,.content>div:nth-child(2)>.second-col>div{height: 34%; line-height: 80px;}
        .et>div:first-child{height: 25%; font-weight: bold; font-family: 'Gamja Flower', cursive; font-size:20px;}
        .et-contents{height: 80%; overflow-y: auto; word-wrap: break-word;}
        .petImg>img{width:100%; height:100%;}
        
        #footer{ margin:auto; width:1200px;}
        #footer>div{text-align:right;}
        .btn{font-family: 'Gamja Flower', cursive;background-color:#FDD69270;color:#754F44;}
		.btn:hover{background-color:#FDD692; font-weight:bold;}
		/* 댓글 ------------------------------------------- */
		.comment{max-width: 1200px;}
		 	.navi{
                        text-decoration: none;
                        background-color: #FDD69270;
                        color: #754F44;
                        font-size:20px;
                        padding:6px 12px;
                        border-radius: 30px;
                    }
                    .navi:hover{
                        font-weight: bold;
                        background-color: #FDD692;
                    }
                    .text-center{padding-top:30px; height:100px;}
	
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
	<div class="title"><h1>실종신고</h1></div>
    <div id="wrapper">
       <div class="pet">
           <div class="petImg">
           		<div class="infoimg">
					<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${content.image1 }" class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="${content.image2 }" class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="${content.image3 }" class="d-block w-100">
							</div> 
						</div>
						<a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
    						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    						<span class="sr-only">Previous</span>
  						</a>
  						<a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
    						<span class="carousel-control-next-icon" aria-hidden="true"></span>
    						<span class="sr-only">Next</span>
  						</a>
					</div>
				</div>
           </div>
           <hr>
           
       </div>
        <div class="petInfo">
            <div class="content">
                <div>
                    <div class="first-col">
                        <div>[${content.kind }]</div>
                         <div>아이디</div>
                        <div>성별/나이/털색</div>
                        <div>지역</div>
                        <div>실종장소</div>
                    </div>
                    <div class="second-col">
                         <div></div>
                        <div>${content.writer }</div>
                        <div>${content.gender }/${content.age }/${content.furColor }</div>
                        <div>${content.areaList }</div>
                        <div>${content.disappearArea }</div>
                    </div>
                </div>
                <div>
                    <div class="first-col">
                       <div>연락처</div>
                        <div>중성화</div>
                        <div>실종날짜</div>
                    </div>
                    <div class="second-col">
                        <div>${content.tel }</div>
                        <div>${content.neuter }</div>
                        <div>${content.disDate }</div>
                    </div>
                </div>
            </div>
     <div>
        <div class="et">
            <div>기타</div>
            <div class="et-contents">${content.et }</div>
        </div>
        <div class="feature">
               <div>특징</div>
               <div>${content.feature }</div>
           </div>
           </div>
        </div>
    </div>
      <div id="footer">
        	<div>
        		<c:choose>
        			<c:when test="${content.writer == id || type == 4}">
        				<input type="button" class="alter-btn btn" value="수정">
        				<input type="button" class="delete-btn btn" value="삭제">
        			</c:when>
        			<c:otherwise>
        				<input type="button" class="alter-btn btn" value="수정" hidden>
        				<input type="button" class="delete-btn btn" value="삭제"hidden>
        			</c:otherwise>
        		</c:choose>
        		<input type="button" class="toList-btn btn" value="목록">
        	</div>
        </div>
	<!-- 댓글 입력 -->
	<div class="container comment">
	<div class="row">
		<div class="col-12">
			<div class="input-group my-3">
				<input type="text" class="form-control" placeholder="댓글달기!"
					aria-describedby="review_reply_btn" id="review_reply_input">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary rounded py-0"
						type="button" id="review_reply_btn">댓글등록</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row reply_part">
		<!-- 댓글 목록 보여주기 -->
		<c:forEach var="list" items="${replyList }">
			<div class="col-12 border-bottom mb-1">
				<div class="firstLine d-flex justify-content-between">
					<div class="font-weight-bold"><span class="mr-2"><img src="${list.imagepath }" class="profileImg_round rounded-circle" style="width: 50px ; height: 50px;"></span>${list.writer }</div>
					<c:if test="${id==list.writer }">
						<div class="modifyReply_part">
							<a href="javascript:void(0)" onclick="modifyReplyToggle(this)"><img
								src="review/edit.png" style="width: 20px; height: 20px;"></a>
							<a href="javascript:void(0)" onclick="deleteReply(this)"
								value="${list.seq }"><img src="review/cancel.png"
								style="width: 20px; height: 20px;"></a>
						</div>
						<div class="modifyReply_part hide">
							<a role="btn" class="btn btn-outline-warning rounded p-1"
								href="javascript:void(0)" onclick="modifyReply(this);"
								value="${list.seq }">완료</a> <a role="btn"
								class="btn btn-outline-warning rounded p-1"
								href="javascript:void(0)" onclick="formReset(this)"
								value="${list.contents }">취소</a>
						</div>
					</c:if>
				</div>
				<div>
					<span>${list.formed_date }</span>
				</div>
				<div class="d-flex justify-content-between">
					<span><input type="text" readonly
						class="form-control-plaintext reply_contents"
						value="${list.contents }" style="width: 600px;"></span>
				</div>
			</div>
		</c:forEach>
	</div>
		<div class="row reply_part navi-section">
			<c:if test="${reply_navi.size()!=0 }">
				<div class="col-12 text-center">
					<c:forEach var="navi" items="${reply_navi }">
						<a class="ml-1 navi reply_navi" href="#toList" onclick="clickReplyNavi(this);">${navi }</a>
					</c:forEach>
				</div>
			</c:if>
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
	<script>
		$(".toList-btn").on("click",function(){//홈으로
			location.href="toDisappearList?currentPage=${currentPage}";
		});
		$(".alter-btn").on("click",function(){
			location.href="toAlterForm?seq=${content.seq}";
		});
		$(".delete-btn").on("click",function(){
			var result = confirm("정말로 삭제하시겠습니까?");
        	if(result == true){
			location.href="deleteProc.dis?seq=${content.seq}";
        	}
		});
		$(".carousel-item>img").each(function(index,items){ // 캐러셀 밑에 있는 사진들
			if($(this).attr("src")=='null'){//소스값이 null이라
				var parent = $(this).parent().remove();//carousel-item을 지워
			}
		});

/* 댓글~~!!!! */
	  $("#review_reply_btn").on("click",function(){//댓글등록
          if(${id==null}){//아직 로그인을 하지 않았다면,
              alert("로그인을 먼저 해주세요.");
              $(".login-btn").trigger("click");
              return;
          }
          var reply = $("#review_reply_input").val();
          if(reply==""){
              alert("댓글을 입력해주세요.");
              $("#review_reply_input").focus();
              return;
          }
          //ajax로 table에 insert하기.
          $.ajax({       	 
              url : "insertDisappearComment",
              type : "post",
              data : {
                  seqStr : "${content.seq}",
                  writer : "${id}",
                  contents : reply
              }
          }).done(function(resp){
              //console.log("댓글달기성공->"+resp);
              $(".reply_part").remove();
              $(".comment").append(resp);
              
            /*   likeOkCheck();//좋아요 클릭한것만 빨강하트 */
              $("#review_reply_input").val("");
              $(".modifyReply_part.hide").hide();
              profileImgRounded();
          })
      });
	  function clickReplyNavi(param){//댓글 navi 클릭했을때,
          var currentPage = $(param).text();
          if(currentPage=="<이전"){
              var prev =  $(param).next().text();;
              currentPage = parseInt(prev) - 1 ;
          }else if(currentPage=="다음>"){
              var next  = $(param).prev().text();
              currentPage = parseInt(next) + 1 ;
          }
          $.ajax({
              url : "clickCommentNavi",
              type : "post",
              data : {
                  seqStr : "${content.seq}",
                  currentPageStr : currentPage
              }
          }).done(function(resp){
              $(".reply_part").remove();
              $(".comment").append(resp);
              profileImgRounded();
              $(".modifyReply_part.hide").hide();
          })
      }
	  $(".modifyReply_part.hide").hide();
      function modifyReplyToggle(param){//수정하려면,
          $(param).parent().toggle();
          $(param).parent().next().toggle();
          $(param).parents(".firstLine").next().next().find(".reply_contents").attr("readonly",false);
          $(param).parents(".firstLine").next().next().find(".reply_contents").css("background-color","skyblue");
      }
      function formReset(param){//수정취소눌렀을때,
          var contents = $(param).attr("value");
          $(param).parents(".firstLine").next().next().find(".reply_contents").val(contents);
          $(param).parent().toggle();
          $(param).parent().prev().toggle();
          $(param).parents(".firstLine").next().next().find(".reply_contents").attr("readonly",true);
          $(param).parents(".firstLine").next().next().find(".reply_contents").css("background-color","inherit");
      }
      function modifyReply(param){//댓글수정
          var input = $(param).parents(".firstLine").next().next().find(".reply_contents");
          var reply =  input.val();
          var replyRegex = /^ {1,}$/;
          var replyRegexResult = replyRegex.exec(reply);
          if(reply==""||replyRegexResult!=null){
              alert("댓글에 공백을 허용하지 않습니다.");
              input.focus();
              return false;
          }
          $.ajax({
              url : "updateCommentContents",
              type : "post",
              data : {
                  seq : $(param).attr("value"),
                  contents : reply
              }
          }).done(function(resp){
              input.val(resp);
              $(param).next().attr("value",resp);
              $(param).parent().toggle();
              $(param).parent().prev().toggle();
              input.attr("readonly",true);
              input.css("background-color","inherit");
          });
      };
      function deleteReply(param){//댓글 삭제
      	var seq = $(param).attr("value");
      	var writer = $(param).parent().prev().text();
      	console.log($(param).parent().prev().children(".writer").text());
      	console.log(writer);
			if(confirm("댓글을 삭제하시겠습니까?")){
				$.ajax({
					url : "deleteComment",
					type : "post",
					data : {
						seq : seq,
						writer : writer
					}
				}).done(function(resp){
					alert("댓글이 삭제되었습니다.");
                  $(".reply_part").remove();
                  $(".comment").append(resp);
                  //likeOkCheck();//좋아요 클릭한것만 빨강하트
                  $(".modifyReply_part.hide").hide();
                  profileImgRounded();//이미지 원형
				});
			}
      }
      function profileImgRounded(){
      	$(".profileImg_round").each(function(i,item){//기본이미지는 원형이미지 없애주기
          	var path = $(item).attr("src");
          	var pathRegex = /^\/profile\/[^\/]+?/;
          	var pathRegexResult = pathRegex.exec(path);
          	if(pathRegexResult!=null){
          		$(item).removeClass("rounded-circle");
          	}
          });
      };
      profileImgRounded();
      //이미지 없는 캐ㅅ러셀 삭제
      $(".carousel-item img").each(function(index,items){
			if($(this).attr("src") =='noImage'){
				console.log($(this).parent().parent().attr("class"));
				
				 $(this).parent().remove();
				 $(this).remove();
			}
      });
      $("#review_reply_input").keydown(function(e){
    	  if(e.keyCode == 13){
    		  if(${id==null}){//아직 로그인을 하지 않았다면,
                  alert("로그인을 먼저 해주세요.");
                  $(".login-btn").trigger("click");
                  return;
              }
              var reply = $("#review_reply_input").val();
              if(reply==""){
                  alert("댓글을 입력해주세요.");
                  $("#review_reply_input").focus();
                  return;
              }
              //ajax로 table에 insert하기.
              $.ajax({
            	 
                  url : "insertDisappearComment",
                  type : "post",
                  data : {
                      seqStr : "${content.seq}",
                      writer : "${id}",
                      contents : reply
                  }
              }).done(function(resp){
                  //console.log("댓글달기성공->"+resp);
                  $(".reply_part").remove();
                  $(".comment").append(resp);
                  
                /*   likeOkCheck();//좋아요 클릭한것만 빨강하트 */
                  $("#review_reply_input").val("");
                  $(".modifyReply_part.hide").hide();
                  profileImgRounded();
              });
    	  }
      });
	</script>
</body>
</html>