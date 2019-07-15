package kh.spring.service;

import java.util.List;

import kh.spring.dto.MessageDTO;

public interface MessageService {
	public int selectMsgYetReadCount(String id);
	public int insertMsg_service(MessageDTO dto);
	public List<MessageDTO> selectAllMsgByCurrentPage_sent(String id , String currentPage);
	public List<MessageDTO> selectAllMsgByCurrentPage_received(String id ,String currentPage);
	public int updateReadOkToYes(String seq);
}
