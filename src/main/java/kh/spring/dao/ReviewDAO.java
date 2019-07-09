package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ReviewDTO;

public interface ReviewDAO {
	public int insertReview(ReviewDTO dto);
	public List<ReviewDTO> selectAllReview();
	public int modifyReview(ReviewDTO dto);
	public int deleteReview(int seq);
	public List<ReviewDTO> selectReviewPerPage(int start, int end);
	public int getReviewCount();
	public Map<String, Integer> getNaviForReview(int currentPage);
}