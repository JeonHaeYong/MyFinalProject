package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.ReviewCommentsDAO;
import kh.spring.dto.ReviewCommentsDTO;

@Repository
public class ReviewCommentsDAOImpl implements ReviewCommentsDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insertReviewComment(ReviewCommentsDTO dto) {
		return sst.insert("ReviewCommentsDAO.insertReviewComment", dto);
	}

	@Override
	public int modifyReviewComment(ReviewCommentsDTO dto) {
		return sst.update("ReviewCommentsDAO.modifyReviewComment", dto);
	}

	@Override
	public int deleteReviewComment(int review_seq) {
		return sst.delete("ReviewCommentsDAO.deleteReviewComment", review_seq);
	}

	@Override
	public List<ReviewCommentsDTO> selectAllReviewComments() {
		return sst.selectList("ReviewCommentsDAO.selectAllReviewComments");
	}

	@Override
	public List<ReviewCommentsDTO> selectReviewCommentsPerPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return sst.selectList("ReviewCommentsDAO.selectReviewCommentsPerPage", param);
	}

	@Override
	public Map<String, Integer> getNaviForReviewComments(int commentPage) {
		return null;
	}

}
