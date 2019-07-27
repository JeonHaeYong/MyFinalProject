<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>재회 후기</title>
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
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
                <jsp:include page="/WEB-INF/views/module/loginstyle.jsp" ></jsp:include>
                <style>
                	*{ font-family: 'Gamja Flower' !important;}
                    ::placeholder{font-family: 'Gamja Flower'}
                    /*점보트론 이미지*/
                    .jumbotron{
                        background-color: white;
                        padding-top: 5rem;
                    }
                    .jumbotron>img{
                        width: 100%;
                        max-height: 600px;
                    }
                    /*왼쪽 메뉴 */
                    .menu-box{width: 150px; height: 100px; color: #754F44;  font-family: 'Gamja Flower', cursive; font-size: 22px; margin-top: 50px;}
                    .menu-box>div{height: 35px;}
                    .menu-box>div:first-child{font-weight: bold; border-bottom: 1px solid #754F44; line-height: 33px; color:#B45F04; font-size:40px;}
                    .menu-box>div:not(.s-menu):hover{background-color: #FBFFB950;}
                    .menu-row{text-align: -webkit-center;}
                    a[name="s-menu"]{color: #754F44; text-decoration-line: none;}
                    a[name="s-menu"]:hover{color: #754F44; text-decoration-line: none; font-weight:bold;}
                    /*~왼쪽 메뉴 */
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

                    /* -- */
                    /* imaged preview */
                    .filebox .upload-display { /* 이미지가 표시될 지역 */
                        margin-bottom: 5px;
                    }

                    @media ( min-width : 768px) {
                        .filebox .upload-display {
                            display: inline-block;
                            margin-right: 5px;
                            margin-bottom: 0;
                        }
                    }

                    .filebox .upload-thumb-wrap {
                        /* 추가될 이미지를 감싸는 요소 */
                        display: inline-block;
                        width: 150px;
                        padding: 2px;
                        vertical-align: middle;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                        background-color: #fff;
                    }

                    .filebox .upload-display img {
                        /* 추가될 이미지 */
                        display: block;
                        max-width: 100%;
                        width: 100% \9;
                        height: auto;
                    }
                    .btn{background-color:#FDD69270;color:#754F44; margin: 0px 2px; font-size: 1.1rem;}
					.btn:hover{background-color:#FDD692; font-weight:bold;}
					.writeBody_fs{
						font-size: 22px;
					}
                    /*~파일업로드*/
                    .input-group-text,.form-control{
                    	font-size: 1.2rem;
                    }
                </style>
            </head>
            <body data-spy="scroll" data-target=".site-navbar-target"
                  data-offset="300" id="home-section">
                <jsp:include page="/WEB-INF/views/module/menu.jsp" ></jsp:include>
                <!-- -----여기까지 고정 Header입니다----------------------------------------------------------------------------------------------------------- -->
                <div class="jumbotron px-0 pb-0">
                    <img src="/mypage/dog_1.jpg">
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-3 col-sm-12 col-12 menu-row">
                            <div class="row menu-box">
                                <div class="col-12 s-menu">M E N U</div>
                                <div class="col-12 "><a name="s-menu" href="toReviewList">재회 후기</a></div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-lg-9 col-md-8 col-sm-12 col-12 writeBody_fs">
                            <!-- 내용작성 -->
                            <form action="insertReview" method="post" enctype="multipart/form-data" onsubmit="return reviewWriteForm();">
                                <input type="hidden" value="${id }" name="writer">
                                <div class="form-group text-center">
                                    <h1>재회후기 작성하기</h1>	
                                </div>
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1">제목</span>
                                        </div>
                                        <input type="text" class="form-control title" placeholder="제목은 10글자 이상 , 30글자 이하" aria-label="Username" aria-describedby="basic-addon1" name="title">
                                    </div>	
                                </div>
                                <!-- 파일 업로드 -->
                                <div class="form-group">
                                    <div class="filebox preview-image">
                                        <input class="upload-name text-truncate" value="파일선택" disabled="disabled">
                                        <label for="input-file">업로드</label> 
                                        <input type="file" id="input-file" class="upload-hidden" name="image">
                                    </div>
                                </div>
                                <!-- /파일 업로드 -->    
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">내용</span>
                                        </div>
                                        <textarea class="form-control contents" aria-label="With textarea" placeholder="내용은 최소 50글자를 작성해주셔야합니다." rows="10" style="resize:none;" name="contents"></textarea>
                                    </div>
                                </div>
                                <div class="text-right mb-3"><input type="submit" class="btn" value="글작성하기"><input type="button" class="btn" value="목록으로" onclick="toReviewList();"></div>
                            </form>
                        </div>
                    </div>
                </div>
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
                var fileTarget = $('.filebox .upload-hidden');
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
                var imgTarget = $('.preview-image .upload-hidden');
                imgTarget.on('change',function() {
                    var parent = $(this).parent();
                    parent.children('.upload-display').remove();
                    if (window.FileReader) { //html5 이상에서 window.FileReader지원한다. 지원하는 브라우저에 한해서
                        if (!$(this)[0].files[0].type.match(/image/)) {//image 파일만
                            alert('이미지 파일만 선택할 수 있습니다.');
                            return;
                        }
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            var src = e.target.result;
                            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+
                                           src+'" class="upload-thumb"></div></div>');
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
                });
                function reviewWriteForm(){
                	var title = $(".title").val();
                	var titleRegex = /^.{10,30}$/;
                	var titleRegexResult = titleRegex.exec(title);
                	if(titleRegexResult==null){
                		alert("제목은 10글자 이상 , 30글자 이하로 작성해주세요.");
                		$(".title").focus();
                		return false;
                	}
                	var contents = $(".contents").val();
                	var contentsRegex = /^.{50,}/;
                	var contentsRegexResult = contentsRegex.exec(contents);
                	if(contentsRegexResult==null){
                		alert("내용은 최소 50글자를 작성해주셔야합니다.");
                		$(".contents").focus();
                		return false;
                	}
                	if(contents.length>800){
                		$(".contents").val(contents.substr(0,800));
                	}
                }
               	function toReviewList(){
               		location.href="toReviewList";
               	}
            </script>
        </html>