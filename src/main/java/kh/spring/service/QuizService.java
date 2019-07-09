package kh.spring.service;

import java.util.List;

import kh.spring.dto.QuizDTO;

public interface QuizService {
	public int insertQuizService(QuizDTO dto);
	public List<QuizDTO> selectAllQuizService();
	public List<QuizDTO> selectRandQuizService();
	public int deleteQuizService(int seq);
}
