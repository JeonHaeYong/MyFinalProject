package kh.spring.dao;

import java.util.List;

import kh.spring.dto.MessageDTO;

public interface MessageDAO {
	public int selectMsgYetReadCount(String id);
	public int insertMsg(MessageDTO dto);
	public List<MessageDTO> selectAllMsgByCurrentPage_sent(String id, int start , int end);
	public List<MessageDTO> selectAllMsgByCurrentPage_received(String id, int start , int end);
	public int updateReadOkToYes(String seq);
}
