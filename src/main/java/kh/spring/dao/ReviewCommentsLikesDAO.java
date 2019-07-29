package kh.spring.dao;

import kh.spring.dto.ReviewCommentsLikesDTO;

public interface ReviewCommentsLikesDAO {
	public int insertReviewCommentsLike(ReviewCommentsLikesDTO dto);//좋아요 누르면 insert하기.
	public int deleteReviewCommentsLike(ReviewCommentsLikesDTO dto);//좋아요 취소하면 delete하기.
	public int deleteReviewCommentLiked(int seq); //review글 삭제되면, 그 글안의 댓글의 좋아요 리스트 모두 삭제하기.
	public int updateWithdrawalId(String id);
}
