package kh.spring.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;
import kh.spring.service.MessageService;

@Controller
@Aspect
public class MyPageUserInfoAdvice {
	@Autowired
	private MemberService mservice;
	@Autowired
	private MessageService msgService;
	
	@Around("execution(* kh.spring.fin.*.toMyPage*(..))")
	public Object perfCheck(ProceedingJoinPoint pjp) {
		Object[] params = pjp.getArgs();
		HttpServletRequest request = null;
		for(Object obj : params) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
				break;
			}   
		}
		String loginId = (String)request.getSession().getAttribute("id");
		int msgYet = msgService.selectMsgYetReadCount(loginId);//안읽은 메세지가 몇개인지
		request.setAttribute("msg", msgYet);
		MemberDTO dto = mservice.selectOneMemberDTO_useMyPageAdvice(loginId);//로그인한 아이디의 정보
		request.setAttribute("memberDTO", dto);
		String methodName = pjp.getSignature().getName();
		methodName = methodName.replaceAll("_loginCheck", "");
		request.setAttribute("myPage", methodName);
		Object retVal = null;
		try {
			retVal = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		} 
		return retVal; 	
	}
}
