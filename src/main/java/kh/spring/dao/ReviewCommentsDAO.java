package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ReviewCommentsDTO;

public interface ReviewCommentsDAO {
	public int insertReviewComment(ReviewCommentsDTO dto);
	public int modifyReviewComment(ReviewCommentsDTO dto);
	public int deleteReviewComment(int seq);//review삭제되면, 해당 글의 댓글모두삭제
	public List<ReviewCommentsDTO> selectAllReviewCommentsByReviewSeq(int seq , int start, int end , String loginId);
	public List<ReviewCommentsDTO> selectReviewCommentsPerPage(int start, int end);
	public Map<String, Integer> getNaviForReviewComments(int commentPage);
	public int selectReviewCommentsCountByReviewSeq(int reviewSeq);
	public int updateReviewCommentsLike(int seq);
	public int updateReviewCommentsLikeMinus(int seq);
	public int selectReviewCommentsSeqCurrVal();
	public ReviewCommentsDTO selectReviewCommentsBySeq(int seq);
}
