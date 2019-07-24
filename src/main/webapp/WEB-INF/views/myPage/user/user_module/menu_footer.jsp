<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	                        </div>
                    </div>
                </div>
            </section>
            <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
            <script>
            var myPages = document.getElementsByClassName("my_page_nav");
        	for(var i=0; i<myPages.length;i++){
                var id = myPages[i].getAttribute("id");
                if(id=="${myPage}"){
                    myPages[i].classList.add("active");
                }
            };
            window.addEventListener("onload", mypageCheckFunc());
            function mypageCheckFunc(){
            	if("${myPage}"!="toMyPage"){//내정보가 아니라면
                    var image = $(".img_anchor").html();
                    $(".img_wrapper").html(image);
                    $("#change_profileImg_md").remove();
                }
                $(".profileImg_round").each(function(i,item){
                	var path = $(item).attr("src");
                	var pathRegex = /^\/profile\/[^\/]+?/;
                	var pathRegexResult = pathRegex.exec(path);
                	if(pathRegexResult!=null){
                		$(item).removeClass("rounded-circle");
                	}
                })
            }
            function changeProfileImg(){
            	$(".change_profileImg_mdBtn").trigger("click");
            };
            </script>