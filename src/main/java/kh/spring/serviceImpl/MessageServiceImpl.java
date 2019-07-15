package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MessageDAO;
import kh.spring.dto.MessageDTO;
import kh.spring.service.MessageService;
import kh.spring.statics.MessageStatics;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDAO dao;
	
	@Override
	public int selectMsgYetReadCount(String id) {
		return dao.selectMsgYetReadCount(id);
	}

	@Override
	public int insertMsg_service(MessageDTO dto) {
		return dao.insertMsg(dto);
	}

	@Override
	public List<MessageDTO> selectAllMsgByCurrentPage_sent(String id, String currentPage) {
		System.out.println(currentPage);
		return null;
	}
	
	@Override
	public List<MessageDTO> selectAllMsgByCurrentPage_received(String id , String currentPage) {
		System.out.println(currentPage);
		if(currentPage==null) {
			currentPage = "1";
		}
		int page = Integer.parseInt(currentPage);
		int[] start_end = this.getRecordPerPageStartEnd(page); 
		//해당페이지의 start , end 구하기.
		List<MessageDTO> list = dao.selectAllMsgByCurrentPage_received(id, start_end[0], start_end[1]);
		return list;
	}
	
	/**
	 * 해당 페이지에 띄워야할 list얻기위해 begin , end
	 * @param currentPage
	 * @return
	 */
	public int[] getRecordPerPageStartEnd(int currentPage){
		int recordCountPerPage = MessageStatics.recordCountPerPage;

		int start = 1 + recordCountPerPage*(currentPage-1);
		int end = recordCountPerPage*currentPage;

		return new int[] {start,end};
	}

	@Override
	public int updateReadOkToYes(String seq) {
		return dao.updateReadOkToYes(seq);
	}
	
}
