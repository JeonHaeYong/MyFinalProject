package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.dao.ReviewCommentsLikesDAO;
import kh.spring.dto.ReviewCommentsLikesDTO;

public class ReviewCommentsLikesDTOImpl implements ReviewCommentsLikesDAO{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insertReviewCommentsLike(ReviewCommentsLikesDTO dto) {
		return sst.insert("ReviewCommentsLikesDAO.insertReviewCommentsLike",dto);
	}

}
