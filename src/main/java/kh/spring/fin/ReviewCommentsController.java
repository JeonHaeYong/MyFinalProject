package kh.spring.fin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.ReviewCommentsDTO;
import kh.spring.dto.ReviewCommentsLikesDTO;
import kh.spring.service.ReviewCommentsService;

@Controller
public class ReviewCommentsController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ReviewCommentsService rcService;
	
	@RequestMapping(value="insertReviewComment" ,produces = "application/text; charset=utf8")
	public String insertReviewComment(HttpServletRequest request , ReviewCommentsDTO dto) {//ajax로 댓글 insert하기
		String loginId = (String)session.getAttribute("id");
		if(!loginId.equals(dto.getWriter())) {
			return "redirect:error";
		}
		int result = rcService.insertReviewCommentService(dto);
		if(result!=1) {
			return "redirect:error";
		}
		int seq = dto.getReview_seq();
		//해당 글의 댓글 가져오기
		List<ReviewCommentsDTO> list = rcService.selectAllReviewCommentsService(seq,1,loginId);
		//(댓글 navi)
		List<String> reply_navi = rcService.getNaviForReviewCommentsList(seq, 1);
		request.setAttribute("replyList", list);
		request.setAttribute("reply_navi", reply_navi);
		return "review/reply_templet";
	}
	
	@ResponseBody
	@RequestMapping(value="reviewCommentsLikeClick" ,produces = "application/text; charset=utf8")
	public String reviewCommentsLikeClick(ReviewCommentsLikesDTO dto) {//어떤 댓글에 좋아요 눌렀을때,
		//트랜잭션처리
		//insert -> 누른사람 / 몇번seq의 댓글에 좋아요누른건지 // 몇번seq의 댓글의  dto의 좋아요 수 update 
		int result = rcService.reviewCommentsLikeClick(dto);
		System.out.println("댓글좋아요클릭 -> 트랜잭션처리 -> 결과 2 --> "+result);
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value="reviewCommentsLikeCancel" ,produces = "application/text; charset=utf8")
	public String reviewCommentsLikeCancel(ReviewCommentsLikesDTO dto) {//어떤 댓글의 좋아요를 취소할때,
		//트랜잭션처리
		//delete -> 누른사람 / 몇번seq의 댓글에 좋아요누른건지 // 몇번seq의 댓글의  dto의 좋아요 수 -1 update 
		int result = rcService.reviewCommentsLikeCancel(dto);
		System.out.println("댓글좋아요클릭해제 -> 트랜잭션처리 -> 결과 2 --> "+result);
		return result+"";
	}
	
	@RequestMapping(value="clickReplyNavi" ,produces = "application/text; charset=utf8")
	public String clickReplyNavi(HttpServletRequest request , String seqStr , String currentPageStr) {
		int seq = Integer.parseInt(seqStr);
		int currentPage = Integer.parseInt(currentPageStr);
		String loginId = (String)session.getAttribute("id");
		//해당 글의 댓글 가져오기
		List<ReviewCommentsDTO> list = rcService.selectAllReviewCommentsService(seq,currentPage,loginId);
		//(댓글 navi)
		List<String> reply_navi = rcService.getNaviForReviewCommentsList(seq, currentPage);
		request.setAttribute("replyList", list);
		request.setAttribute("reply_navi", reply_navi);
		return "review/reply_templet";
	}
}
