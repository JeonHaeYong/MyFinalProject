package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.ReviewCommentsLikesDAO;
import kh.spring.dto.ReviewCommentsLikesDTO;

@Repository
public class ReviewCommentsLikesDAOImpl implements ReviewCommentsLikesDAO{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insertReviewCommentsLike(ReviewCommentsLikesDTO dto) {
		return sst.insert("ReviewCommentsLikesDAO.insertReviewCommentsLike",dto);
	}

	@Override
	public int deleteReviewCommentsLike(ReviewCommentsLikesDTO dto) {
		return sst.delete("ReviewCommentsLikesDAO.deleteReviewCommentsLike",dto);
	}

	@Override
	public int deleteReviewCommentLiked(int seq) {
		return sst.delete("ReviewCommentsLikesDAO.deleteReviewCommentLiked",seq);
	}
	
	@Override
	public int updateWithdrawalId(String id) {
		return sst.update("ReviewCommentsLikesDAO.updateWithdrawalId", id);
	}

}
