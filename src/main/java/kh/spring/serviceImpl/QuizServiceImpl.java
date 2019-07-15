package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.QuizDAO;
import kh.spring.dto.QuizDTO;
import kh.spring.service.QuizService;

@Service
public class QuizServiceImpl implements QuizService {

	@Autowired
	private QuizDAO qdao;
	
	@Override
	public int insertQuizService(QuizDTO dto) {
		return qdao.insertQuiz(dto);
	}

	@Override
	public List<QuizDTO> selectAllQuizService() {
		return qdao.selectAllQuiz();
	}

	@Override
	public List<QuizDTO> selectRandQuizService() { //퀴즈 랜덤
		int quizNum = qdao.getQuizNum();
		return qdao.selectRandQuiz(quizNum);
	}

	@Override
	public int deleteQuizService(int seq) {
		return qdao.deleteQuiz(seq);
	}
	@Override
	public int updatePointService(int point, String id) {
		return qdao.updatePoint(point, id);
	}
	@Override
	public List<QuizDTO> selectQuizPerPageService(int currentPage){
		return qdao.selectQuizPerPage(currentPage);
	}
	@Override
	public String getNaviQuizService(int currentPage) {
		return qdao.getNaviQuiz(currentPage);
	}
}
