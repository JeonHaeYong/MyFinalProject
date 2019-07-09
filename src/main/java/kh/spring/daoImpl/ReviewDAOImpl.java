package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.ReviewDAO;
import kh.spring.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 15;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 5;

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertReview(ReviewDTO dto) {
		return sst.insert("ReviewDAO.insertReview", dto);
	}

	@Override
	public List<ReviewDTO> selectAllReview() {
		return sst.selectList("ReviewDAO.selectAllReview");
	}

	@Override
	public int modifyReview(ReviewDTO dto) {
		return sst.update("ReviewDAO.modifyReview", dto);
	}

	@Override
	public int deleteReview(int seq) {
		return sst.delete("ReviewDAO.deleteReview", seq);
	}

	@Override
	public List<ReviewDTO> selectReviewPerPage(int start, int end) {
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return sst.selectList("ReviewDAO.selectReviewPerPage", param);
	}
	
	@Override
	public int getReviewCount() {
		return sst.selectOne("ReviewDAO.getReviewCount");
	}

	@Override
	public Map<String, Integer> getNaviForReview(int currentPage) {
		int recordTotalCount = this.getReviewCount();
		// 가지고 있는 게시글의 수에 맞는 페이지의 개수를 구함.
		int pageTotalCount = recordTotalCount / recordCountPerPage;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount++;
		}
		// 현재 페이지 오류 검출 및 정정
		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		// 네비게이터 시작과 끝
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		// 네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		int needPrev = 1;	// 1이면 true, -1이면 false
		int needNext = 1;

		if(startNavi == 1) {
			needPrev = -1;
		}
		if(endNavi == pageTotalCount) {
			needNext = -1;
		}

		int fromIndex = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int toIndex = currentPage*recordCountPerPage;

		if(toIndex > recordTotalCount) {
			toIndex = recordTotalCount;
		}

		Map<String, Integer> pageNavi = new HashMap<>();
		pageNavi.put("currentPage", currentPage);
		pageNavi.put("recordTotalCount", recordTotalCount);
		pageNavi.put("recordCountPerPage", recordCountPerPage);
		pageNavi.put("naviCountPerPage", naviCountPerPage);
		pageNavi.put("pageTotalCount", pageTotalCount);
		pageNavi.put("startNavi", startNavi);
		pageNavi.put("endNavi", endNavi);
		pageNavi.put("needPrev", needPrev);
		pageNavi.put("needNext", needNext);
		pageNavi.put("fromIndex", fromIndex);
		pageNavi.put("toIndex", toIndex);

		return pageNavi;
	}

}
