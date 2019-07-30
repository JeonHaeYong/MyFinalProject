package kh.spring.fin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MessageDTO;
import kh.spring.service.MemberService;
import kh.spring.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService memService;

	@RequestMapping("insertMsg")
	public String insertMsg_loginCheck(HttpServletRequest request, MessageDTO dto) {
		System.out.println("보낸사람:"+dto.getSender()+"/받는사람:"+dto.getRecipient()+"/내용"+dto.getContents());
		//		int count=0;
		//		while(true) {
		//			dto.setSender(dto.getSender()+(++count));
		//			dto.setContents(dto.getContents()+(count));
		//			int insertResult = msgService.insertMsg_service(dto);
		//			System.out.println("입력결과-> " + insertResult);
		//			if(count>30) {
		//				System.out.println("count->"+count);
		//				break;
		//			}
		//		}
		String contents = dto.getContents();
		contents = contents.replaceAll("<", "'").replaceAll(">", "'").replaceAll("\"", "");
		dto.setContents(contents);
		int insertResult = msgService.insertMsg_service(dto);
		System.out.println("입력결과-> " + insertResult);
		String referer = request.getHeader("referer");
		referer = referer.replaceAll("^http://.+?/", "");
		return "redirect:" + referer;
	}

	@ResponseBody
	@RequestMapping("updateReadOk")
	public String updateReadOk(String seq) {
		int result = msgService.updateReadOkToYes(seq);
		if(result==2) {
			session.setAttribute("msg", (int)session.getAttribute("msg")-1);
		}
		return result+"";
	}

	@RequestMapping("deleteMsg")
	public String deleteMsgBySeq(HttpServletRequest request) {
		String[] seq = request.getParameterValues("msgSeq");
		int result = msgService.deleteMsgBySeq(seq);
		System.out.println(result+"행 삭제되었습니다.");
		int type = (int)session.getAttribute("type");
		if(type==4) {
			return "redirect:admin-msg";
		}
		return "redirect:toMyPage_message";
	}

	//쪽지함에서 page navi눌렀을때,
	@RequestMapping(value = "ClickMsgNavi" ,produces = "application/text; charset=utf8")
	public String ClickMsgNavi(HttpServletRequest request , String category , String currentPage) { //ajax
		String id = (String)session.getAttribute("id");
		int page = Integer.parseInt(currentPage);
		//페이지에 띄울 쪽지 리스트 가져오기
		List<MessageDTO> list = msgService.selectAllMsgByCurrentPage(category,id, page);
		//페이지 navi담기.
		List<String> navi = msgService.getNaviforMsg(page, category, id);
		request.setAttribute("currentPage", currentPage);
		if(category.equals("recipient")) {
			request.setAttribute("receivedList", list);
			request.setAttribute("receivedNavi", navi);
			return "myPage/user/received_msg_template";
		}else {
			request.setAttribute("sentList", list);
			request.setAttribute("sentNavi", navi);
			return "myPage/user/sent_msg_template";
		}
	}
	
	@ResponseBody
	@RequestMapping("sendInquire")
	public String sendInquire(String email , String contents) {
		if(email==null||contents==null) {
			return "error";
		}
		contents = contents.replaceAll("<", "'").replaceAll(">", "'").replaceAll("\"", "");
		MessageDTO dto = new MessageDTO();
		dto.setContents(contents);
		dto.setSender(email);
		List<String> adminList = memService.selectAllType4();
		int insertResult = 0;
		for(String admin : adminList ) {
			dto.setRecipient(admin);
			insertResult += msgService.insertMsg_service(dto);
		}
		if(insertResult==adminList.size()) {
			return "true";
		}
		return "false";
	}
	




}
