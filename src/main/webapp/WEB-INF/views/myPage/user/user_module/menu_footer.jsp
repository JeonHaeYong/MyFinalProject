<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	                        </div>
                    </div>
                </div>
            </section>
            <script>
            var myPages = document.getElementsByClassName("my_page_nav");
            for(var i=0; i<myPages.length;i++){
                var id = myPages[i].getAttribute("id");
                if(id=="${myPage}"){
                    myPages[i].classList.add("active");
                    break;
                }
            };
            function changeProfileImg(){
            	$(".change_profileImg_mdBtn").trigger("click");
            };

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
			window.onload = function(){
				var fileTarget = $('.filebox .upload-hidden');
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
            }
            </script>