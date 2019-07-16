package kh.spring.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	/**
	 * 쪽지보낼때, insert 2번
	 */
	@Override
	@Transactional
	public int insertMsg_service(MessageDTO dto) {
		String recipient = dto.getRecipient();
		String sender = dto.getSender();
		//1. 받은사람의 메세지목록에 추가하기.
		dto.setOwner(recipient);
		dao.insertMsg(dto);
		//message_seq현재 val 얼마인지 가져오기.
		int subseq = dao.selectSeqCurrVal();
		//2. 보낸사람의 메세지 목록에 추가하기.
		dto.setOwner(sender);
		dto.setSubseq(subseq);
		return dao.insertMsg(dto);
	}

	@Override
	public List<MessageDTO> selectAllMsgByCurrentPage(String type, String id, int currentPage) {
		int[] start_end = this.getRecordPerPageStartEnd(currentPage); 
		//해당페이지의 start , end 구하기.
		List<MessageDTO> list = dao.selectAllMsgByCurrentPage(type, id, start_end[0], start_end[1]);
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

	/**
	 * 쪽지 읽음으로 처리하기.
	 */
	@Override
	public int updateReadOkToYes(String seq) {
		return dao.updateReadOkToYes(seq);
	}
	
	public int getMsgAllCount(String type, String id){
		return dao.getMsgAllCount(type,id);
	}
	/**
	 * 페이지 네비게이터
	 * @param currentPage
	 * @param type :받은쪽지 -> recipient , 보낸쪽지 -> sender
	 * @param id :쪽지함으로 접근한 ,로그인한 id
	 * @return
	 */
	@Override
	public List<String> getNaviforMsg(int currentPage,String type,String id){
		System.out.println(currentPage+":"+type+":"+id);
		//0.현재 내가 보고있는 페이지가 몇 페이지 인지

		//네비게이터 제작을 위한 3step
		//1. DB의 게시판테이블의 전체 레코드 갯수(글 갯수)가 몇개인지
		//-> select count(*) from board
		int recordTotalCount=this.getMsgAllCount(type, id);
		System.out.println("aaa"+recordTotalCount);
//		if(listSize==-1) {
//			recordTotalCount = this.getBoardCount();s
////			System.out.println(recordTotalCount+":recordTotalCount");
//		}else {
//			recordTotalCount = listSize;
//		}

		//2. 한 페이지에 몇개의 글이 보이게 할 것 인지
		int recordCountPerPage = MessageStatics.recordCountPerPage;

		//3. 한 페이지에 네비게이터가 총 몇개가 보이게 할 것인지
		int naviCountPerPage = MessageStatics.naviCountPerPage;

		//전체 페이지 수
		int pageTotalCount = (int)Math.ceil((double)recordTotalCount/recordCountPerPage);	

		//현재페이지 오류 검출 및 정정
		if(currentPage < 1) { //최소보다 작을경우
			currentPage = 1;	
		}else if(currentPage > pageTotalCount) { //가능한 페이지수 이상으로 넘어갈경우
			currentPage = pageTotalCount;
		}

		//현재있는 위치를 기준으로  시작페이지와 끝페이지의 정보를 얻어내야한다.
		int startNavi;	//현재있는 위치를 기준으로  시작페이지
		int endNavi;	//현재있는 위치를 기준으로 끝페이지
		startNavi = (currentPage-1)/naviCountPerPage*naviCountPerPage+1;
		endNavi = startNavi + (naviCountPerPage-1);
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		//왼쪽 오른쪽 표시
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		List<String> list = new ArrayList<>();
		if(needPrev) {
			list.add("<이전");
		}
		for(int i =startNavi ; i<=endNavi; i++) {
			list.add(i+"");
		}
		if(needNext) {
			list.add("다음>");
		}
		return list;
	}
	/**
	 * 선택한 쪽지 삭제하기
	 */
	@Override
	public int deleteMsgBySeq(String[] seq) {
		return dao.deleteMsgBySeq(seq);
	}
	
}
