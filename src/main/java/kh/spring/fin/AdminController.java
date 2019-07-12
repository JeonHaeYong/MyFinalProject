package kh.spring.fin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dto.BlackListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.serviceImpl.BlackListServiceImpl;
import kh.spring.serviceImpl.MemberServiceImpl;

@Controller
public class AdminController
{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MemberServiceImpl ms;
	@Autowired
	BlackListServiceImpl bs;
	
	@RequestMapping(value = "admin-member", method = RequestMethod.GET)
	public String manageMemberPage()
	{
		logger.info("회원 관리 페이지");
		return "myPage/admin/admin_manage_member";
	}

	@ResponseBody
	@RequestMapping(value = "admin-member-search")
	public String searchMember(String id)
	{
		logger.info("검색한 ID : {}", id);
		List<MemberDTO> list = ms.selectByLikeId(id);
		logger.info("검색된 아이디의 수 : {}", list.size());
		
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			jo.addProperty("id", list.get(i-1).getId());
			ja.add(jo);
		}
		
		
		return new Gson().toJson(ja);
	}
	
	@RequestMapping(value = "admin-member-black")
	public String blackMember(String id, String reason)
	{
		try
		{
			String[] idArr = id.split(" ");
			logger.info("블랙할 아이디의 수 {}", idArr.length-1);
			logger.info("블랙 사유 : {}", reason);
			
			if(idArr.length >= 2)
			{
				for(int i = 2 ; i <= idArr.length ; i++)
				{
					String target = idArr[i-1];
					logger.info("블랙할 아이디 : {}", target);
					
					bs.insert(new BlackListDTO(target, reason));
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return "admin-member";
	}
	
}
