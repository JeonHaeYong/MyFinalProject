package kh.spring.fin;

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
	private ReviewCommentsService rcService;
	
	@ResponseBody
	@RequestMapping(value="insertReviewComment" ,produces = "application/text; charset=utf8")
	public String insertReviewComment(ReviewCommentsDTO dto) {//ajax로 댓글 insert하기
		int result = rcService.insertReviewCommentService(dto);
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value="reviewCommentsLikeClick" ,produces = "application/text; charset=utf8")
	public String reviewCommentsLikeClick(ReviewCommentsLikesDTO dto) {//어떤 댓글에 좋아요 눌렀을때,
		//트랜잭션처리
		//insert -> 누른사람 / 몇번seq의 댓글에 좋아요누른건지 // 몇번seq의 댓글의  dto의 좋아요 수 update 
		return "";
	}
	
}
