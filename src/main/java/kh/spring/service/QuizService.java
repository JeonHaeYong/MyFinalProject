package kh.spring.service;

import java.util.List;

import kh.spring.dto.QuizDTO;

public interface QuizService {
	public int insertQuizService(QuizDTO dto);
	public List<QuizDTO> selectAllQuizService();
	public List<QuizDTO> selectRandQuizService();
	public int deleteQuizService(int seq);
	public int updatePointService(int point, String id);
	public List<QuizDTO> selectQuizPerPageService(int currentPage);
	public String getNaviQuizService(int currentPage);
	public int updateZeroPoint(int point, String id);
	
	public Object updatePointZeroAllUsers() throws Exception;
}
