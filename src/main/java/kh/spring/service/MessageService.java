package kh.spring.service;

import java.util.List;

import kh.spring.dto.MessageDTO;

public interface MessageService {
	public int selectMsgYetReadCount(String id);
	public int insertMsg_service(MessageDTO dto);
	public List<MessageDTO> selectAllMsgByCurrentPage(String type, String id , int currentPage);
	public int updateReadOkToYes(String seq);//readOk 를 'N' -> 'Y' 로 업데이트하기.
	public List<String> getNaviforMsg(int currentPage,String type,String id);
}
