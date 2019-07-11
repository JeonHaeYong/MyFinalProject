package kh.spring.fin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("toMyPage")
	public String toMyPage() {
		System.out.println("마이페이지로");
		return "myPage/user/user_myPage_profile";
	}
	
	@RequestMapping("toMyPage_writeList")
	public String toMyPage_writeList() {
		return "myPage/user/user_myPage_writeList";
	}
	
	@RequestMapping("toMyPage_support")
	public String toMyPage_support() {
		return "myPage/user/user_myPage_support";
	}
	
	@RequestMapping("toMyPage_shopping")
	public String toMyPage_shopping() {
		return "myPage/user/user_myPage_shopping";
	}
	
	
}
