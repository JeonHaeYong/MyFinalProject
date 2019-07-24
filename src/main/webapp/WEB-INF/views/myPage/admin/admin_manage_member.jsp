<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

#container
{
	margin-top: 5%;
}
#mypage_link
{
	color: #EC7357 !important;
	font-weight: 600 !important;
}



.selected_menu_btns {
	font-family: 'Gamja Flower', cursive !important;
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
	background-color:#FDD69270;
	color:#754F44;
	font-weight:bold !important;
}
.menu_btns{
	font-family: 'Gamja Flower', cursive !important;
	border-radius: 0px !important;
	width: 100%;
	height: 100%;
}
.menu_btns:hover{
	background-color:#FDD692;
	font-weight:bold !important;
}


.my_buttons, .navi_btns, .black_navi_btns {
font-family: 'Gamja Flower', cursive !important;
background-color:#FDD69270;
color:#754F44;
}
.my_buttons:hover , .navi_btns:hover, .black_navi_btns:hover {
background-color:#FDD692;
font-weight:bold;
}
.selected_btn, .black_selected_btn{
font-family: 'Gamja Flower', cursive !important;
color:#754F44;
background-color:#FDD692;
font-weight:bold;
}

/* .my_buttons { */
/* 	border-radius: 0px !important; */
/* 	width: 100%; */
/* 	height: 100%; */
/* 	background-color: #EC7357; */
/* 	color: white !important; */
/* } */
/* .my_buttons:hover{ */
/* 	background-color: #9c2c2c !important; */
/* } */
/* .selected_btn{ */
/* 	color: #EC7357 !important; */
/* 	font-weight: 600 !important; */
/* } */



</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<jsp:include page="/WEB-INF/views/module/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/module/loginstyle.jsp"></jsp:include>
	<!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->

