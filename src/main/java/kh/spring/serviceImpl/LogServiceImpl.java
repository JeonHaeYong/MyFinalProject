package kh.spring.serviceImpl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
			dto.setSeller("seller"+(301-i));
			
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
	public String selectPayLog(String page, String condition, String keyword) throws Exception
	{
		logger.info("검색조건 : {}", condition);
		logger.info("검색대상 : {}", keyword);
		logger.info("페이지: {}", page);
		
		List<PayLogDTO> list = null;
		HashMap<String, String> params = new HashMap<>();
		
		if((page == null) || (page.equals("")))
		{
			page = "1";
		}
		int currentPage = Integer.parseInt(page);
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		
		int pageTotalCount = 0;
		int recordTotalCount = 0;
		
		int start = currentPage * recordCountPerPage - recordCountPerPage + 1;
		int end = currentPage * recordCountPerPage;
		
		boolean needPrev = true;
		boolean needNext = true;
		
		
		params.put("start", ""+start);
		params.put("end", ""+end);
		
		
		
		if((condition.equals("buyer-like")) || (condition.equals("seller-like")))
		{
			params.put("keyword", "%"+keyword+"%");
		}
		else if(((condition.equals("buyer-equal")) || (condition.equals("seller-equal"))) || (condition.equals("date")))
		{
			params.put("keyword", keyword);
		}
		else
		{
			return "error";
		}
		
		
		
		if(condition.equals("buyer-like"))
		{
			list = logDAO.selectAllPayLogByLikeBuyer(params);
			recordTotalCount = logDAO.selectCountPayLogByLikeBuyer(params);
		}
		else if(condition.equals("seller-like"))
		{
			list = logDAO.selectAllPayLogByLikeSeller(params);
			recordTotalCount = logDAO.selectCountPayLogByLikeSeller(params);
		}
		else if(condition.equals("buyer-equal"))
		{
			list = logDAO.selectAllPayLogByBuyer(params);
			recordTotalCount = logDAO.selectCountPayLogByBuyer(params);
		}
		else if(condition.equals("seller-equal"))
		{
			list = logDAO.selectAllPayLogBySeller(params);
			recordTotalCount = logDAO.selectCountPayLogBySeller(params);
		}
		else if(condition.equals("date"))
		{
			list = logDAO.selectAllPayLogByDate(params);
			recordTotalCount = logDAO.selectCountPayLogByDate(params);
		}
		else
		{
			logger.info("에러");
			return "error";
		}
		
		
		
		logger.info("검색된 아이디의 수 : {}", list.size());
		
		JsonObject outerjo = new JsonObject();
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			int seq = list.get(i-1).getSeq();
			String buyer = list.get(i-1).getBuyer();
			String name = list.get(i-1).getName();
			int price = list.get(i-1).getPrice();
			String seller = list.get(i-1).getSeller();
			Timestamp time = list.get(i-1).getTime();
			
			
			jo.addProperty("seq", seq);
			jo.addProperty("buyer", buyer);
			jo.addProperty("name", name);
			jo.addProperty("price", price);
			jo.addProperty("seller", seller);
			jo.addProperty("time", ""+time);
			
			ja.add(jo);
		}
		
		outerjo.add("array", ja);
		
		
		
		
		if( recordTotalCount % recordCountPerPage == 0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}

		if(currentPage < 1)
		{
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount)
		{
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		if(startNavi == 1)
		{
			needPrev = false;
		}
		if(endNavi == pageTotalCount)
		{
			needNext = false;
		}
		
		outerjo.addProperty("currentPage", currentPage);
		outerjo.addProperty("needPrev", needPrev);
		outerjo.addProperty("needNext", needNext);
		outerjo.addProperty("startNavi", startNavi);
		outerjo.addProperty("endNavi", endNavi);
		
		
		
		return new Gson().toJson(outerjo);
	}
}
