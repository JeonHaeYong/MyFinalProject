package kh.spring.fin;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.BlackListDTO;
import kh.spring.dto.QuizDTO;
import kh.spring.service.QuizService;
import kh.spring.serviceImpl.BlackListServiceImpl;
import kh.spring.serviceImpl.ChartServiceImpl;

@Controller
public class AdminController
{
	@Autowired
	private QuizService qs;
	@Autowired
	private HttpSession session;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	BlackListServiceImpl blackService;
	@Autowired
	ChartServiceImpl chartService;
	
	@RequestMapping(value = "admin-member")
	public String manageMemberPage()
	{
		logger.info("회원 관리 페이지");
		return "myPage/admin/admin_manage_member";
	}
	@RequestMapping(value = "admin-member-insert")
	public String insertRandomMembers()
	{
		logger.info("회원 데이터 삽입 시도");
		String result = "error";
		
		try
		{
			result = blackService.insertRandomMembers();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-member-search", produces="application/json;charset=utf-8")
	public String searchMember(String id, String page)
	{
		String result = "error";
		try
		{
			result = blackService.searchMember(id, page);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
		
	}
	@RequestMapping(value = "admin-member-black")
	public String blackMember(String id, String reason)
	{
		String result = "error";
		try
		{
			result = blackService.blackMember(id, reason);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@RequestMapping(value = "admin-member-release", method = RequestMethod.POST)
	public String releaseMember(BlackListDTO dto)
	{
		String result = "error";
		
		try
		{
			result = blackService.delete(dto);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "admin-chart")
	public String chartPage()
	{
		return "myPage/admin/admin_chart";
	}
	@ResponseBody
	@RequestMapping(value = "admin-chart-visit", produces="application/json;charset=utf-8")
	public String chartGetVisitCount()
	{
		String result = "error";
		try
		{
			result = chartService.getVisitCount();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
		
	}
	@RequestMapping(value = "admin-chart-insert")
	public String insertDummyData()
	{
		String result = "error";
		try
		{
			result = chartService.insertRandomRecord();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	//퀴즈 관리자 -------------------------------------------------------------------------------------------
	@RequestMapping("quizAdmin.admin")
	public String quizAdmin(HttpServletRequest request) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<QuizDTO> quizList = new ArrayList<>();
		String navi = null;
		try {
			quizList = qs.selectQuizPerPageService(currentPage);
			navi = qs.getNaviQuizService(currentPage);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("quizList", quizList);
		request.setAttribute("navi", navi);
		return "sense/quizAdmin";
	}
	@RequestMapping("insertQuiz.admin")
	public String insertQuiz(HttpServletRequest request) {
		String quiz = request.getParameter("quiz");
		String correct = request.getParameter("correct");
		int point = Integer.parseInt(request.getParameter("point"));
		String explain = request.getParameter("explain");
		
		QuizDTO qdto = new QuizDTO(0, quiz, correct, point, explain);
		qs.insertQuizService(qdto);
		return "redirect:/quizAdmin.admin?currentPage="+session.getAttribute("currentPage");
	}
	@RequestMapping("deleteQuiz.admin")
	public String deleteQuiz(HttpServletRequest request) {
		String[] num = request.getParameterValues("check");
		int[] seq = new int[num.length];
		for(int i = 0; i < num.length; i++) {
			seq[i] = Integer.parseInt(num[i]);
			try {
				qs.deleteQuizService(seq[i]);
			}catch(Exception e) {e.printStackTrace();}
		}
		return "redirect:/quizAdmin.admin?currentPage=" + session.getAttribute("currentPage");
	}
}
