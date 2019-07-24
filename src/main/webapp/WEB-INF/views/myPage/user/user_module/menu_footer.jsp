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
                }
            };
            window.onload = function(){
                if("${myPage}"!="toMyPage"){//내정보가 아니라면
                    var image = $(".img_anchor").html();
                    $(".img_wrapper").html(image);
                }
                
            }
            function changeProfileImg(){
            	$(".change_profileImg_mdBtn").trigger("click");
            };
            </script>