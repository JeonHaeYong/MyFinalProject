package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.DisappearCommentsDAO;
import kh.spring.dto.DisappearCommentsDTO;

@Repository
public class DisappearCommentsDAOImpl implements DisappearCommentsDAO{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insertDisappearComment(DisappearCommentsDTO dto) {//후기게시판 댓글 등록(insert)
		return sst.insert("DisappearCommentsDAO.insertDisappearComment", dto);
	}

	@Override
	public int modifyDisappearComment(DisappearCommentsDTO dto) {
		return sst.update("DisappearCommentsDAO.modifyDisappearComment", dto);
	}

	@Override
	public int deleteDisappearComment(int Disappear_seq) {
		System.out.println("삭제할 댓글:" + Disappear_seq);
		
		return sst.delete("DisappearCommentsDAO.deleteDisappearComment", Disappear_seq);
	}
	@Override
	public List<DisappearCommentsDTO> selectDisappearCommentsPerPage(int start, int end){
		System.out.println("selectDisappearCommentsPerPage:"+ start + ":" + end);

		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return sst.selectList("DisappearCommentsDAO.selectDisappearCommentsPerPage", param);
	}

	@Override
	public Map<String, Integer> getNaviForDisappearComments(int commentPage) {
		return null;
	}

	@Override
	public List<DisappearCommentsDTO> selectAllDisappearCommentsByDisappearSeq(int seq , int start, int end) {
		Map<String, Object> param = new HashMap<>();
		System.out.println("selectAllDisappearCommentsByDisappearSeq:"+seq +":"+ start + ":" + end);
		param.put("seq", seq);
		param.put("start", start);
		param.put("end", end);
		return sst.selectList("DisappearCommentsDAO.selectAllDisappearCommentsByDisappearSeq",param);
	}

	@Override
	public int selectDisappearCommentsCountByDisappearSeq(int DisappearSeq) {
		return sst.selectOne("DisappearCommentsDAO.selectDisappearCommentsCountByDisappearSeq",DisappearSeq);
	}

	@Override
	public int updateDisappearCommentsLike(int seq) {//댓글좋아요수 + 1
		return sst.update("DisappearCommentsDAO.updateDisappearCommentsLike",seq);
	}

	@Override
	public int updateDisappearCommentsLikeMinus(int seq) {
		return sst.update("DisappearCommentsDAO.updateDisappearCommentsLikeMinus",seq);
	}

	@Override
	public int selectDisappearCommentsSeqCurrVal() {
		return sst.selectOne("DisappearCommentsDAO.selectDisappearCommentsSeqCurrVal");
	}

	@Override
	public DisappearCommentsDTO selectDisappearCommentsBySeq(int seq) {
		return sst.selectOne("DisappearCommentsDAO.selectDisappearCommentsBySeq",seq);
	}

	@Override
	public int updateReplyContentsByseq(DisappearCommentsDTO dto) {
		return sst.update("DisappearCommentsDAO.updateReplyContentsByseq",dto);
	}

	@Override
	public DisappearCommentsDTO selectDTOBySeq(int seq) {
		return sst.selectOne("DisappearCommentsDAO.selectDTOBySeq",seq);
	}

}
