package kh.spring.aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Aspect
public class LoginCheckAdvice {
	@Autowired
	private HttpSession session;
	
//	@Around("execution(* kh.spring.fin.*.*_loginCheck(..,HttpServletRequest,..))")
//	public Object loginCheck(ProceedingJoinPoint pjp) {
//		String methodName = pjp.getSignature().getName();
//		String className = pjp.getSignature().getDeclaringTypeName();
//		System.out.println(className +" -> "+methodName + " 작업수행");
//		Object[] params = pjp.getArgs();
//		HttpServletRequest request = null;
//		for(Object obj : params) {
//			if(obj instanceof HttpServletRequest) {
//				request = (HttpServletRequest)obj;
//				break;
//			}
//		}
//		Object retVal = null;
//		if(session.getAttribute("id")==null) {
//			request.setAttribute("errorLogin", "errorLogin");
//			return "/";
//		}
//		System.out.println("로그인아이디->"+session.getAttribute("loginId"));
//		try {
//			retVal = pjp.proceed();
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
//		return retVal;
//	}
}
