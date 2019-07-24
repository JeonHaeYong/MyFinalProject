<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>마이페이지</title>
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i"
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
                /*부트스트랩 모달시 패딩 없애주기.*/
                .modal-open {padding-right: 0px !important;}
                .readMsg{
                    color : gray;
                }
                /*파일업로드*/
                    .filebox input[type="file"] {
                        position: absolute;
                        width: 1px;
                        height: 1px;
                        padding: 0;
                        margin: -1px;
                        overflow: hidden;
                        clip: rect(0, 0, 0, 0);
                        border: 0;
                    }
                    .filebox label {
                        display: inline-block;
                        padding: .5em .75em;
                        color: #754F44;
                        font-size: inherit;
                        line-height: normal;
                        /* 	vertical-align: middle !important; */
                        background-color: #fdfdfd;
                        cursor: pointer;
                        border: 1px solid #ebebeb;
                        border-bottom-color: #e2e2e2;
                        border-radius: .25em;
                    }
                    /* named upload */
                    .filebox .upload-name {
                        display: inline-block;
                        padding: .5em .75em; /* label의 패딩값과 일치 */
                        font-size: inherit;
                        font-family: inherit;
                        line-height: normal;
                        /* 	vertical-align: middle; */
                        width : 300px;
                        background-color: #f5f5f5;
                        border: 1px solid #ebebeb;
                        border-bottom-color: #e2e2e2;
                        border-radius: .25em;
                        -webkit-appearance: none; /* 네이티브 외형 감추기 */
                        -moz-appearance: none;
                        appearance: none;
                    }
            </style>
            <jsp:include page="/WEB-INF/views/myPage/user/user_module/mypage_user_style.jsp" ></jsp:include><!-- user 마이페이지 스타일 -->
            <jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
        </head>
        <body data-spy="scroll" data-target=".site-navbar-target"
              data-offset="300" id="home-section">
            <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
            <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
            <jsp:include page="/WEB-INF/views/myPage/user/user_module/top_menu_info.jsp"></jsp:include>
            <!-- /마이페이지 상단메뉴 -->
            <!-- 마이페이지 메뉴별 내용띄워주기 -->
            <div class="tab-content" id="pills-tabContent">
                <!-- 내정보 -->
                <div class="tab-pane fade show active" id="pills-profile">
                    <form id="modify_profile_form" action="modifyProfile" method="post">
                        <div class="form-group row">
                            <label for="my_id" class="col-sm-2 col-form-label">ID</label>
                            <div class="col-sm-7">
                                <input type="text" readonly class="form-control-plaintext" id="my_id" value="${memberDTO.id }" name="id">
                            </div>
                            <div class="text-right col-sm-3" style="font-size: 15px; font-family:BBTreeGR !important;">
                            	*프로필사진변경은 왼쪽의 프로필 이미지를 클릭! 해주세요. 
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <button type="button" id="my_password" class="btn btn-outline-warning rounded" data-toggle="modal" data-target="#password_change_modal">비밀번호 변경하기</button>
                                <!-- Modal -->
                                <div class="modal fade" id="password_change_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="pw">현재 비밀번호</span>
                                                    </div>
                                                    <input id="currPw" type="password" class="form-control" placeholder="Password" aria-label="password" aria-describedby="pw">
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="pw1">변경할 비밀번호</span>
                                                    </div>
                                                    <input type="password" id="changePw1" class="form-control" placeholder="알파벳,숫자조합으로 8~15글자" aria-label="password" aria-describedby="pw1" name="pw">
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="pw2">변경할 비밀번호 확인</span>
                                                    </div>
                                                    <input type="password" id="changePw2" class="form-control" placeholder="변경할 비밀번호 다시 입력" aria-label="password" aria-describedby="pw2">
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button id="change_pw_btn" type="button" class="btn btn-primary rounded">비밀번호 변경</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_nickname" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext modify_info_input" id="my_name" value="${memberDTO.name }" placeholder="한글 2~6자" name="name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext py-1" id="my_email" value="${memberDTO.email }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_birth" class="col-sm-2 col-form-label">Birthday</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext modify_info_input" id="my_birth" value="${memberDTO.birthDay }" placeholder="숫자8자리 (ex.12340101)" name="birthDay">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_gender" class="col-sm-2 col-form-label">Gender</label>
                            <div class="col-sm-10 gender_radio">
                                <input type="text" readonly class="form-control-plaintext" id="my_gender" value="${memberDTO.gender }">
                            </div>
                            <div class="col-sm-10 gender_radio hide form-control-plaintext">
                                <div class="modify_info_input">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="customRadioInline1" name="gender" class="custom-control-input gender_radio_input" value="F">
                                        <label class="custom-control-label" for="customRadioInline1">여자</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="customRadioInline2" name="gender" class="custom-control-input gender_radio_input" value="M">
                                        <label class="custom-control-label" for="customRadioInline2">남자</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_phone" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext modify_info_input" id="my_phone" value="${memberDTO.phone }" placeholder="숫자로만 입력하세요.(ex.01012345678)" name="phone">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_zipcode" class="col-sm-2 col-form-label">Zipcode</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <input type="text" readonly class="form-control-plaintext w-25 addr_info_input" id="my_zipcode" value="${memberDTO.zipcode }" placeholder="찾기버튼!" name="zipcode">
                                    <input id="search_addr_btn" type="button" class="py-1 ml-2 btn btn-outline-warning btn-sm rounded address_search_btn d-none" value="찾기">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_address" class="col-sm-2 col-form-label">주소</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext addr_info_input" id="my_address1" value="${memberDTO.address1 }" placeholder="찾기버튼을 눌러주세요." name="address1">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="my_address" class="col-sm-2 col-form-label">상세주소</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext addr_info_input modify_info_input" id="my_address2" value="${memberDTO.address2 }" placeholder="상세주소를 입력해주세요." name="address2">
                            </div>
                        </div>
                        <div class="d-flex justify-content-center modify_bot_part">
                            <button id="modify_btn" type="button" class="btn btn-outline-warning rounded">내정보 수정</button>
                        </div>
                        <div class="justify-content-center modify_bot_part hide">
                            <button id="modify_profile_btn" type="button" class="btn btn-outline-warning rounded mx-1">정보 수정 완료</button>
                            <button id="back_btn" type="button" class="btn btn-outline-warning rounded mx-1">정보수정 취소</button>
                            <input id="reset_btn" type="reset" class="d-none">
                        </div>
                    </form>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/myPage/user/user_module/menu_footer.jsp" ></jsp:include>
            <!-- ----Footer부분입니다^_^---------------------------------------------------------------------------------------------------------- -->

            <jsp:include page="/WEB-INF/views/module/footer.jsp" ></jsp:include>

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
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script>
        	//tab이미지 animate
    		function tabImgAnimate (){
       			var tab = $("#tabImg");
       			tab.animate({top:"5%" , right : "76%"},"400","linear").animate({top:"2%" , right : "80%"},"400","linear",tabImgAnimate);;
   			 }
    		tabImgAnimate();
            var PwInputCount = 0;//pw변경시 현재비밀번호 틀리는 숫자 카운트
            $(".modify_bot_part.hide").hide();
            $(".gender_radio.hide").hide();
            function genderCheck(){
            	$(".gender_radio_input").each(function(i,item){
                	if($("#my_gender").val()==$(item).val()){
                		$(item).prop("checked",true);
                	}
                });
            }
            genderCheck();
            $("#change_pw_btn").on("click",function(){
                var currPw = $("#currPw").val();
                var pw1 = $("#changePw1").val();
                var pw2 = $("#changePw2").val();
                if(currPw==""){
                    alert("현재비밀번호를 입력해주세요.");
                    $("#currPw").focus();
                    return false;
                }
                if(pw1!=pw2){//pw1 , pw2가 같은 값인지
                    alert("변경할 비밀번호가 다릅니다.");
                    $("#changePw2").focus();
                    return false;
                }
                //pw regex확인
                var pwRegex = /^[a-zA-Z0-9]{8,15}$/g;
                var regexResult = pwRegex.exec(pw1);
                if(regexResult==null){	
                    alert("변경할 비밀번호의 조건을 확인해주세요.\r\n조건->알파벳과 숫자의 조합으로 8~15이하");
                    $("#changePw1").focus();
                    return false;
                }
                //현재비밀번호가 맞는지->ajax로 확인
                $.ajax({
                    url : "currPwCheck",
                    type : "post",
                    data : {
                        id : "${memberDTO.id}",
                        pw : currPw
                    }
                }).done(function(resp){
                    if(resp=="false"){
                        alert("현재비밀번호가 틀립니다.\r\n현재" + (++PwInputCount) + "회/5회 입력 틀렸습니다."  );
                        if(PwInputCount==5){
                            alert("현재비밀번호를 5번 틀리셨습니다.로그아웃됩니다.");
                            $("#modify_profile_form").attr("action","logout");
                            $("#modify_profile_form").submit();
                        }
                    }else{
                        alert("비밀번호를 변경합니다.");
                        $("#modify_profile_form").attr("action","modifyPwByMyPage");
                        $("#modify_profile_form").submit();
                    }
                });
            });
            $('#password_change_modal').on('hidden.bs.modal', function (e) {//modal 취소클릭해서 없어진후에 실행
                $("#currPw").val("");
                $("#changePw1").val("");
                $("#changePw2").val("");
            });
            $("#modify_btn").on("click",function(){//내정보 수정하기
                //주소 찾기 버튼 나오게하기.
                $(".address_search_btn").removeClass("d-none");
                //수정가능한 정보들의 readonly없애기
                $(".modify_info_input").attr("readonly",false);
                $(".modify_info_input").css("background-color","rgba(30, 144, 255, 0.15)");
                $(".addr_info_input").css("background-color","rgba(128, 128, 128, 0.1)");
                //수정할 정보들이 (미설정일때, 값을 빈칸으로 만들기)
                $(".modify_info_input,.addr_info_input").each(function(i,item){
                    if($(item).val()=="(미설정)"||$(item).val()=="(미입력)"){
                        $(item).val("");
                    }
                });
                //성별 radio버튼 보이게하기.
                $(".gender_radio").toggle();
                //버튼 토글
                $(".modify_bot_part").toggle();
                $(".modify_bot_part").removeClass("d-flex");
                $(".modify_bot_part.hide").addClass("d-flex");
            });
            $("#back_btn").on("click",function(){//정보수정취소
                $("#reset_btn").trigger("click");//정보 리셋시키기
                //주소찾기버튼 없애기.
                $(".address_search_btn").addClass("d-none");
                //readonly다시 되돌리기.
                //수정가능한 정보들의 readonly없애기
                $(".modify_info_input").attr("readonly",true);
                $(".modify_info_input,.addr_info_input").css("background-color","inherit");
                //성별 radio없애기.
                $(".gender_radio").toggle();
                genderCheck();//성별 체크해두기.
                //버튼 토글
                $(".modify_bot_part").toggle();
                $(".modify_bot_part").addClass("d-flex");
                $(".modify_bot_part.hide").removeClass("d-flex");
            });
            $("#modify_profile_btn").on("click",function(){//정보 수정 완료->컨트롤러
                /* 이름 regex */
                var name = $("#my_name").val();
                if(name!=""){
                    var nameRegex = /^[가-힣\s]{2,6}$/g;
                    var nameRegexResult = nameRegex.exec(name);
                    if (nameRegexResult == null) {
                        $("#my_name").focus();
                        alert("이름은 2~6자이내 한글로 입력해주세요.");
                        return;
                    }
                }
                /* 생년월일 regex */
                var birth = $("#my_birth").val();
                if(birth!=""){
                    var birthRegex = /^[0-9]{8}$/g
                    var birthRegexResult = birthRegex.exec(birth);
                    if (birthRegexResult == null) {
                        $("#my_birth").focus();
                        alert("생일은 숫자8자리로 입력해주세요.");
                        return;
                    }
                }
                /* 전화번호 regex */
                var phone = $("#my_phone").val();
                if(phone!=""){
                    var phoneRegex = /^01[0-9][0-9]{7,8}$/g
                    var phoneRegexResult = phoneRegex.exec(phone);
                    if (phoneRegexResult == null) {
                        $("#my_phone").focus();
                        alert("핸드폰번호는 숫자로 형식에 맞게 입력해주세요.");
                        return;
                    }
                }
                $("#modify_profile_form").submit();
            });
            //주소찾기버튼눌렀을때,
            document.getElementById("search_addr_btn").onclick = searchAddress;
            function searchAddress() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById("my_zipcode").value = data.zonecode;
                        document.getElementById("my_address1").value = roadAddr;
