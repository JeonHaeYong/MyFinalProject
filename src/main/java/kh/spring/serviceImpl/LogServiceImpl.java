package kh.spring.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.LogDAO;
import kh.spring.dto.PayLogDTO;
import kh.spring.service.LogService;

@Service
public class LogServiceImpl implements LogService
{
	private static final Logger logger = LoggerFactory.getLogger(LogServiceImpl.class);
	
	@Autowired
	LogDAO logDAO;
	
	@Override
	public Object insertDummy() throws Exception
	{
		for(int i = 1 ; i <= 300 ; i++)
		{
			PayLogDTO dto = new PayLogDTO();
			dto.setBuyer("buyer"+i);
			dto.setName("name"+i);
			dto.setPrice(1000+i);
			dto.setSeller("seller"+i);
			
			int insertResult = logDAO.insertPayLog(dto);
			
			if(insertResult != 1)
			{
				logger.error("데이터 삽입 중 에러 발생");
				break;
			}
		}
		
		return "redirect: admin-paylog";
	}
	
	@Override
	public String selectPayLog(String page, String condition) throws Exception
	{
		if(condition.equals("buyer-like"))
		{
			
		}
		else if(condition.equals("seller-like"))
		{
			
		}
		else if(condition.equals("buyer-equal"))
		{
			
		}
		else if(condition.equals("seller-equal"))
		{
			
		}
		else if(condition.equals("date"))
		{
			
		}
		
		return null;
	}
}
