package kh.spring.fin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.QuizDTO;
import kh.spring.service.QuizService;

@Controller
public class QuizController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private QuizService qs;
	
	@RequestMapping("oxQuiz")
	public String oxQuiz(HttpServletRequest request) {
		List<QuizDTO> list = qs.selectRandQuizService();
		session.setAttribute("list", list);
		return "oxQuiz";
	}
	
	/**
	 * 정답 확인하기
	 * @param request
	 * @param corr: 선택한 답 목록
	 * @return 맞힌 문제 목록과 획득한 포인트
	 */
	@ResponseBody
	@RequestMapping("answerCheck")
	public String answerCheck(HttpServletRequest request, String[] corr) {
		List<QuizDTO> list = (List<QuizDTO>)session.getAttribute("list");
		List<Integer> answer = new ArrayList<>();
		int point = 0;
		for(int i = 0; i < 10; i++) {
			if(list.get(i).getCorrect().equals(corr[i])) {
				answer.add(i+1);
				point += list.get(i).getPoint();
			}
		}
		return "{\"answer\":" + answer + ", \"point\":" + point + "}";
	}
}
