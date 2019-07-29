package kh.spring.dao;

import java.util.List;

import kh.spring.dto.MessageDTO;

public interface MessageDAO {
	public int selectMsgYetReadCount(String id);
	public int insertMsg(MessageDTO dto);
	public List<MessageDTO> selectAllMsgByCurrentPage(String type, String id, int start , int end);
	public int updateReadOkToYes(String seq);
	public int getMsgAllCount(String type, String id);
	public int selectSeqCurrVal();
	public int deleteMsgBySeq(String[] seq);
	public int updateWithdrawalBysender(String id);//sender가 탈퇴했을때
	public int updateWithdrawalByrecipient(String id);//recipient가 탈퇴했을때
}
