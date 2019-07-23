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
//             var img = document.getElementById("profile_img");
//             img.onClick = function(){
//             	alert("프로필이미지클릭");
//             }
            </script>