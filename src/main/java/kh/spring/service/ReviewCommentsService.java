package kh.spring.service;

import java.util.List;

import kh.spring.dto.ReviewCommentsDTO;

public interface ReviewCommentsService {
	public int insertReviewCommentService(ReviewCommentsDTO dto);
	public int modifyReviewCommentService(ReviewCommentsDTO dto);
	public int deleteReviewCommentService(int seq);
	public List<ReviewCommentsDTO> selectAllReviewCommentsService();
	public List<ReviewCommentsDTO> selectReviewCommentsPerPageService(int commentPage);
}
