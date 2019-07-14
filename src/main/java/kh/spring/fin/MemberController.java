package kh.spring.fin;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kh.spring.dto.MemberDTO;
import kh.spring.loginapi.NaverLoginBO;
import kh.spring.service.MemberService;
import kh.spring.service.MessageService;

@Controller
public class MemberController {


	@Autowired
	private MemberService mservice;
	@Autowired
	private MessageService msgService;
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
				System.out.println("session정보"+session.getAttribute("id"));
				return "redirect:/";	
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "/loginfail";
		}

	}
	
	//네이버 로그인
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/users/naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "users/naverlogin";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/users/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        /* 네이버 로그인 성공 페이지 View 호출 */
//      JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//      String snsId = jsonparse.JsonToString(jsonobj, "id");
//      String name = jsonparse.JsonToString(jsonobj, "name");
//
//      UserVO vo = new UserVO();
//      vo.setUser_snsId(snsId);
//      vo.setUser_name(name);
//
//      System.out.println(name);
//      try {
//          vo = service.naverLogin(vo);
//      } catch (Exception e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }


//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);
        
        return "/";
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
	//이메일 인증

	
	
	
	
	//로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return  "redirect:/";
	}

	
	
	
	
	
	//마이페이지
	@RequestMapping("toMyPage")
	public String toMyPage(HttpServletRequest request) {
		System.out.println("마이페이지로");
		//memberDTO담기
		//System.out.println("로그인아이디-> "+session.getAttribute("id"));
		String loginId = (String)session.getAttribute("id");
		int msgYet = msgService.selectMsgYetReadCount(loginId);
		MemberDTO dto = mservice.selectOneMemberService(loginId);
		request.setAttribute("memberDTO", dto);
		request.setAttribute("msg", msgYet);
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

	//메일확인
		@ResponseBody
		@RequestMapping("email.do")
		public String emailajax(String email) {
				boolean check=mservice.create(email);
			if(check)
			{return "true";}
			else return "false";
	}
	
	@RequestMapping("emailcheck")
	public String checkJSP()  {		
		System.out.println("인증");
		return "member/emailcheck";
	}
	@ResponseBody
	@RequestMapping("authkey.do")
	public String  authkey(String key)  {
	System.out.println(session.getAttribute("authkey"));
		if(key.equals((String) session.getAttribute("authkey")))
		return "true";
		else
		return "false";
	}
}

