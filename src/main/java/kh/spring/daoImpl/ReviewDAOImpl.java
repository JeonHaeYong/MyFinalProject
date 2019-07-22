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
	public List<ReviewDTO> selectAllReviewByCurrentpage(int start, int end) {
		Map<String,String> map = new HashMap<>();
		map.put("start", start+"");
		map.put("end", end+"");
		return sst.selectList("ReviewDAO.selectAllReviewByCurrentpage",map);
	}


	@Override
	public ReviewDTO selectReviewBySeq(int seq) {
		return sst.selectOne("ReviewDAO.selectReviewBySeq",seq);
	}

}
