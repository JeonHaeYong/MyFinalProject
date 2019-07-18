package kh.spring.fin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MessageDTO;
import kh.spring.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;

	@RequestMapping("insertMsg")
	public String insertMsg(MessageDTO dto) {
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
		int insertResult = msgService.insertMsg_service(dto);
		System.out.println("입력결과-> " + insertResult);
		return "redirect:toMyPage_message";
	}
	
	@ResponseBody
	@RequestMapping("updateReadOk")
	public String updateReadOk(String seq) {
		return msgService.updateReadOkToYes(seq)+"";
	}
	
	@RequestMapping("deleteMsg")
	public String deleteMsgBySeq(HttpServletRequest request) {
		String[] seq = request.getParameterValues("msgSeq");
		int result = msgService.deleteMsgBySeq(seq);
		System.out.println(result+"행 삭제되었습니다.");
		return "redirect:toMyPage_message";
	}
}
