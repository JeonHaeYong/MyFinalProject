package kh.spring.dao;

import java.util.List;

import kh.spring.dto.QuizDTO;

public interface QuizDAO {
	public int insertQuiz(QuizDTO dto);
	public List<QuizDTO> selectAllQuiz();
	public List<QuizDTO> selectRandQuiz(int quizNum);
	public int getQuizNum();
	public int deleteQuiz(int seq);
	public int updatePoint(int point, String id);
	public List<QuizDTO> selectQuizPerPage(int currentPage);
	public int QuizCount();
	public String getNaviQuiz(int currentPage);
	
}
