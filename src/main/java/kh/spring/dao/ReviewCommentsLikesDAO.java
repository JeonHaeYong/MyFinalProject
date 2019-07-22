package kh.spring.dao;

import kh.spring.dto.ReviewCommentsLikesDTO;

public interface ReviewCommentsLikesDAO {
	public int insertReviewCommentsLike(ReviewCommentsLikesDTO dto);//좋아요 누르면 insert하기
}
