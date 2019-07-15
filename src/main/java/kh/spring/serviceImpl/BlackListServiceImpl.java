package kh.spring.serviceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.daoImpl.BlackListDAOImpl;
import kh.spring.dto.BlackListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.fin.AdminController;
import kh.spring.service.BlackListService;

@Service
public class BlackListServiceImpl implements BlackListService
{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MemberServiceImpl ms;
	@Autowired
	BlackListDAOImpl blacklistDAO;
	
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
	public BlackListDTO selectById(BlackListDTO dto) throws Exception
	{
		return blacklistDAO.selectById(dto);
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
	public String searchMember(String id) throws Exception
	{
		logger.info("검색한 ID : {}", id);
		List<MemberDTO> list = ms.selectByLikeId(id);
		logger.info("검색된 아이디의 수 : {}", list.size());
		
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
		
		return new Gson().toJson(ja);
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
}
