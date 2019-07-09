package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ReviewCommentsDAO;
import kh.spring.dto.ReviewCommentsDTO;
import kh.spring.service.ReviewCommentsService;

@Service
public class ReviewCommentsServiceImpl implements ReviewCommentsService {
	
	@Autowired
	private ReviewCommentsDAO rcdao;

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
	public List<ReviewCommentsDTO> selectAllReviewCommentsService() {
		return rcdao.selectAllReviewComments();
	}

	@Override
	public List<ReviewCommentsDTO> selectReviewCommentsPerPageService(int commentPage) {
		return null;
	}
	
}
