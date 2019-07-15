
package kh.spring.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import kh.spring.daoImpl.ChartDAOImpl;

@Component
public class SessionListener implements HttpSessionListener, ApplicationContextAware
{
	
	private static final Logger logger = LoggerFactory.getLogger(SessionListener.class);
	
	@Autowired
	ChartDAOImpl chartDAO;
	
	@Override
	public void sessionCreated(HttpSessionEvent se)
	{
		try
		{
			logger.info("Session 생성됨");
			
			int todayRecordExistCheck = chartDAO.selectCountTodayRecord(); //0이면 insert 해야되고 1이면 그냥 진행하면 된다.
			
			if(todayRecordExistCheck == 0)
			{
				logger.info("오늘 Record 가 없음");
				
				int insertResult = chartDAO.insertTodayRecord(); //오늘 날짜 Record를 추가한다.
				
				if(insertResult == 1)
				{
					logger.info("오늘 Record 추가 완료");
				}
				else
				{
					logger.error("오늘 Record 추가 중 에러 발생");
				}
				
			}
			
			int result = chartDAO.visitCountPlus();
			
			if(result == 1)
			{
				logger.info("방문자 수 1 추가");
			}
			else
			{
				logger.warn("방문자 수가 추가되지 않음");
			}
		}
		catch(Exception e)
		{
			logger.error("방문자 수 추가 중 Exception 발생");
		}
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se)
	{
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException
	{
		if(applicationContext instanceof WebApplicationContext)
		{
			( (WebApplicationContext)applicationContext ).getServletContext().addListener(this);
		}
		else
		{
			//Either throw an exception or fail gracefully, up to you
			throw new RuntimeException("Must be inside a web application context");
		}
	}
}
