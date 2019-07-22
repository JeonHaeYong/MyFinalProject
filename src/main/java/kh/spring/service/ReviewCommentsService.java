package kh.spring.service;

import java.util.List;

import kh.spring.dto.ReviewCommentsDTO;
import kh.spring.dto.ReviewCommentsLikesDTO;

public interface ReviewCommentsService {
	public int insertReviewCommentService(ReviewCommentsDTO dto);
	public int modifyReviewCommentService(ReviewCommentsDTO dto);
	public int deleteReviewCommentService(int seq);
	public List<ReviewCommentsDTO> selectAllReviewCommentsService(int seq , int commentPage,String loginId);
	public List<String> getNaviForReviewCommentsList(int Reviewseq, int currentPage);
	public int getReviewCommentsCountByReviewSeq(int reviewSeq);
	public int reviewCommentsLikeClick(ReviewCommentsLikesDTO dto);
	public int reviewCommentsLikeCancel(ReviewCommentsLikesDTO dto);
	public ReviewCommentsDTO selectReviewCommentsDTOByCurrValSeq();
}
