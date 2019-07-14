package kh.spring.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.spring.daoImpl.ChartDAOImpl;
import kh.spring.service.ChartService;

@Service
public class ChartServiceImpl implements ChartService
{
	private static final Logger logger = LoggerFactory.getLogger(ChartServiceImpl.class);
	
	@Autowired
	BlackListServiceImpl bs;
	@Autowired
	ChartDAOImpl chartDAO;
	
	
	
	@Override
	public String getVisitCount() throws Exception
	{
		JsonObject jo = new JsonObject();
		
		int todayVisitCount = chartDAO.getTodayVisitCount();
		jo.addProperty("todayVisitCount", todayVisitCount);
		logger.info("오늘 방문자 : {}", todayVisitCount);
		
		
		return new Gson().toJson(jo);
	}

	

	
	
}
