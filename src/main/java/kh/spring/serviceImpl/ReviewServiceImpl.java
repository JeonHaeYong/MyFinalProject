package kh.spring.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.ReviewCommentsDAO;
import kh.spring.dao.ReviewDAO;
import kh.spring.dto.ReviewDTO;
import kh.spring.service.ReviewService;

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

	@Override
	public List<ReviewDTO> selectAllReviewService() {
		return rdao.selectAllReview();
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
	public Map<String, Integer> getNaviForReviewService(int currentPage) {
		return null;
	}
	
}
