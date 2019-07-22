package kh.spring.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.spring.dao.LogDAO;
import kh.spring.dto.ItemDTO;
import kh.spring.dto.ItemDTOList;
import kh.spring.dto.PayLogDTO;

@Controller
@Aspect
public class LogAdvice
{
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	@Autowired
	HttpSession session;
	@Autowired
	LogDAO logDAO;
	
	@Around("execution(* kh.spring.serviceImpl.PaymentServiceImpl.paymentComplete(..))")
	public Object payLog(ProceedingJoinPoint pjp)
	{
		Object returnObj = "error";
		
		try
		{
			String buyer = (String)session.getAttribute("id");
			logger.info(""+pjp.getArgs().length);
			ItemDTOList list = (ItemDTOList)pjp.getArgs()[1];
			
			returnObj = pjp.proceed();
			
			for(ItemDTO idto : list.getList()) 
			{
				String name = idto.getName();
				String seller = idto.getSeller();
				String price = idto.getPrice();
				
				logger.info("name : {}", name);
				logger.info("seller : {}", seller);
				logger.info("price : {}", price);
				
				PayLogDTO plDTO = new PayLogDTO();
				
				plDTO.setBuyer(buyer);
				plDTO.setName(name);
				plDTO.setPrice(Integer.parseInt(price.replaceAll(" ", "").replaceAll(",", "")));
				plDTO.setSeller(seller);
				
				logDAO.insertPayLog(plDTO);
			}
		}
		catch(Throwable e)
		{
			e.printStackTrace();
			return "error";
		}
		
		
		
		return returnObj;
	}
}
