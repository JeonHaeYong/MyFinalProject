package kh.spring.fin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ReviewDTO;
import kh.spring.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ReviewService rservice;
	
	@RequestMapping("toReviewList")
	public String toReviewList(HttpServletRequest request , String currentPage) {
		if(currentPage==null) {
			currentPage = "1";
		}
		//list넘기기
		List<ReviewDTO> reviewList = rservice.selectAllReviewByCurrentpage(currentPage);
		request.setAttribute("reviewList", reviewList);
		//navi넘기기
		List<String> navi = rservice.getNaviForReviewList(Integer.parseInt(currentPage));
		request.setAttribute("navi", navi);
		return "review/meet_reviewList";
	}
	@RequestMapping("toWriteReview")
	public String toWriteReview() {
		return "review/writeReviewForm";
	}
	@RequestMapping("insertReview")
	public String insertReview(ReviewDTO dto) {
		int result = rservice.insertReviewService(dto);
		System.out.println("후기작성이 "+ result+"개 입력 완료되었습니다");
		return "redirect:toReviewList";
	}
}
