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
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.BlackListDTO;
import kh.spring.dto.QuizDTO;
import kh.spring.service.BlackListService;
import kh.spring.service.ChartService;
import kh.spring.service.DonationService;
import kh.spring.service.ItemService;
import kh.spring.service.LogService;
import kh.spring.service.MemberService;
import kh.spring.service.QuizService;

@Controller
public class AdminController
{
	@Autowired
	private QuizService qs;
	@Autowired
	private HttpSession session;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	BlackListService blackService;
	@Autowired
	ChartService chartService;
	@Autowired
	DonationService donationService;
	@Autowired
	ItemService itemService;
	@Autowired
	MemberService memberService;
	@Autowired
	LogService logService;
	
	//Member Start
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
	//Member End
	
	
	
	//Chart Start
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
	//Chart End
	
	
	
	//Donation Start
	
	@RequestMapping(value = "admin-donation")
	public String donationPage()
	{
		return "myPage/admin/admin_donation";
	}
	@RequestMapping(value = "admin-donation-insert", method = RequestMethod.POST)
	public Object addNewDonation(HttpServletRequest request,MultipartFile image1, MultipartFile image2, MultipartFile image3)
	{
		Object result = "error";
		try
		{
			result = donationService.addNewDonation(request, image1, image2, image3);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@RequestMapping(value = "admin-donation-image", method = RequestMethod.POST)
	public Object changeLeftImage(MultipartFile left, MultipartFile right)
	{
		Object result = "error";
		
		try
		{
			result = donationService.changeImage(left, right);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	//Donation End
	
	
	
	//Item Start
	
	@RequestMapping(value = "admin-item")
	public String itemPage()
	{
		return "myPage/admin/admin_item";
	}
	@RequestMapping(value = "admin-item-insert")
	public Object insertItemDummy()
	{
		Object result = "error";
		
		try
		{
			result = itemService.insertDummy();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-item-search", produces="application/json;charset=utf-8")
	public Object itemSearch(String page)
	{
		Object result = "";
		
		try
		{
			result = itemService.selectForAdmin(page);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-item-permission")
	public Object itemPermission(String items)
	{
		Object result = "";
		
		try
		{
			result = itemService.permissionItems(items);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	//Item End
	
	
	//Quiz Start
	
	@RequestMapping(value = "admin-quiz")
	public String quizPage()
	{
		return "myPage/admin/admin_quiz";
	}
	@ResponseBody
	@RequestMapping(value = "admin-quiz-search", produces="application/json;charset=utf-8")
	public Object quizSearch(String page)
	{
		Object result = "";
		
		try
		{
			result = memberService.selectRankFiveByPoint(page);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@RequestMapping(value = "admin-quiz-random")
	public Object updatePointRandom()
	{
		Object result = "";
		
		try
		{
			result = memberService.updateRandomPoint();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	//Quiz End
	
	
	
	
	//PayLog start
	
	@RequestMapping(value = "admin-paylog")
	public String paylogPage()
	{
		return "myPage/admin/admin_paylog";
	}
	@RequestMapping(value = "admin-paylog-insert")
	public Object insertPayLogDummy()
	{
		Object result = "error";
		
		try
		{
			result = logService.insertDummy();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-paylog-select", produces="application/json;charset=utf-8")
	public Object selectFromPayLog(String page, String condition)
	{
		Object result = "error";
		
		try
		{
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	//PayLog end
	
	
	
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
