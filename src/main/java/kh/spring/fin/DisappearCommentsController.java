package kh.spring.fin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.DisappearCommentsDTO;
import kh.spring.service.DisappearCommentsService;
@Controller
public class DisappearCommentsController {
	@Autowired
	private HttpSession session;
	@Autowired
	private DisappearCommentsService dcService;
	
	@RequestMapping(value="insertDisappearComment" ,produces = "application/text; charset=utf8")
	public String insertDisappearComment(HttpServletRequest request , DisappearCommentsDTO dto, String seqStr) {//ajax로 댓글 insert하기
		System.out.println(seqStr);
		String loginId = (String)session.getAttribute("id");
		if(!loginId.equals(dto.getWriter())) {
			return "redirect:error";
		}
		
		dto.setDisappear_seq(Integer.parseInt(seqStr));
		int result = dcService.insertDisappearCommentService(dto);
		if(result!=1) {
			System.out.println("result--->>"+result);
			return "redirect:error";
		}
		int seq = dto.getDisappear_seq();

		//해당 글의 댓글 가져오기
		List<DisappearCommentsDTO> list = dcService.selectAllDisappearCommentsService(seq,1);
		//(댓글 navi)
		List<String> reply_navi = dcService.getNaviForDisappearCommentsList(seq, 1);
		request.setAttribute("replyList", list);
		request.setAttribute("reply_navi", reply_navi);
		return "disappear/comments";
	}
	
	
	@RequestMapping(value="clickCommentNavi" ,produces = "application/text; charset=utf8")
	public String clickReplyNavi(HttpServletRequest request , String seqStr , String currentPageStr) {
		int seq = Integer.parseInt(seqStr);
		int currentPage = Integer.parseInt(currentPageStr);
		String loginId = (String)session.getAttribute("id");
		//해당 글의 댓글 가져오기
		List<DisappearCommentsDTO> list = dcService.selectAllDisappearCommentsService(seq,currentPage);
		//(댓글 navi)
		List<String> reply_navi = dcService.getNaviForDisappearCommentsList(seq, currentPage);
		request.setAttribute("replyList", list);
		request.setAttribute("reply_navi", reply_navi);
		return "disappear/comments";
	}
	
	@ResponseBody
	@RequestMapping(value="updateCommentContents",produces = "application/text; charset=utf8")
	public String updateReplyContents(HttpServletRequest request , DisappearCommentsDTO dto) {
		dcService.updateReplyContentsByseq(dto);
		return	dto.getContents();
	}
	
	@RequestMapping(value="deleteComment",produces = "application/text; charset=utf8")
	public String deleteReply(HttpServletRequest request , DisappearCommentsDTO dto) {
		
		String loginId = (String)session.getAttribute("id");
		String writer = dto.getWriter();
		dto  = dcService.selectDTOBySeq(dto.getSeq());
		int seq = dto.getDisappear_seq();
		
		System.out.println(writer);
		System.out.println(dto.getWriter());
		System.out.println(loginId);
		
		if(!writer.equals(dto.getWriter())||!loginId.equals(writer)) {
			return "redirect:error";
		}
		try {
		dcService.deleteDisappearCommentService(dto.getSeq());
		}catch(Exception e) {
			e.printStackTrace();
		}System.out.println("댓글 삭제~~"+dto.getSeq());
		//해당 글의 댓글 가져오기
		List<DisappearCommentsDTO> list = dcService.selectAllDisappearCommentsService(seq,1);
		//(댓글 navi)
		List<String> reply_navi = dcService.getNaviForDisappearCommentsList(seq, 1);
		request.setAttribute("replyList", list);
		request.setAttribute("reply_navi", reply_navi);
		return "disappear/comments";
	}
}
