package kh.spring.serviceImpl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dao.BlackListDAO;
import kh.spring.dto.BlackListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.fin.AdminController;
import kh.spring.service.BlackListService;
import kh.spring.service.MemberService;

@Service
public class BlackListServiceImpl implements BlackListService
{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MemberService ms;
	@Autowired
	BlackListDAO blacklistDAO;
	
	@Override
	public void insert(BlackListDTO dto) throws Exception
	{
		if(dto.getReason() == null)
		{
			dto.setReason("없음");
		}
		
		if(blacklistDAO.selectCountById(dto) != 1)
		{
			blacklistDAO.insert(dto);
		}
		else
		{
			logger.warn("블랙리스트에 이미 존재하는 아이디 : {}", dto.getId());
		}
		
	}
	@Override
	public BlackListDTO selectById(BlackListDTO dto) throws Exception
	{
		return blacklistDAO.selectById(dto);
	}
	@Override
	public int selectCountById(BlackListDTO dto) throws Exception
	{
		int result = blacklistDAO.selectCountById(dto);
		
		logger.info("블랙리스트에서 해당 아이디 {} 로 검색한 결과 수 : {}",dto.getId(),result);
		
		return result;
	}
	@Override
	public String delete(BlackListDTO dto) throws Exception
	{
		String result = "error";
		
		if((dto.getId() != null) && (blacklistDAO.selectCountById(dto) != 0))
		{
			int deleteResult = blacklistDAO.deleteById(dto);
			
			if(deleteResult == 1)
			{
				logger.info("블랙리스트에서 삭제 성공 : {}", dto.getId());
				result = "redirect: admin-member";
			}
			else
			{
				logger.warn("블랙리스트에서 삭제 중 에러 발생 : {}", dto.getId());
			}
		}
		else
		{
			logger.warn("블랙리스트에 존재하지 않는 아이디 : {}", dto.getId());
		}
		
		return result;
	}

	@Override
	public String searchMember(String id, String page) throws Exception
	{
		logger.info("검색한 ID : {}", id);
		List<MemberDTO> list = ms.selectByLikeId(id, page);
		logger.info("검색된 아이디의 수 : {}", list.size());
		
		JsonObject outerjo = new JsonObject();
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			String resultId =list.get(i-1).getId();
			String status = "정상";
			
			try
			{
				status = "차단 사유 : " + this.selectById(new BlackListDTO(resultId)).getReason();
			}
			catch(java.lang.NullPointerException e){}
			
			
			jo.addProperty("id", resultId);
			jo.addProperty("status", status);
			ja.add(jo);
		}
		outerjo.add("array", ja);
		
		int currentPage = Integer.parseInt(page);
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordTotalCount = ms.selectCountByLikeId(id);
		int pageTotalCount;
		boolean needPrev = true;
		boolean needNext = true;
		
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
	@Override
	public String blackMember(String id, String reason) throws Exception
	{
		int result = 0;
		String[] idArr = id.split(" ");
		logger.info("블랙할 아이디의 수 {}", idArr.length-1);
		logger.info("블랙 사유 : {}", reason);
		
		if((reason == null) || reason.equals(""))
		{
			reason = "없음";
		}
		
		if(idArr.length >= 2)
		{
			for(int i = 2 ; i <= idArr.length ; i++)
			{
				String target = idArr[i-1];
				logger.info("블랙할 아이디 : {}", target);
				
				this.insert(new BlackListDTO(target, reason));
			}
			result = idArr.length - 1;
		}
		
		if(result != 0)
		{
			return "redirect: admin-member";
		}
		else
		{
			return "redirect: error";
		}
		
	}

	public String insertRandomMembers() throws Exception
	{
		String alphabetString = "abcdefghijklmnopqrstuvwxyz0123456789";
		
		for(int j = 1 ; j <= 1000 ; j++)
		{
			int times = (int)(Math.random() * 4 + 4);
			
			String idString = "";
			
			for(int i = 1 ; i <= times ; i++)
			{
				int index = (int)(Math.random() * 36);
				idString = idString + alphabetString.charAt(index);
			}
			
			int duplResult = ms.idDuplCheckService(idString);
			
			if(1 <= duplResult)
			{
				j = j -1;
				continue;
			}
			else
			{
				MemberDTO dto = new MemberDTO();
				
				dto.setId(idString);
				dto.setPassword("pwpw");
				dto.setName(idString + "name");
				dto.setEmail("sdfsdf@sdfsdf.sdfsdf");
				dto.setAddress2("jusojuso");
				
				int insertResult = ms.insertMemberService(dto);
				
				if(!(insertResult == 1))
				{
					j = j -1;
					continue;
				}
			}
		}
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setId("admin");
			dto.setPassword("pwpw");
			dto.setName("어드민");
			dto.setEmail("sdfsdf@sdfsdf.sdfsdf");
			dto.setAddress2("jusojuso");
			
			ms.insertMemberService(dto);
		}
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setId("client");
			dto.setPassword("pwpw");
			dto.setName("클라이언트");
			dto.setEmail("sdfsdf@sdfsdf.sdfsdf");
			dto.setAddress2("jusojuso");
			
			ms.insertMemberService(dto);
		}
		logger.info("아이디 삽입 완료");
		return "redirect: admin-member";
	}
	
	@Override
	public Object selectMembersInBlackList(String idForSearch, String page) throws Exception
	{
		HashMap<String, String> param = new HashMap<>();
		
		if((page == null) || (page.equals("")))
		{
			page = "1";
		}
		
		int currentPage = Integer.parseInt(page);
		int recordTotalCount = blacklistDAO.selectCount();
		int pageTotalCount;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		boolean needPrev = true;
		boolean needNext = true;
		
		int start = currentPage * recordCountPerPage - recordCountPerPage + 1;
		int end = currentPage * recordCountPerPage;
		
		param.put("id", "%" + idForSearch + "%");
		param.put("start", ""+start);
		param.put("end", ""+end);
		
		List<BlackListDTO> list = blacklistDAO.selectList(param);
		
		JsonObject outerjo = new JsonObject();
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			
			int seq = list.get(i-1).getSeq();
			String id = list.get(i-1).getId();
			String reason = list.get(i-1).getReason();
			Date time = list.get(i-1).getBlack_date();
			
			jo.addProperty("seq", seq);
			jo.addProperty("id", id);
			jo.addProperty("reason", reason);
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
