package kh.spring.fin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.QuizDTO;
import kh.spring.service.MemberService;
import kh.spring.service.QuizService;

@Controller
public class QuizController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private QuizService qs;
	@Autowired
	private MemberService ms;
	
	@RequestMapping("oxQuiz")
	public String oxQuiz(HttpServletRequest request) {
		List<QuizDTO> list = qs.selectRandQuizService();
		System.out.println("문제 개수:"+list.size());
		session.setAttribute("list", list); // 랜덤으로 뽑은 문제목록 세션에 담기
		return "sense/quiz/oxQuiz";
	}
	
	/**
	 * 정답 확인하기
	 * @param request
	 * @param corr: 선택한 답 목록
	 * @return 맞힌 문제 목록과 획득한 포인트
	 */
	@RequestMapping(value="answerCheck", produces = "text/plain;charset=UTF-8")
	public String answerCheck(HttpServletRequest request, String[] corr) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		List<QuizDTO> list = (List<QuizDTO>)session.getAttribute("list"); // 문제 목록 꺼내와 세션에서 꺼내
		
		List<Integer> answer = new ArrayList<>();
		List<QuizDTO> wrongList = new ArrayList<>(); //틀린문제 리스트 
		int plusPoint = 0;
		int minusPoint = 0;
		for(int i = 0; i < 10; i++) {
			if(list.get(i).getCorrect().equals(corr[i])) { //i번째 문제의 답이랑 내가 선택한 거 랑 같으면
				answer.add(i+1); //i = 0 이면 문제는 1번  맞춘 문제 번호를 리스트에 담아
				plusPoint += list.get(i).getPoint(); //i번째 문제의 포인터를 누적
			}else{
				wrongList.add(list.get(i)); // 틀린문제 
				minusPoint += list.get(i).getPoint();
			}
		}
		List<MemberDTO> rankList = new ArrayList<>();
		int getPoint = plusPoint - minusPoint;
		System.out.println(getPoint +" = "+ plusPoint +" - "+ minusPoint);
		
		try {
			qs.updatePointService(getPoint, id); // 포인트 업데이트
			rankList = ms.memberPointService();// 포인트 순으로 멤버 리스트 출력
			
		}catch(Exception e) {e.printStackTrace();}
		
		request.setAttribute("answer",answer.size());//맞힌 개수
		request.setAttribute("incorrCount", wrongList.size());
		request.setAttribute("wrongList", wrongList);//틀린문제 리스트
		request.setAttribute("getPoint", getPoint);//획득 포인트
		request.setAttribute("rankList", rankList);//랭킹 리스트 
		

		return "sense/quiz/quizResult";
	}
}
