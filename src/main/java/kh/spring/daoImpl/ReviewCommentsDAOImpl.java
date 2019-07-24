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
	public int insertReviewComment(ReviewCommentsDTO dto) {//후기게시판 댓글 등록(insert)
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

	@Override
	public List<ReviewCommentsDTO> selectAllReviewCommentsByReviewSeq(int seq , int start, int end , String loginId) {
		Map<String, Object> param = new HashMap<>();
		if(loginId!=null) {
			param.put("id", loginId);
		}
		param.put("seq", seq);
		param.put("start", start);
		param.put("end", end);
		return sst.selectList("ReviewCommentsDAO.selectAllReviewCommentsByReviewSeq",param);
	}

	@Override
	public int selectReviewCommentsCountByReviewSeq(int reviewSeq) {
		return sst.selectOne("ReviewCommentsDAO.selectReviewCommentsCountByReviewSeq",reviewSeq);
	}

	@Override
	public int updateReviewCommentsLike(int seq) {//댓글좋아요수 + 1
		return sst.update("ReviewCommentsDAO.updateReviewCommentsLike",seq);
	}

	@Override
	public int updateReviewCommentsLikeMinus(int seq) {
		return sst.update("ReviewCommentsDAO.updateReviewCommentsLikeMinus",seq);
	}

	@Override
	public int selectReviewCommentsSeqCurrVal() {
		return sst.selectOne("ReviewCommentsDAO.selectReviewCommentsSeqCurrVal");
	}

	@Override
	public ReviewCommentsDTO selectReviewCommentsBySeq(int seq) {
		return sst.selectOne("ReviewCommentsDAO.selectReviewCommentsBySeq",seq);
	}

	@Override
	public int updateReplyContentsByseq(ReviewCommentsDTO dto) {
		return sst.update("ReviewCommentsDAO.updateReplyContentsByseq",dto);
	}

	@Override
	public ReviewCommentsDTO selectDTOBySeq(int seq) {
		return sst.selectOne("ReviewCommentsDAO.selectDTOBySeq",seq);
	}

}
