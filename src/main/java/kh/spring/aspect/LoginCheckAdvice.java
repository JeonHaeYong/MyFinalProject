package kh.spring.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

@Component
@Aspect
public class LoginCheckAdvice {
	@Autowired
	private HttpSession session;
	@Around("execution(* kh.spring.fin.*.loginCheck_*(..))")
	public Object loginCheck(ProceedingJoinPoint pjp) {
		
		Object retVal = null;
		if(session.getAttribute("loginId")==null) {
			return "redirect:/error";
		}
		System.out.println("로그인아이디->"+session.getAttribute("loginId"));
		try {
			retVal = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return retVal;
	}
}
