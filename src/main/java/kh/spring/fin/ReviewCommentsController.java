package kh.spring.fin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.ReviewCommentsDTO;
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
	
}
