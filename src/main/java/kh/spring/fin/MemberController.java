package kh.spring.fin;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.MessageDTO;
import kh.spring.dto.PaymentDTO;
import kh.spring.loginapi.NaverLoginBO;
import kh.spring.loginapi.kakao_restapi;
import kh.spring.service.MemberService;
import kh.spring.service.MessageService;
import kh.spring.service.PaymentService;

@Controller
public class MemberController {


	@Autowired
	private MemberService mservice;
	@Autowired
	private MessageService msgService;
	@Autowired
	private PaymentService ps;
	@Autowired
	private HttpSession session;


	//로그인
	@RequestMapping("login")
	public String login(MemberDTO dto) {
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
				MemberDTO mdto=mservice.selectOneMemberService(dto.getId());					
				session.setAttribute("type", mdto.getType());
				}
				
				return "redirect:/";	
			}
		
		catch(Exception e) {
			e.printStackTrace();
			return "/loginfail";
		}

	}
	//로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return  "redirect:/";
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
	//아이디중복확인
	@ResponseBody
	@RequestMapping("idajax.do")
	public String idajax(HttpServletRequest request) {
		int idcheck=mservice.idDuplCheckService(request.getParameter("id"));
		if(idcheck==1)
		{return "true";}
		else return "false";
	}
	//이메일 인증 확인
	@ResponseBody
	@RequestMapping("email.do") // 이메일로 인증번호 보내는거 
	public String emailajax(String email) {
		boolean check=mservice.create(email);
		if(check)
		{return "true";} // 이메일 인증번호 쓰는창뜸
		else return "false";
	}

	@RequestMapping("emailcheck") //오프너 열라고 
	public String checkJSP()  {		
		System.out.println("인증");
		return "member/emailcheck";
	}
	@ResponseBody
	@RequestMapping("authkey.do") // 인증번호랑 회원이 쓴거랑 같은지 확인
	public String  authkey(String key)  {
		System.out.println(session.getAttribute("authkey"));
		if(key.equals((String) session.getAttribute("authkey")))
			return "true";
		else
			return "false";
	}
	//네이버 로그인

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;


	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}



	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,MemberDTO dto)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터


		/** apiResult json 구조
		        {"resultcode":"00",
		        "message":"success",
		        "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		//2. String형식인 apiResult를 json형태로 바꿈
		JsonParser parser = new JsonParser();
		Object obj = parser.parse(apiResult);
		JsonObject jsonObj = (JsonObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JsonObject response_obj = (JsonObject)jsonObj.get("response");

		System.out.println(response_obj);

		//response의  파싱
		String id=response_obj.get("id").getAsString();        		
		String nickname = response_obj.get("nickname").getAsString();
		//String age=response_obj.get("age").getAsString();
		String gender=response_obj.get("gender").getAsString();
		String email=response_obj.get("email").getAsString();
		//String name=response_obj.get("name").getAsString();	        

		//memberDTO 에 set하기 
		dto.setId("N_"+id);
		dto.setType(2);
		dto.setName(nickname);
		dto.setGender(gender);
		dto.setEmail(email);
		try{
			if(mservice.idDuplCheckService("N_"+id)>0)
			{
				session.setAttribute("id","N_"+id); //세션 생성
				System.out.println("네이버 로그인 성공");
				return "redirect:/";
			}	
			else {		
				if(	mservice.insertNaverJoin(dto)>0) {
					session.setAttribute("id","N_"+id); //세션 생성
					System.out.println("네이버 로그인 성공");
					return "redirect:/";

				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		//4.파싱 닉네임 세션으로 저장
		/*session.setAttribute("id",id); //세션 생성
			model.addAttribute("result", apiResult);*/

		return "redirect:/";

	}
	//카카오
	private kakao_restapi kakao_restapi = new kakao_restapi();
	@RequestMapping(value = "/oauth", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session,MemberDTO dto) {
		System.out.println("로그인 할때 임시 코드값");
		//카카오 홈페이지에서 받은 결과 코드
		System.out.println(code);
		System.out.println("로그인 후 결과값");
		//카카오 rest api 객체 선언
		kakao_restapi kr = new kakao_restapi();
		//결과값을 node에 담아줌
		System.out.println(kr);
		JsonNode node = kr.getAccessToken(code);
		//결과값 출력
		System.out.println(node);
		//노드 안에 있는 access_token값을 꺼내 문자열로 변환
		String token = node.get("access_token").toString();
		//세션에 담아준다.
		session.setAttribute("token", token);
		//사용자 정보 요청


		JsonNode userInfo = kr.getKakaoUserInfo(token);
		// Get id
		String id = userInfo.path("id").asText();//아이디값
		String nickname = null;	 //닉네임
		String kaccount_email =userInfo.path("kaccount_email").asText(); //이메일

		// 유저정보 카톡에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		if (properties.isMissingNode()) {
			// if "name" node is missing

		} else {
			nickname = properties.path("nickname").asText();
		}

		try{
			if(mservice.idDuplCheckService("k_"+id)>0)
			{
				session.setAttribute("id","k_"+id); //세션 생성
				System.out.println("카카오 로그인 성공");
				return "redirect:/";
			}
			else {
				dto.setId("k_"+id);
				dto.setName(nickname);
				dto.setEmail(kaccount_email);
				dto.setType(3);

				if(	mservice.insertNaverJoin(dto)>0) {
					session.setAttribute("id","k_"+id); //세션 생성
					System.out.println("네이버 로그인 성공");
					return "redirect:/";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/";
	}


	//-----------------------------마이페이지 	
	//마이페이지 -> aop로 user정보랑 안읽은메세지 갯수 request에 담기
	@RequestMapping("toMyPage")
	public String toMyPage_loginCheck(HttpServletRequest request) {
		MemberDTO dto = (MemberDTO)request.getAttribute("memberDTO");
		int type= dto.getType();
		System.out.println("관리자확인->" + type);
		if(type==4) {//관리자라면
			return "myPage/admin/admin_chart";
		}
		return "myPage/user/user_myPage_profile";
	}

	//내정보 -> 비밀번호 변경시 입력한 현재비밀번호가 맞는 비밀번호인지 확인
	@ResponseBody
	@RequestMapping("currPwCheck")
	public String currPwCheck(String id , String pw) {
		int result = mservice.isLoginOkService(id, pw);
		if(result==0) {
			return "false";
		}
		return "true";
	}
	//마이페이지에서 pw변경
	@RequestMapping("modifyPwByMyPage")
	public String modifyPwByMyPage(String id, String pw) {
		int result = mservice.updatePwService(id, pw);
		System.out.println("ID:"+id+"의 pw변경이 " + result +"행 완료되었습니다.");
		return "redirect:toMyPage";
	}

	//정보수정하기(id,pw,email제외)
	@RequestMapping("modifyProfile")
	public String modifyProfileInfo(MemberDTO dto) {
		System.out.println(dto.toString());//값 제대로 넘어오는것 확인
		//id에 대해 업데이트 하기.
		int result = mservice.updateMemberInfoByMyPage(dto);
		System.out.println(dto.getId()+"님의 정보업데이트가 " +result+"행 완료되었습니다.");
		return "redirect:toMyPage";
	}

	@RequestMapping("toMyPage_writeList")
	public String toMyPage_writeList_loginCheck(HttpServletRequest request) {
		return "myPage/user/user_myPage_writeList";
	}

	@RequestMapping("toMyPage_support")
	public String toMyPage_support_loginCheck(HttpServletRequest request) {
		return "myPage/user/user_myPage_support";
	}

	@RequestMapping("toMyPage_buyList")
	public String toMyPage_buyList_loginCheck(HttpServletRequest request, String currentPage) {
		String id = (String)request.getSession().getAttribute("id");
		if(currentPage == null) {
			currentPage = "1";
		}
		List<PaymentDTO> buyList = ps.selectPaymentPerPageForBuyList(id, Integer.parseInt(currentPage));
		request.setAttribute("buyList", buyList);
		request.setAttribute("pageNavi", ps.getNaviForBuyList(id, Integer.parseInt(currentPage)));
		return "myPage/user/user_myPage_buyList";
	}

	@RequestMapping("toMyPage_message")
	public String toMyPage_message_loginCheck(HttpServletRequest request,String currentPage) {
		if(currentPage==null) {
			currentPage = "1";
		}
		int page = Integer.parseInt(currentPage);
		String loginId = (String)session.getAttribute("id");
		//페이지에 띄울 쪽지 리스트 담기.
		//받은쪽지
		List<MessageDTO> receivedList = msgService.selectAllMsgByCurrentPage("recipient",loginId, page);
		request.setAttribute("receivedList", receivedList);
		//보낸쪽지
		List<MessageDTO> sentList = msgService.selectAllMsgByCurrentPage("sender",loginId, page);
		request.setAttribute("sentList", sentList);

		//페이지 navi담기.
		//받은쪽지
		List<String> receivedNavi = msgService.getNaviforMsg(page, "recipient", loginId);
		request.setAttribute("receivedNavi", receivedNavi);
		//보낸쪽지
		List<String> sentNavi = msgService.getNaviforMsg(page, "sender", loginId);
		request.setAttribute("sentNavi", sentNavi);
		return "myPage/user/user_myPage_message";
	}
	/**
	 * 메세지 보낼때, 받는사람이 존재하는 id인지 확인
	 * @return
	 */
	@ResponseBody
	@RequestMapping("idExistOk")
	public String idExistOk(String id) {
		System.out.println(id);
		int exist = mservice.idDuplCheckService(id);
		//exist==1 존재 , 0이면 없음
		return exist+"";
	}
	//-----------------------------/마이페이지 




	//-----------------------------아이디 찾기 
	@RequestMapping("findId")
	public String findIdjsp(){
		return "member/findId";
	}

	@ResponseBody
	@RequestMapping("findIdProc")
	public String findId(String idname,String email,String birthday) {
		System.out.println(idname);
		String id=mservice.FindId(idname,birthday);
		System.out.println(id);
		if(id==null)
		{return "null";

		}else {
			boolean check=mservice.FindIdbyemail(email,id);
			if(check) {
				return "true";
			}else
				return "false";
		}
	}

	//-비밀번호 찾기--------------------------------------------------------------------------------------------
	@RequestMapping("findPassword")
	public String findPassword() {
		return "member/findPassword";
	}
	@ResponseBody
	@RequestMapping("findPwProc")
	public String findPwProc(HttpServletRequest request) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		int idcheck=mservice.idDuplCheckService(request.getParameter("id"));
		String result = null;
		if(idcheck==1) { // 아이디 존재 여부
			boolean check = mservice.newPw(email);
			if(check){
				String newPw = (String)session.getAttribute("newPw");
				int update = mservice.updatePwService(id, newPw);
				if(update == 1) {
					result = "1";
				}
			}else{ result = "2"; }
		}else {
			System.out.println("아이디 존재 안함");
			result = "0";
		}

		return result;
	}

}




