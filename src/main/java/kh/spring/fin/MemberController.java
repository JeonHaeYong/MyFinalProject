package kh.spring.fin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mservice;
 @Autowired
 private HttpSession session;
	@RequestMapping("/login")
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
	
	
	
	@RequestMapping("/join")
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
	
	@ResponseBody
	@RequestMapping("/idajax.do")
	public String idajax(HttpServletRequest request) {
		int idcheck=mservice.idDuplCheckService(request.getParameter("id"));
		if(idcheck==1)
		{return "true";}
		else return "false";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return  "redirect:/";
		
	}
}
