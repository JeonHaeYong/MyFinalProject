package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ReviewDTO;

public interface ReviewService {
	public int insertReviewService(ReviewDTO dto);
	public List<ReviewDTO> selectAllReviewService();
	public int deleteReviewService(int seq);
	public List<ReviewDTO> selectReviewPerPageService(int start, int end);
	public Map<String, Integer> getNaviForReviewService(int currentPage);
}
