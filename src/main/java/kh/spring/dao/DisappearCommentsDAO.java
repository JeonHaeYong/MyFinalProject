package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.DisappearCommentsDTO;



public interface DisappearCommentsDAO {
	public int insertDisappearComment(DisappearCommentsDTO dto);
	public int modifyDisappearComment(DisappearCommentsDTO dto);
	public int deleteDisappearComment(int seq);//Disappear삭제되면, 해당 글의 댓글모두삭제
	public List<DisappearCommentsDTO> selectAllDisappearCommentsByDisappearSeq(int seq , int start, int end);
	public List<DisappearCommentsDTO> selectDisappearCommentsPerPage(int start, int end);
	public Map<String, Integer> getNaviForDisappearComments(int commentPage);
	public int selectDisappearCommentsCountByDisappearSeq(int DisappearSeq);
	public int updateDisappearCommentsLike(int seq);
	public int updateDisappearCommentsLikeMinus(int seq);
	public int selectDisappearCommentsSeqCurrVal();
	public DisappearCommentsDTO selectDisappearCommentsBySeq(int seq);
	public int updateReplyContentsByseq(DisappearCommentsDTO dto);
	public DisappearCommentsDTO selectDTOBySeq(int seq);
}
