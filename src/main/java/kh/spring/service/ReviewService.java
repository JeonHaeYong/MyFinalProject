package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ReviewDTO;

public interface ReviewService {
	public int insertReviewService(ReviewDTO dto);
	public List<ReviewDTO> selectAllReviewByCurrentpage(String currentPage);
	public int deleteReviewService(int seq);
	public int deleteReviewService(String[] seq);
	public List<ReviewDTO> selectReviewPerPageService(int start, int end);
	public List<String> getNaviForReviewList(int currentPage);
	public ReviewDTO selectReviewBySeq(int seq);
	public int updateViewCount(int seq);
}
