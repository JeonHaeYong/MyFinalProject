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
import kh.spring.dto.MessageDTO;
import kh.spring.dto.QuizDTO;
import kh.spring.service.BlackListService;
import kh.spring.service.ChartService;
import kh.spring.service.DisappearReportService;
import kh.spring.service.DonationPaymentService;
import kh.spring.service.DonationService;
import kh.spring.service.ItemService;
import kh.spring.service.LogService;
import kh.spring.service.MemberService;
import kh.spring.service.MessageService;
import kh.spring.service.QuizService;

@Controller
public class AdminController
{
	@Autowired
	private QuizService qs;
	@Autowired
	private DisappearReportService drs;
	@Autowired
	private MessageService msgService;
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
	@Autowired
	DonationPaymentService donationPaymentService;
	@Autowired
	QuizService quizServiece;
	
	//Member Start
	@RequestMapping(value = "admin-member")
	public String manageMemberPage()
	{
		logger.info("회원 관리 페이지");
		return "myPage/admin/admin_manage_member";
	}
//	@RequestMapping(value = "admin-member-insert")
//	public String insertRandomMembers()
//	{
//		logger.info("회원 데이터 삽입 시도");
//		String result = "error";
//
//		try
//		{
//			result = blackService.insertRandomMembers();
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//
//		return result;
//	}
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
	@ResponseBody
	@RequestMapping(value = "admin-blacklist-search", produces="application/json;charset=utf-8")
	public Object searchInBlackList(String id, String page)
	{
		Object result = "error";
		try
		{
			result = blackService.selectMembersInBlackList(id, page);
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
//	@RequestMapping(value = "admin-chart-insert")
//	public String insertDummyData()
//	{
//		String result = "error";
//		try
//		{
//			result = chartService.insertRandomRecord();
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//
//		return result;
//	}
	@ResponseBody
	@RequestMapping(value = "admin-chart-acs", produces="application/json;charset=utf-8")
	public String selectACSDTO()
	{
		String result = "error";
		try
		{
			result = chartService.selectACSDTO();
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
	public Object addNewDonation(HttpServletRequest request,MultipartFile image1, MultipartFile image2, MultipartFile image3, MultipartFile left, MultipartFile right)
	{
		Object result = "error";
		try
		{
			result = donationService.addNewDonation(request, image1, image2, image3, left, right);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-donation-search", produces="application/json;charset=utf-8")
	public Object donationSearch(String page)
	{
		Object result = "error";
		try
		{
			result = donationService.selectDTOByRowNumber(page);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping(value = "admin-donation-update", method = RequestMethod.POST)
	public Object updateDonation(HttpServletRequest request,MultipartFile image1, MultipartFile image2, MultipartFile image3, MultipartFile left, MultipartFile right)
	{
		Object result = "error";
		try
		{
			result = donationService.updateDonation(request, image1, image2, image3, left, right);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-donation-log", produces="application/json;charset=utf-8")
	public Object selectDonatedListByGroup(String page)
	{
		Object result = "error";
		try
		{
			result = donationPaymentService.selectDonatedListByGroup(page);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-donation-all", produces="application/json;charset=utf-8")
	public Object selectDonatedListAll(String page, String target)
	{
		Object result = "error";
		try
		{
			result = donationPaymentService.selectDonatedListAll(page, target);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}
	@ResponseBody
	@RequestMapping(value = "admin-donation-index", produces="application/json;charset=utf-8")
	public Object selectDonationAjax()
	{
		Object result = "error";
		try
		{
			result = donationService.selectRecentDTOAjax();
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
	@ResponseBody
	@RequestMapping(value = "admin-item-reject")
	public Object itemReject(String items)
	{
		Object result = "";

		try
		{
			result = itemService.rejectItems(items);
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
//	@RequestMapping(value = "admin-quiz-random")
//	public Object updatePointRandom()
//	{
//		Object result = "";
//
//		try
//		{
//			result = memberService.updateRandomPoint();
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//
//		return result;
//	}
	@RequestMapping(value = "admin-quiz-zero")
	public Object updatePointZeroAllUsers()
	{
		Object result = "error";

		try
		{
			result = quizServiece.updatePointZeroAllUsers();
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
//	@RequestMapping(value = "admin-paylog-insert")
//	public Object insertPayLogDummy()
//	{
//		Object result = "error";
//
//		try
//		{
//			result = logService.insertDummy();
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//
//		return result;
//	}
	@ResponseBody
	@RequestMapping(value = "admin-paylog-search", produces="application/json;charset=utf-8")
	public Object selectFromPayLog(String page, String condition, String keyword)
	{
		Object result = "error";

		try
		{
			result = logService.selectPayLog(page, condition, keyword);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}

	//PayLog end


	@RequestMapping("admin-mypage")
	public String myPage(HttpServletRequest request) 
	{
		return "myPage/user/user_myPage_profile";
	}


	//퀴즈 관리자 -------------------------------------------------------------------------------------------
	@RequestMapping("quizAdmin.admin")
	public String quizAdmin(HttpServletRequest request) {
		int type = (int)session.getAttribute("type");
		if(type == 4) {
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
			return "sense/quiz/quizAdmin";
		}
		return "redirect:/";
	}
	@RequestMapping("insertQuiz.admin")
	public String insertQuiz(HttpServletRequest request) {
		int type = (int)session.getAttribute("type");
		if(type == 4) {
			String quiz = request.getParameter("quiz");
			String correct = request.getParameter("correct");
			int point = Integer.parseInt(request.getParameter("point"));
			String explain = request.getParameter("explain");

			QuizDTO qdto = new QuizDTO(0, quiz, correct, point, explain);
			qs.insertQuizService(qdto);
			return "redirect:/quizAdmin.admin?currentPage="+session.getAttribute("currentPage");
		}		
		return "redirect:/";
	}
	@RequestMapping("deleteQuiz.admin")
	public String deleteQuiz(HttpServletRequest request) {
		int type = (int)session.getAttribute("type");
		if(type == 4) {
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
		return "redirect:/";
	}
	@RequestMapping("selectDeleteDisappearReport")
	public String selectDeleteDisappearReport(HttpServletRequest request) {
		int type = (int)session.getAttribute("type");
		if(type == 4) {
			String[] num = request.getParameterValues("check");
			int[] seq = new int[num.length];
			for(int i = 0; i < num.length; i++) {
				seq[i] = Integer.parseInt(num[i]);
				try {
					drs.deleteService(seq[i]);
				}catch(Exception e) {e.printStackTrace();}
			}
			return "redirect:/toDisappearList?currentPage=" + session.getAttribute("currentPage");
		}
		return "redirect:/";
	}
	//동물병원, 동물보호소 데이터 삽입-----------------------------
	@RequestMapping("inputData.admin")
	public String inputData() {
		return "animal/admin";
	}
	@RequestMapping("admin-msg")
	public String admin_msg_loginCheck(HttpServletRequest request,String currentPage) {
		int type = (int)session.getAttribute("type");
		System.out.println("관리자타입!"+type);
		if(type!=4) {
			request.setAttribute("errorMsg", "잘못된 접근입니다.error:a_m_error");
			return "error";
		}
		if(currentPage==null) {
			currentPage = "1";
		}
		int page = Integer.parseInt(currentPage);
		String loginId = (String)session.getAttribute("id");
		//페이지에 띄울 쪽지 리스트 담기.
		//받은쪽지
		List<MessageDTO> receivedList = msgService.selectAllMsgByCurrentPage("recipient",loginId, page);
		request.setAttribute("receivedList", receivedList);
		//보낸쪽지
		List<MessageDTO> sentList = msgService.selectAllMsgByCurrentPage("sender",loginId, page);
		request.setAttribute("sentList", sentList);

		//페이지 navi담기.
		//받은쪽지
		List<String> receivedNavi = msgService.getNaviforMsg(page, "recipient", loginId);
		request.setAttribute("receivedNavi", receivedNavi);
		//보낸쪽지
		List<String> sentNavi = msgService.getNaviforMsg(page, "sender", loginId);
		request.setAttribute("sentNavi", sentNavi);
		return "myPage/admin/admin_message";
	}
	
	@RequestMapping("admin-pwChange")
	public String admin_pwChange(){
		return "myPage/admin/admin_pw";
	}
}
