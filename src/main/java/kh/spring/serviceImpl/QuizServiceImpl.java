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
	public List<QuizDTO> selectRandQuizService() {
		int quizNum = qdao.getQuizNum();
		return qdao.selectRandQuiz(quizNum);
	}

	@Override
	public int deleteQuizService(int seq) {
		return qdao.deleteQuiz(seq);
	}
	
}