<!-- <div class="row justify-content-center"></div> -->
<!-- <div class="col-12 col-md-12 col-lg-12 text-center my-5"></div> -->
<!-- <div class="row justify-content-center"> -->
<!-- 	<div class="col-12 col-md-12 col-lg-12 text-center my-5"> -->
<!-- 	</div> -->
<!-- </div> -->

	<section class="site-section bg-light block-13">

		<div id="container" class="container">
			
			
			
			
			
			
			<div id="menu_row" class="row justify-content-center">

				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-member" class="btn selected_menu_btns">회원 관리</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-item" class="btn menu_btns">무료 나눔 물품 승인</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-paylog" class="btn menu_btns">무료 나눔 거래 내역</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-donation" class="btn menu_btns">월 별 후원금 및 전달 기관</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-quiz" class="btn menu_btns">퀴즈 당첨자</a>
				</div>
	
				<div class="col-6 col-md-4 col-lg-2 text-center px-1">
					<a href="admin-chart" class="btn menu_btns">통계</a>
				</div>
	
			</div>
			
			
			
			
			
			
			<div id="contents_row" class="row justify-content-center mt-5">
			
				<div class="col-12">
					
					<div class="row justify-content-center my-5">
						
						<div class="col-8 col-md-8 col-lg-12 text-center my-auto">
							
							<h3>아이디 조회 및 블랙리스트 등록</h3>
														
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-10 text-center my-auto">
							
							<input id="search_text" class="form-control" type="text" placeholder="검색할 아이디를 입력하세요(없을 시 전체)">
							
						</div>
						
						<div class="col-4 col-md-4 col-lg-2 text-center my-auto">
							
							<input id="search_btn" class="btn my_buttons" name="1" type="button" value="검색">
							
						</div>
						
					</div>
					
					<div class="row justify-content-center my-3">
						
						<div id="search_result_div" class="col-12 col-md-12 col-lg-12 text-center my-1">
						
						</div>
						
					</div>
					
					
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-10 text-center my-5">
							
							<input id="reason_text" class="form-control" type="text" placeholder="계정 정지 사유를 입력하세요">
							
						</div>
						
						<div class="col-4 col-md-4 col-lg-2 text-center my-5">
							
							<input id="black_btn" class="btn my_buttons" type="button" value="등록하기">
							
						</div>
						
					</div>
					
					
					
					
					
					
					<div class="row justify-content-center my-5">
						
						<div class="col-8 col-md-8 col-lg-12 text-center my-auto">
							
							<h3>블랙리스트 조회 및 해제</h3>
														
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-10 text-center my-auto">
							
							<input id="blacklist_search_text" class="form-control" type="text" placeholder="검색할 아이디를 입력하세요(없을 시 전체)">
							
						</div>
						
						<div class="col-4 col-md-4 col-lg-2 text-center my-auto">
							
							<input id="blacklist_search_btn" class="btn my_buttons" name="1" type="button" value="검색">
							
						</div>
						
					</div>
					
					<div class="row justify-content-center my-3">
						
						<div id="blacklist_search_result_div" class="col-12 col-md-12 col-lg-12 text-center my-1">
						
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-8 col-md-8 col-lg-10 text-center my-5">
							
							<input id="release_id_text" class="form-control" type="text" placeholder="차단 해제할 아이디를 입력하세요">
							
						</div>
							
						<div class="col-4 col-md-4 col-lg-2 text-center my-5">
								
							<input id="release_btn" class="btn my_buttons" type="button" value="해제하기">
								
						</div>
						
					</div>
					
					<div class="row justify-content-center">
						
						<div class="col-12 text-center my-5">
							
							<a href="admin-member-insert">데이터 입력</a>
							
						</div>
						
					</div>
					
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
<script>
	$(function()
    {
		
	    $(document).on("click", "#search_btn, .navi_btns", function()
		{
	    	searchOnMember(this.name);
		});
	   
	    $(document).on("click", "#blacklist_search_btn, .black_navi_btns", function()
	    {
	    	searchOnBlackList(this.name);
	    });

	    $("#black_btn").on("click", function()
	    {
			var reasonValue = $("#reason_text").val();
			var $checkboxClass = $(".black_check"); 
           	var checkboxNumber = $checkboxClass.length;
	               	    	
			var id = "";
	    	for(var i = 1 ; i <= checkboxNumber ; i++)
	    	{
	    		if($checkboxClass.eq(i-1).prop("checked") == true)
	    		{
	    			id = id + " " + $checkboxClass.eq(i-1).attr("name");
	    		}
	    	}
	               	    	
			var $form = $('<form></form>');
			$form.attr('action', 'admin-member-black');
			$form.attr('method', 'POST');
			$form.appendTo('body');
         
			var idArr = $('<input type="hidden" value="'+id+'" name="id">');
	        var blackReason = $('<input type="hidden" value="'+reasonValue+'" name="reason">')
			$form.append(idArr).append(blackReason);
	        $form.submit();
	               	       	 
	               	    	
	    });
	               	    
	    $("#release_btn").on("click", function()
		{
	    	var $form = $('<form></form>');
	    	$form.attr('action', 'admin-member-release');
	    	$form.attr('method', 'POST');
	    	$form.appendTo('body');
	               	         
	    	var id = $('<input type="hidden" value="'+$("#release_id_text").val()+'" name="id">');
	    	$form.append(id);
	    	$form.submit();
	               	    	
		});
	    
	    function searchOnMember(btnName)
	    {
	    	$.ajax
	    	({
	    		url: "admin-member-search",
	    		type: "POST",
	    		dataType: "JSON",
	    		data:
	    		{
	    			id: $("#search_text").val()
	    			,page: btnName
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		$("#search_result_div").empty();
	    		
	    		var array = response.array;
	    		
// 	    		console.log(response)
	    		
	    		if(array.length != 0)
	    		{
	    			for(var i = 1 ; i <= array.length ; i++)
		    		{
//	 	    			console.log(response[i-1].id);
						var $row = $('<div class="row justify-content-center my-1 id_row"></div>');
		    			var $idCol = $('<div class="col-6 col-md-6 col-lg-6 text-center my-1">'+array[i-1].id+'</div>');
		    			var $statusCol = $('<div class="col-4 col-md-4 col-lg-3 text-center my-1">'+array[i-1].status+'</div>');
		    			var $checkCol = $('<div class="col-2 col-md-2 col-lg-3 text-center my-1"><input class="black_check" name="'+array[i-1].id+'" type="checkbox">'+'블랙리스트 등록'+'</div>');
		    			$row.append($idCol).append($statusCol).append($checkCol);
		    			$("#search_result_div").append($row);
		    		}
		    		
		    		console.log(response.currentPage);
		    		console.log(response.needPrev);
		    		console.log(response.needNext);
		    		console.log(response.startNavi);
		    		console.log(response.endNavi);
		    		
		    		var $naviRow = $('<div id="navi_row" class="row justify-content-center mb-1 mt-3"></div>');
		    		
		    		if(response.needPrev)
		    		{
		    			var $prevBtn = $('<input class="btn my_navi_btns navi_btns mx-1" type="button" value=" < " name="'+(response.startNavi-1)+'">');
		    			$naviRow.append($prevBtn);
		    		}
		    		
		    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
		    		{
		    			
		    			if(i == response.currentPage)
		    			{
			    			var $naviBtn = $('<input class="btn selected_btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

		    			}
		    			else
		    			{
			    			var $naviBtn = $('<input class="btn navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

		    			}
		    			$naviRow.append($naviBtn);
		    		}
		    		
		    		if(response.needNext)
		    		{
		    			var $nextBtn = $('<input class="btn navi_btns mx-1" type="button" value=" > " name="'+(response.endNavi+1)+'">');
		    			$naviRow.append($nextBtn);
		    		}
		    		
		    		$("#search_result_div").append($naviRow);
	    		}
	    		else
	    		{
	    			alert("검색 결과 없음");
	    		}
	    		
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
	    }
	    
	    function searchOnBlackList(btnName)
	    {
	    	$.ajax
	    	({
	    		url: "admin-blacklist-search",
	    		type: "POST",
	    		dataType: "JSON",
	    		data:
	    		{
	    			id: $("#blacklist_search_text").val()
	    			,page: btnName
	    		}
	    	})
	    	.done(function(response)
	    	{
	    		$("#blacklist_search_result_div").empty();
	    		
	    		var array = response.array;
	    		
	    		var $menu_row = $('<div class="row justify-content-center my-1"></div>');
				var $menu_seqCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-1"><h3>등록 번호</h3></div>');
    			var $menu_idCol = $('<div class="col-6 col-md-6 col-lg-3 text-center my-1"><h3>아이디</h3></div>');
    			var $menu_reasonCol = $('<div class="col-4 col-md-4 col-lg-4 text-center my-1"><h3>정지 사유</h3></div>');
    			var $menu_timeCol = $('<div class="col-2 col-md-2 col-lg-3 text-center my-1"><h3>조치일</h3></div>');
    			$menu_row.append($menu_seqCol).append($menu_idCol).append($menu_reasonCol).append($menu_timeCol);
    			$("#blacklist_search_result_div").append($menu_row);
	    		
	    		if(array.length != 0)
	    		{
	    			for(var i = 1 ; i <= array.length ; i++)
		    		{
						var $row = $('<div class="row justify-content-center my-1"></div>');
						var $seqCol = $('<div class="col-6 col-md-6 col-lg-2 text-center my-1">'+array[i-1].seq+'</div>');
		    			var $idCol = $('<div class="col-6 col-md-6 col-lg-3 text-center my-1">'+array[i-1].id+'</div>');
		    			var $reasonCol = $('<div class="col-4 col-md-4 col-lg-4 text-center my-1">'+array[i-1].reason+'</div>');
		    			var $timeCol = $('<div class="col-2 col-md-2 col-lg-3 text-center my-1">'+array[i-1].time+'</div>');
		    			$row.append($seqCol).append($idCol).append($reasonCol).append($timeCol);
		    			$("#blacklist_search_result_div").append($row);
		    		}
		    		
		    		console.log(response.currentPage);
		    		console.log(response.needPrev);
		    		console.log(response.needNext);
		    		console.log(response.startNavi);
		    		console.log(response.endNavi);
		    		
		    		var $naviRow = $('<div id="navi_row" class="row justify-content-center mb-1 mt-3"></div>');
		    		
		    		if(response.needPrev)
		    		{
		    			var $prevBtn = $('<input class="btn black_navi_btns mx-1" type="button" value=" < " name="'+(response.startNavi-1)+'">');
		    			$naviRow.append($prevBtn);
		    		}
		    		
		    		for(var i = response.startNavi ; i <= response.endNavi ; i++)
		    		{
		    			
		    			if(i == response.currentPage)
		    			{
			    			var $naviBtn = $('<input class="btn black_selected_btn black_navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

		    			}
		    			else
		    			{
			    			var $naviBtn = $('<input class="btn black_navi_btns mx-1" type="button" value="'+i+'" name="'+i+'">');

		    			}
		    			$naviRow.append($naviBtn);
		    		}
		    		
		    		if(response.needNext)
		    		{
		    			var $nextBtn = $('<input class="btn black_navi_btns mx-1" type="button" value=" > " name="'+(response.endNavi+1)+'">');
		    			$naviRow.append($nextBtn);
		    		}
		    		
		    		$("#blacklist_search_result_div").append($naviRow);
	    		}
	    		else
	    		{
	    			alert("검색 결과 없음");
	    		}
	    		
	    	})
	    	.fail(function()
	    	{
	    		alert("error");
	    	});
	    }

	    
    });
    
	
	
    onload = function()
    {
		
    };
</script>
</html>