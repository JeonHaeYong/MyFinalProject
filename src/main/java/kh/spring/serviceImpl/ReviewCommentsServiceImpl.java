package kh.spring.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.ReviewCommentsDAO;
import kh.spring.dao.ReviewCommentsLikesDAO;
import kh.spring.dto.ReviewCommentsDTO;
import kh.spring.dto.ReviewCommentsLikesDTO;
import kh.spring.service.ReviewCommentsService;
import kh.spring.statics.ReviewCommentsStatics;

@Service
public class ReviewCommentsServiceImpl implements ReviewCommentsService {
	
	@Autowired
	private ReviewCommentsDAO rcdao;
	@Autowired
	private ReviewCommentsLikesDAO rcl_dao;

	@Override
	public int insertReviewCommentService(ReviewCommentsDTO dto) {
		return rcdao.insertReviewComment(dto);
	}

	@Override
	public int modifyReviewCommentService(ReviewCommentsDTO dto) {
		return rcdao.modifyReviewComment(dto);
	}

	@Override
	public int deleteReviewCommentService(int seq) {
		return rcdao.deleteReviewComment(seq);
	}

	@Override
	public List<ReviewCommentsDTO> selectAllReviewCommentsService(int seq , int commentPage,String loginId) {
		int[] start_end = this.getRecordPerPageStartEnd(commentPage);
		return rcdao.selectAllReviewCommentsByReviewSeq(seq,start_end[0],start_end[1],loginId);
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
	
	public int getReviewCommentsCountByReviewSeq(int reviewSeq) {
		return rcdao.selectReviewCommentsCountByReviewSeq(reviewSeq);
	}
	/**
	 * 페이지 네비게이터
	 * @param currentPage
	 * @param
	 * @param 
	 * @return
	 */
	@Override
	public List<String> getNaviForReviewCommentsList(int reviewSeq, int currentPage){
		//0.현재 내가 보고있는 페이지가 몇 페이지 인지

		//네비게이터 제작을 위한 3step
		//1. DB의 게시판테이블의 전체 레코드 갯수(글 갯수)가 몇개인지
		//-> select count(*) from board
		int recordTotalCount=this.getReviewCommentsCountByReviewSeq(reviewSeq);

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
	@Transactional("txManager")
	public int reviewCommentsLikeClick(ReviewCommentsLikesDTO dto) {
		//insert -> 누른사람 / 몇번seq의 댓글에 좋아요누른건지 // 몇번seq의 댓글의  dto의 좋아요 수 update 
		//해당 댓글의 좋아요 수 +1
		int seq = dto.getR_comments_seq();
		int result = rcdao.updateReviewCommentsLike(seq);
		//ReviewCommentsLikes table에 dto insert 하기.
		int rclResult = rcl_dao.insertReviewCommentsLike(dto);
		return result+rclResult;
	}

	@Override
	@Transactional("txManager")
	public int reviewCommentsLikeCancel(ReviewCommentsLikesDTO dto) {
		//해당 댓글의 좋아요 수 -1
		int seq = dto.getR_comments_seq();
		int result = rcdao.updateReviewCommentsLikeMinus(seq);
		//ReviewCommentsLikes table에 dto delete 하기.
		int rclResult = rcl_dao.deleteReviewCommentsLike(dto);
		return result+rclResult;
	}

	@Override
	public ReviewCommentsDTO selectReviewCommentsDTOByCurrValSeq() {
		//현재 seq를 구한다.
		int currval = rcdao.selectReviewCommentsSeqCurrVal();
		//현재 seq에 맞는 dto를 리턴한다.
		return rcdao.selectReviewCommentsBySeq(currval);
	}
	
}