//                         document.getElementById("my_address2").value = data.jibunAddress;
                    }
                }).open();
            }
            function changeName (){
                // 값이 변경되면 
                if (window.FileReader) {
                    // modern browser 
                    var filename = $(fileTarget)[0].files[0].name;
                } else { // old IE 
                    var filename = $(fileTarget).val().split('/').pop().split(
                        '\\').pop();
                    // 파일명만 추출 
                } // 추출한 파일명 삽입 
                $(fileTarget).siblings('.upload-name').val(filename);
            }
            	//preview image 
				var fileTarget = $('.filebox .upload-hidden');
				var imgTarget = $('.preview-image .upload-hidden');
				
				$(".profile_upload_part.hide").hide();
				imgTarget.on('change',function() {
	                var parent = $(".changeAfterImg");
	                parent.children('.upload-display').remove();
	                if (window.FileReader) { //html5 이상에서 window.FileReader지원한다. 지원하는 브라우저에 한해서
	                    if (!$(this)[0].files[0].type.match(/image/)) {//image 파일만
	                        alert('이미지 파일만 선택할 수 있습니다.');
	                        return;
	                    }
	                    var reader = new FileReader();
	                    reader.onload = function(e) {
	                        var src = e.target.result;
	                        parent.append('<img src="'+src+'" class="upload-display rounded-circle" style="width: 100px; height: 100px;">');
	                    }
	                    reader.readAsDataURL($(this)[0].files[0]);
	                } else {
	                    $(this)[0].select();
	                    $(this)[0].blur();
	                    var imgSrc = document.selection.createRange().text;
	                    parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
	                    var img = $(this).siblings('.upload-display').find('img');
	                    img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
	                        + imgSrc + "\")";
	                }
	                changeName();
	                $(".profile_upload_part").toggle();
	                $(".profile_upload_part.hide").addClass("d-flex");
	            });
                $('#change_profileImg_md').on('hidden.bs.modal', function (e) {//modal 취소클릭해서 없어진후에 실행
                	$("#changeProfileImg_form")[0].reset();
                	$(".changeAfterImg").children('.upload-display').remove();
                	if($(".profile_upload_part.hide").hasClass("d-flex")){
    	                $(".profile_upload_part").toggle();
    	                $(".profile_upload_part.hide").removeClass("d-flex");
                	}
                });
                $(".changeImg_btn").on("click",function(){
                	if($(".profile_upload_part.hide").hasClass("d-flex")){
                		$("#changeProfileImg_form").submit();
                	}else{
                		alert("변경할 프로필 사진을 선택해주세요.");
                	}
                	
                });
                function defaultImgClick(param){
                	var parent = $(".changeAfterImg");
	                parent.children('.upload-display').remove();
	                var src = $(param).children("img").attr("src");
	                parent.append('<img src="'+src+'" class="upload-display" style="width: 100px; height: 100px;">');
	                parent.append('<input type="hidden" class="upload-display" value="'+src+'" name="defaultImg">');
	                $(".profile_upload_part").toggle();
	                $(".profile_upload_part.hide").addClass("d-flex");
                }
        </script>
    </html>