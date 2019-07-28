package kh.spring.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.DisappearCommentsDAO;
import kh.spring.dao.ReviewCommentsLikesDAO;
import kh.spring.dto.DisappearCommentsDTO;
import kh.spring.service.DisappearCommentsService;
import kh.spring.statics.ReviewCommentsStatics;



@Service
public class DisappearCommentServiceImpl implements DisappearCommentsService{
	@Autowired
	private DisappearCommentsDAO dcdao;
	


	@Override
	public int insertDisappearCommentService(DisappearCommentsDTO dto) {
		return dcdao.insertDisappearComment(dto);
	}

	@Override
	public int modifyDisappearCommentService(DisappearCommentsDTO dto) {
		return dcdao.modifyDisappearComment(dto);
	}

	@Override
	public int deleteDisappearCommentService(int seq) {
		System.out.println("삭제할 댓글 서비스 :" + seq);
		return dcdao.deleteDisappearComment(seq);
	}

	@Override
	public List<DisappearCommentsDTO> selectAllDisappearCommentsService(int seq , int commentPage) {
		int[] start_end = this.getRecordPerPageStartEnd(commentPage);
		return dcdao.selectAllDisappearCommentsByDisappearSeq(seq,start_end[0],start_end[1]);
	}
	/**
	 * 해당 페이지에 띄워야할 list얻기위해 begin , end
	 * @param currentPage
	 * @return
	 */
	public int[] getRecordPerPageStartEnd(int currentPage){
		int recordCountPerPage = ReviewCommentsStatics.recordCountPerPage;

		int start = 1 + recordCountPerPage*(currentPage-1);
		int end = recordCountPerPage*currentPage;

		return new int[] {start,end};
	}
	
	public int getDisappearCommentsCountByDisappearSeq(int DisappearSeq) {
		return dcdao.selectDisappearCommentsCountByDisappearSeq(DisappearSeq);
	}
	/**
	 * 페이지 네비게이터
	 * @param currentPage
	 * @param
	 * @param 
	 * @return
	 */
	@Override
	public List<String> getNaviForDisappearCommentsList(int DisappearSeq, int currentPage){
		//0.현재 내가 보고있는 페이지가 몇 페이지 인지

		//네비게이터 제작을 위한 3step
		//1. DB의 게시판테이블의 전체 레코드 갯수(글 갯수)가 몇개인지
		//-> select count(*) from board
		int recordTotalCount=this.getDisappearCommentsCountByDisappearSeq(DisappearSeq);

		//2. 한 페이지에 몇개의 글이 보이게 할 것 인지
		int recordCountPerPage = ReviewCommentsStatics.recordCountPerPage;

		//3. 한 페이지에 네비게이터가 총 몇개가 보이게 할 것인지
		int naviCountPerPage = ReviewCommentsStatics.naviCountPerPage;

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


	

	@Override
	public DisappearCommentsDTO selectDisappearCommentsDTOByCurrValSeq() {
		//현재 seq를 구한다.
		int currval = dcdao.selectDisappearCommentsSeqCurrVal();
		//현재 seq에 맞는 dto를 리턴한다.
		return dcdao.selectDisappearCommentsBySeq(currval);
	}

	@Override
	public int updateReplyContentsByseq(DisappearCommentsDTO dto) {
		return dcdao.updateReplyContentsByseq(dto);
	}

	@Override
	public DisappearCommentsDTO selectDTOBySeq(int seq) {
		return dcdao.selectDTOBySeq(seq);
	}

}
