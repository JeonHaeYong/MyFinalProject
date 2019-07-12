package kh.spring.fin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;
import kh.spring.serviceImpl.BlackListServiceImpl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {


	@Autowired
	private MemberService mservice;
	@Autowired
	private HttpSession session;
	
	//로그인
	@RequestMapping("login")
	public String lign(MemberDTO dto) {
		System.out.println(dto.getId());
		try{
			int result=mservice.isLoginOkService(dto.getId(), dto.getPassword());
			System.out.println(result);
			if(result<1)
			{
				return "member/loginfail";
			}
			else {
				session.setAttribute("id", dto.getId());
				System.out.println("sessuion정보"+session.getAttribute("id"));
				return "redirect:/";	
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "/loginfail";
		}

	}
	//회원가입
	@RequestMapping("join")
	public String join() {
		return "member/join";
	}
	@RequestMapping("joininfo")
	public String joininfo(MemberDTO dto) {
		try{mservice.insertMemberService(dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	//아이디확인
	@ResponseBody
	@RequestMapping("idajax.do")
	public String idajax(HttpServletRequest request) {
		int idcheck=mservice.idDuplCheckService(request.getParameter("id"));
		if(idcheck==1)
		{return "true";}
		else return "false";
	}
	//로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return  "redirect:/";
	}

	//마이페이지
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

	@RequestMapping("toMyPage_cart")
	public String toMyPage_cart() {
		return "myPage/user/user_myPage_cart";
	}

	@RequestMapping("toMyPage_buyList")
	public String toMyPage_buyList() {
		return "myPage/user/user_myPage_buyList";
	}

	@RequestMapping("toMyPage_message")
	public String toMyPage_message() {
		return "myPage/user/user_myPage_message";
	}


}
