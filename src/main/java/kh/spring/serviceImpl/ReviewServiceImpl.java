package kh.spring.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.ReviewCommentsDAO;
import kh.spring.dao.ReviewDAO;
import kh.spring.dto.ReviewDTO;
import kh.spring.service.ReviewService;
import kh.spring.statics.MessageStatics;
import kh.spring.statics.ReviewStatics;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO rdao;
	@Autowired
	private ReviewCommentsDAO rcdao;

	@Override
	public int insertReviewService(ReviewDTO dto) {
		return rdao.insertReview(dto);
	}
	//list목록 가져오기
	@Override
	public List<ReviewDTO> selectAllReviewByCurrentpage(String currentPage) {
		int page = Integer.parseInt(currentPage);
		int[] start_end = this.getRecordPerPageStartEnd(page);
		int start = start_end[0];
		int end = start_end[1];
		return rdao.selectAllReviewByCurrentpage(start, end);
	}
	
	public int getReviewCount() {
		return rdao.getReviewCount();
	}
	/**
	 * 해당 페이지에 띄워야할 list얻기위해 begin , end
	 * @param currentPage
	 * @return
	 */
	public int[] getRecordPerPageStartEnd(int currentPage){
		int recordCountPerPage = ReviewStatics.recordCountPerPage;

		int start = 1 + recordCountPerPage*(currentPage-1);
		int end = recordCountPerPage*currentPage;

		return new int[] {start,end};
	}
	/**
	 * 페이지 네비게이터
	 * @param currentPage
	 * @param
	 * @param 
	 * @return
	 */
	@Override
	public List<String> getNaviForReviewList(int currentPage){
		//0.현재 내가 보고있는 페이지가 몇 페이지 인지

		//네비게이터 제작을 위한 3step
		//1. DB의 게시판테이블의 전체 레코드 갯수(글 갯수)가 몇개인지
		//-> select count(*) from board
		int recordTotalCount=this.getReviewCount();
//		if(listSize==-1) {
//			recordTotalCount = this.getBoardCount();s
////			System.out.println(recordTotalCount+":recordTotalCount");
//		}else {
//			recordTotalCount = listSize;
//		}

		//2. 한 페이지에 몇개의 글이 보이게 할 것 인지
		int recordCountPerPage = ReviewStatics.recordCountPerPage;

		//3. 한 페이지에 네비게이터가 총 몇개가 보이게 할 것인지
		int naviCountPerPage = ReviewStatics.naviCountPerPage;

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

	@Transactional("txManager")
	@Override
	public int deleteReviewService(int seq) {
		rcdao.deleteReviewComment(seq);
		return rdao.deleteReview(seq);
	}

	@Override
	public List<ReviewDTO> selectReviewPerPageService(int start, int end) {
		return null;
	}
	@Override
	public ReviewDTO selectReviewBySeq(int seq) {
		return rdao.selectReviewBySeq(seq);
	}
	@Override
	public int updateViewCount(int seq) {
		return rdao.updateViewCount(seq);
	}

	
}
