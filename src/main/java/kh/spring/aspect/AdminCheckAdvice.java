package kh.spring.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.spring.dto.MemberDTO;
import kh.spring.serviceImpl.MemberServiceImpl;

@Controller
@Aspect
public class AdminCheckAdvice
{
	private static final Logger logger = LoggerFactory.getLogger(AdminCheckAdvice.class);
	
	@Autowired
	private HttpSession session;
	@Autowired
	MemberServiceImpl memberService;
	
	@Pointcut("execution(* kh.spring.fin.AdminController.*(..))")
	public void adminContoller() {};
	@Pointcut("execution(* kh.spring.fin.NoticeController.noticeWrite*(..)) || execution(* kh.spring.fin.NoticeController.noticeUpdate*(..)) || execution(* kh.spring.fin.NoticeController.noticeDelete*(..))")
	public void noticeContoller() {};
	
	@Around("adminContoller() || noticeContoller()")
	public Object adminCheck(ProceedingJoinPoint pjp)
	{
		Object returnObj = "error";
		
		try
		{
			String id = (String)session.getAttribute("id");
			
			if(id == null)
			{
				logger.warn("관리자 계정이 아닙니다 : {}", id);
				return returnObj;
			}
			
			MemberDTO dto = memberService.selectOneMemberService(id);
			
			if(dto.getType() != 4)
			{
				logger.warn("관리자 계정이 아닙니다 : {}", id);
				return returnObj;
			}
			else
			{
				returnObj = pjp.proceed();
				logger.info("관리자 계정이 맞습니다 : {}", id);
			}
		}
		catch(Throwable e)
		{
			e.printStackTrace();
		}
		
		return returnObj;
	}
}
