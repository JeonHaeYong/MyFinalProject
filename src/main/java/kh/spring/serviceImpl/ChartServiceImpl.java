package kh.spring.serviceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dao.ChartDAO;
import kh.spring.dto.ACSDTO;
import kh.spring.service.BlackListService;
import kh.spring.service.ChartService;

@Service
public class ChartServiceImpl implements ChartService
{
	private static final Logger logger = LoggerFactory.getLogger(ChartServiceImpl.class);
	
	@Autowired
	BlackListService bs;
	@Autowired
	ChartDAO chartDAO;
	
	@Override
	public String getVisitCount() throws Exception
	{
		JsonObject jo = new JsonObject();
		
		int todayVisitCount = chartDAO.getTodayVisitCount();
		int recentSevenVisitCount = chartDAO.getRecentSevenVisitCount();
		int recentThirtyVisitCount = chartDAO.getRecentThirtyVisitCount();
		
//		int totalVisitCount = chartDAO.getTotalVisitCount();
//		int lastMonthVisitCount = chartDAO.getMonthVisitCount(2);
//		String lastMonthVisitTime = chartDAO.getMonthVisitTime(2);
//		int thisMonthVisitCount = chartDAO.getMonthVisitCount(1);
//		String thisMonthVisitTime = chartDAO.getMonthVisitTime(1);
		
		jo.addProperty("todayVisitCount", todayVisitCount);
		jo.addProperty("recentSevenVisitCount", recentSevenVisitCount);
		jo.addProperty("recentThirtyVisitCount", recentThirtyVisitCount);

//		jo.addProperty("totalVisitCount", totalVisitCount);
//		jo.addProperty("lastMonthVisitCount", lastMonthVisitCount);
//		jo.addProperty("thisMonthVisitCount", thisMonthVisitCount);
//		
//		logger.info("오늘 방문자 : {}", todayVisitCount);
//		logger.info("최근 7일 평균 방문자 : {}", recentSevenVisitCount);
//		logger.info("최근 30일 평균 방문자 : {}", recentThirtyVisitCount);
//		logger.info("총 방문자 : {}", totalVisitCount);
//		logger.info("{} 하루 평균 방문자 : {}", lastMonthVisitTime, lastMonthVisitCount);
//		logger.info("{} 하루 평균 방문자 : {}",thisMonthVisitTime, thisMonthVisitCount);
		
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= 12 ; i++)
		{
			JsonObject jajo = new JsonObject();
			jajo.addProperty("time", chartDAO.getMonthVisitTime(i).get(0));
			jajo.addProperty("count", chartDAO.getMonthVisitCount(i));
			jajo.addProperty("pay", chartDAO.getMonthPayAmount(i));
			ja.add(jajo);
		}
		
		jo.add("year", ja);
		
		return new Gson().toJson(jo);
	}

	@Override
	public String insertRandomRecord() throws Exception
	{
		for(int i = 1; i <= 730 ; i++)
		{
			int randomNum = (int) ( Math.random() * 100 + 1 );
			chartDAO.insertRandomRecord(i, randomNum, randomNum * 1000);
			
			if(i == 730)
			{
				logger.info("데이터 {} 개 삽입 완료", i);
				
				return "redirect: admin-chart";
			}
		}
		
		return "error";
	}

	@Override
	public int updateTodayPayAmount(int money) throws Exception
	{
		return chartDAO.updateTodayPayAmount(money);
	}

	@Override
	public String selectACSDTO() throws Exception
	{
		List<ACSDTO> list = chartDAO.selectACSDTO();
		
		JsonObject outerJO = new JsonObject();
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			
			String location = list.get(i-1).getArea();
			int number = list.get(i-1).getNum();
			
			jo.addProperty("area", location);
			jo.addProperty("num", number);
			
			ja.add(jo);
		}
		
		outerJO.add("array", ja);
		
		return new Gson().toJson(outerJO);
	}

	

	
	
}
