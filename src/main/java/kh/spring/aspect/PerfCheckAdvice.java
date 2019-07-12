package kh.spring.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Controller;

@Controller
@Aspect
public class PerfCheckAdvice {
	
	@Around("execution(* kh.spring.fin.*.*(..))")
	public Object perfCheck(ProceedingJoinPoint pjp) { 
		long startTime = System.currentTimeMillis();
		Object retVal = null;
		
		try {
			retVal = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		} 
		long endTime = System.currentTimeMillis();
		
		String methodName = pjp.getSignature().getName();
		System.out.println((endTime - startTime)/1000.0 + "초 동안 "+ pjp.getClass()+" -> "+methodName + " 작업수행");
		
		return retVal; 	
	}
}
