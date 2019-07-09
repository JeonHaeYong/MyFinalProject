package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ReviewCommentsDTO;

public interface ReviewCommentsDAO {
	public int insertReviewComment(ReviewCommentsDTO dto);
	public int modifyReviewComment(ReviewCommentsDTO dto);
	public int deleteReviewComment(int seq);
	public List<ReviewCommentsDTO> selectAllReviewComments();
	public List<ReviewCommentsDTO> selectReviewCommentsPerPage(int start, int end);
	public Map<String, Integer> getNaviForReviewComments(int commentPage);
}
