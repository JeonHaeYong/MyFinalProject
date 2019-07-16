package kh.spring.serviceImpl;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.BlackListDAO;
import kh.spring.dao.MemberDAO;


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
			if(bdao.selectCountById(new BlackListDTO(id)) == 1)
			{
				return 0;
			}
			else
			{
				return mdao.isLoginOk(id, password);
			}
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
	
	
    // 메일 test
	@Autowired
	private JavaMailSender mailSender;	

	//퀴즈에서 씀
	@Override
	public List<MemberDTO> memberPointService() {
		return mdao.memberPoint();
	}

	@Override
	@Transactional
	public boolean create(String email)  {
	
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);
		session.setAttribute("authkey",authkey);	
		// mail 작성 관련 
		try {
		 MailHandler  sendMail = new  MailHandler (mailSender);

		sendMail.setSubject("[Hoon's Board v2.0] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래의 인증번호를 입력하시면 이메일 인증이 완료됩니다.</p>")
				.append("인증번호=")
				.append(authkey)
				.toString());
		sendMail.setFrom("wlsgid916@gmial.com ", "관리자입니다");
		sendMail.setTo(email);
		sendMail.send();
		return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	
	//네이버 회원가입
	@Override
	public int insertNaverJoin(MemberDTO dto) {
		
		int result = mdao.insertNaverJoin(dto);	
		return result;
	
	}
	
	
	//이메일로 아이디 찾기 
	@Override
	public String FindId(String idname,String birthday) {
		
		return mdao.findID(idname,birthday);
	}
	
	//이메일로 아이디 보내기 
	@Override
	@Transactional
	public boolean FindIdbyemail(String email,String id)  {
	
		
		// mail 작성 관련 
		try {
		 MailHandler  sendMail = new  MailHandler (mailSender);

		sendMail.setSubject("회원님의 아이디 ");
		sendMail.setText(new StringBuffer().append("<h1>[아이디 정보]</h1>")
				.append("회원님의 아이디는 ")
				.append(id).append("입니다")
				.toString());
		sendMail.setFrom("wlsgid916@gmial.com ", "관리자입니다");
		sendMail.setTo(email);
		sendMail.send();
		return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}





