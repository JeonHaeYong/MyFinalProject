package kh.spring.service;

import java.util.List;

import kh.spring.dto.DisappearCommentsDTO;


public interface DisappearCommentsService {
	public int insertDisappearCommentService(DisappearCommentsDTO dto);
	public int modifyDisappearCommentService(DisappearCommentsDTO dto);
	public int deleteDisappearCommentService(int seq);
	public List<DisappearCommentsDTO> selectAllDisappearCommentsService(int seq , int commentPage,String loginId);
	public int[] getRecordPerPageStartEnd(int currentPage);
	public int getDisappearCommentsCountByDisappearSeq(int DisappearSeq);
	public List<String> getNaviForDisappearCommentsList(int DisappearSeq, int currentPage);
	public DisappearCommentsDTO selectDisappearCommentsDTOByCurrValSeq();
	public int updateReplyContentsByseq(DisappearCommentsDTO dto);
	public DisappearCommentsDTO selectDTOBySeq(int seq);
}
