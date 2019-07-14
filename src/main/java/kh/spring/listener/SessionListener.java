
package kh.spring.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kh.spring.daoImpl.ChartDAOImpl;

public class SessionListener implements HttpSessionListener
{
	
	private static final Logger logger = LoggerFactory.getLogger(SessionListener.class);

	@Override
	public void sessionCreated(HttpSessionEvent se)
	{
		try
		{
			ChartDAOImpl chartDAO = new ChartDAOImpl();
			
			int todayRecordExistCheck = chartDAO.selectCountTodayRecord();	//0이면 insert 해야되고 1이면 그냥 진행하면 된다.
			
			if(todayRecordExistCheck == 0)
			{
				logger.info("오늘 Record 가 없음");
				
				int insertResult = chartDAO.insertTodayRecord();			//오늘 날짜 Record를 추가한다.
				
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
	
//	@Autowired
//	ChartDAOImpl chartDAO;
//	
//	@Override
//	public void sessionCreated(HttpSessionEvent se)
//	{
//		
//		try
//		{
//			ChartDAO chartDAO = new ChartDAOImpl();
//			chartDAO.visitCountPlus();
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//		
////		HttpSession session = se.getSession();
////		
////		 ApplicationContext ctx = 
////             WebApplicationContextUtils.
////                   getWebApplicationContext(session.getServletContext());
////		 
////         SqlSessionTemplate sst = 
////             (SqlSessionTemplate) ctx.getBean("sqlSessionFactory");
////         
////         System.out.println(sst.update("ChartDAO.visitCountPlus"));
//
//	}
//
//	@Override
//	public void sessionDestroyed(HttpSessionEvent se)
//	{
//		
//		
//	}
//	@Override
//	public void sessionCreated(HttpSessionEvent se)
//	{
//		this.getSessionService(se).update("ChartDAO.visit");
//	}
//	
//	@Override
//	public void sessionDestroyed(HttpSessionEvent se)
//	{
//	}
//	
//	private SqlSessionTemplate getSessionService(HttpSessionEvent se)
//	{
//		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(se.getSession().getServletContext());
//		return (SqlSessionTemplate)context.getBean("sqlSession");
//	}
	
}
