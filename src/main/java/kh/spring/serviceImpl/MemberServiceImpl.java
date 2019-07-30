package kh.spring.serviceImpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dao.BlackListDAO;
import kh.spring.dao.CartDAO;
import kh.spring.dao.DisappearCommentsDAO;
import kh.spring.dao.DisappearReportDAO;
import kh.spring.dao.DonationPaymentDAO;
import kh.spring.dao.ItemDAO;
import kh.spring.dao.MemberDAO;
import kh.spring.dao.MessageDAO;
import kh.spring.dao.PaymentDAO;
import kh.spring.dao.ReviewCommentsDAO;
import kh.spring.dao.ReviewCommentsLikesDAO;
import kh.spring.dao.ReviewDAO;
import kh.spring.dao.TempProtectDAO;
import kh.spring.dto.BlackListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.mail.MailHandler;
import kh.spring.mail.TempKey;
import kh.spring.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mdao;
	@Autowired
	private HttpSession session;
	@Autowired
	private BlackListDAO bdao;
	@Autowired
	private CartDAO cdao;
	@Autowired
	private DisappearReportDAO disappeardao;
	@Autowired
	private DisappearCommentsDAO dissappearCommentsdao;
	@Autowired
	private TempProtectDAO tempdao;
	@Autowired
	private ReviewDAO reviewdao;
	@Autowired
	private ReviewCommentsDAO reviewCommentsdao;
	@Autowired
	private ReviewCommentsLikesDAO reviewCommentsLikesdao;
	@Autowired
	private ItemDAO idao;
	@Autowired
	private DonationPaymentDAO dpdao;
	@Autowired
	private MessageDAO messagedao;
	@Autowired
	private PaymentDAO pdao;

	@Override
	@Transactional("txManager")
	public Object withdrawalService(String id) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(!(pdao.checkPayDate(id) >= 1)) {
			BlackListDTO dto = new BlackListDTO();
			dto.setId(id);
			mdao.deleteMember(id);
			bdao.deleteById(dto);
			cdao.deleteCart(id);
			disappeardao.updateWithdrawalWriter(id);
			dissappearCommentsdao.updateWithdrawalWriter(id);
			tempdao.updateWithdrawalBywriter(id);
			reviewdao.updateWithdrawalWriter(id);
			reviewCommentsdao.updateWithdrawalWriter(id);
			reviewCommentsLikesdao.updateWithdrawalId(id);
			idao.updateSoldOut(id);
			idao.updateWithdrawalSeller(id);
			dpdao.updateWithdrawalDonator(id);
			messagedao.updateWithdrawalByrecipient(id);
			messagedao.updateWithdrawalBysender(id);
			pdao.updateWithdrawalBybuyer(id);
			pdao.updateWithdrawalByseller(id);
			mav.setViewName("redirect:logout");
		}else {
			mav.addObject("type", "withdrawal");
			mav.setViewName("member/loginfail");
		}
		return mav;
	}

	@Override
	public int insertMemberService(MemberDTO dto) {
		dto.setType(1);
		dto.getAddress2().replaceAll("<script", "##");
		int result = mdao.insertMember(dto);	
		return result;
	}

	@Override
	public List<MemberDTO> selectAllMembersService() {
		return mdao.selectAllMembers();
	}

	@Override
	public int isLoginOkService(String id, String password){
		try
		{
			return mdao.isLoginOk(id, password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int idDuplCheckService(String id) {
		return mdao.idDuplCheck(id);
	}
	@Override
	public int doublemail(String email) {
		System.out.println("매소드 결과:"+mdao.doublemail(email));
		return mdao.doublemail(email);
	}

	@Override
	public MemberDTO selectOneMemberService(String id) {
		return mdao.selectOneMember(id);
	}

	@Override
	public int modifyMemberService(MemberDTO dto) {
		return mdao.modifyMember(dto);
	}

	@Override
	public int deleteMemberService(String id) {
		return mdao.deleteMember(id);
	}

	@Override
	public List<MemberDTO> selectByLikeId(String id, String page)
	{
		int recordPerPage =  10;
		int pageStart = Integer.parseInt(page) * recordPerPage - recordPerPage + 1;
		int pageEnd = Integer.parseInt(page) * recordPerPage;
		return mdao.selectByLikeId(id, pageStart, pageEnd);
	}

	@Override
	public int selectCountByLikeId(String id) throws Exception
	{
		return mdao.selectCountByLikeId(id);
	}
	
	//관리자 페이지 퀴즈 점수 최대 5등까지 조회
	@Override
	public Object selectRankFiveByPoint(String page) throws Exception
	{
		System.out.println("검색한 페이지 : " + page);
		
		if((page == null) || (page.equals("")))
		{
			page = "1";
		}
		
		int currentPage = Integer.parseInt(page);
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordTotalCount = mdao.selectCountRankFiveByPoint();
		int pageTotalCount;
		boolean needPrev = true;
		boolean needNext = true;
		
		int start = currentPage * recordCountPerPage - recordCountPerPage + 1;
		int end = currentPage * recordCountPerPage;
		
		List<MemberDTO> list = mdao.selectRankFiveByPoint(start, end);
		
		JsonObject outerjo = new JsonObject();
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			
			int point = list.get(i-1).getPoint();
			String id = list.get(i-1).getId();
			
			jo.addProperty("point", point);
			jo.addProperty("id", id);
			ja.add(jo);
		}
		outerjo.add("array", ja);
		
		if( recordTotalCount % recordCountPerPage == 0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}

		if(currentPage < 1)
		{
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount)
		{
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		if(startNavi == 1)
		{
			needPrev = false;
		}
		if(endNavi == pageTotalCount)
		{
			needNext = false;
		}
		
		outerjo.addProperty("seq", start-1);
		outerjo.addProperty("currentPage", currentPage);
		outerjo.addProperty("needPrev", needPrev);
		outerjo.addProperty("needNext", needNext);
		outerjo.addProperty("startNavi", startNavi);
		outerjo.addProperty("endNavi", endNavi);

		
		return new Gson().toJson(outerjo);
	}
	
	//포인트 랜덤하게 변경
	@Override
	public Object updateRandomPoint() throws Exception
	{
		int size = mdao.selectCount();
		for(int i = 1 ; i <= size ; i++)
		{
			System.out.println("i : " + i);
			
			HashMap<String, Integer> param = new HashMap<>();
			
			int point = (int) ( Math.random() * 1000 + 1 );
			
			param.put("point", point);
			param.put("index", i);
			
			int updateResult = mdao.updatePointRandom(param);
			if(updateResult != 1)
			{
				System.out.println("업데이트 안됨");
				return "error";
			}
		}
		System.out.println("변경된 행 : " + size);
		
		return "redirect: admin-quiz";
	}
	
	//네이버 회원가입
	@Override
	public int insertNaverJoin(MemberDTO dto) {

		int result = mdao.insertNaverJoin(dto);	
		return result;
	}
	//퀴즈에서 씀
		@Override
		public List<MemberDTO> memberPointService() {
			return mdao.memberPoint();
		}
		
		
//-------------메일 ----------------------------------------------------		
	// 메일 test
	@Autowired
	private JavaMailSender mailSender;	

	
//이메일 인증하기 
	@Override
	@Transactional("txManager")
	public boolean create(String email)  {

		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(10, false);
		session.setAttribute("authkey",authkey);	
		// mail 작성 관련 
		try {
			MailHandler  sendMail = new  MailHandler (mailSender);

			sendMail.setSubject("[라온펫]회원가입 이메일 인증입니다.");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<p>아래의 인증번호를 입력하시면 이메일 인증이 완료됩니다.</p>")
					.append("인증번호:")
					.append(authkey)
					.toString());
			sendMail.setFrom("wlsgid916@gmial.com ", "[라온펫관리자]");
			sendMail.setTo(email);
			sendMail.send();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	//메일로 임시 비밀번호 보내기 
	@Override
	@Transactional("txManager")
	public boolean newPw(String email)  {

		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(20, false);
		session.setAttribute("newPw",authkey);	
		// mail 작성 관련 
		try {

		 MailHandler  sendMail = new  MailHandler (mailSender);

		sendMail.setSubject("임시비밀번호 입니다.");
		sendMail.setText(new StringBuffer().append("<h1>[임시 비밀번호]</h1>")
				.append("<p>임시비밀번호 입니다. 로그인 하시면 비밀번호를 꼭 변경해주세요.</p>")
				.append("임시비밀번호: ")
				.append(authkey)
				.toString());
		sendMail.setFrom("wlsgid916@gmial.com", "[라온펫관리자]");
		sendMail.setTo(email);
		sendMail.send();
		return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	//이메일로 아이디 보내기 
		@Override
		@Transactional("txManager")
		public boolean FindIdbyemail(String email,String id)  {

			// mail 작성 관련 
			try {
				MailHandler  sendMail = new  MailHandler (mailSender);

				sendMail.setSubject("회원님의 아이디 입니다 ");
				sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
						.append("회원님의 아이디는 ")
						.append(id).append("입니다")
						.toString());
				sendMail.setFrom("wlsgid916@gmial.com ", "[라온펫관리자]");
				sendMail.setTo(email);
				sendMail.send();
				return true;
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}
		}


	
	//비밀번호 재설정
	@Override
	public int updatePwService(String id, String pw) {
		return mdao.updatePw(id, pw);
	}

	//이메일로 아이디 찾기 
	@Override
	public String FindId(String idname,String birthday) {

		return mdao.findID(idname,birthday);
	}
	/**
	 * myPage 이동시에 info보내주기.->nvl(null가능컬럼, (미설정))
	 * 
	 */
	@Override
	public MemberDTO selectOneMemberDTO_useMyPageAdvice(String id) {
		return mdao.selectOneMemberDTO_useMyPageAdvice(id);
	}

	//마이페이지->정보수정시
	@Override
	public int updateMemberInfoByMyPage(MemberDTO dto) {
		//값을 입력하지않았는데, null이 아니라 "" 로 넘어온다면 null로 바꿔주기.
		if(dto.getName()!=null&&dto.getName().equals("")) {
			dto.setName(null);
		}
		if(dto.getBirthDay()!=null&&dto.getBirthDay().equals("")) {
			dto.setBirthDay(null);
		}
		if(dto.getGender()!=null&&dto.getGender().equals("")) {
			dto.setGender(null);
		}
		if(dto.getPhone()!=null&&dto.getPhone().equals("")) {
			dto.setPhone(null);
		}
		if(dto.getZipcode()!=null&&dto.getZipcode().equals("")) {
			dto.setZipcode(null);
		}
		if(dto.getAddress1()!=null&&dto.getAddress1().equals("")) {
			dto.setAddress1(null);
		}
		if(dto.getAddress2()!=null&&dto.getAddress2().equals("")) {
			dto.setAddress2(null);
		}
		return mdao.updateMemberInfoByMyPage(dto);
	}

	@Override
	public int updateImagePath(MemberDTO dto) {
		return mdao.updateImagePath(dto);
	}

	@Override
	public List<String> selectAllType4() {
		return mdao.selectAllType4();
	}
	
}





