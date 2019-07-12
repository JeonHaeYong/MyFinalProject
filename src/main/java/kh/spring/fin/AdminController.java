package kh.spring.fin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dto.MemberDTO;
import kh.spring.serviceImpl.MemberServiceImpl;

@Controller
public class AdminController
{
	@Autowired
	MemberServiceImpl ms;
	
	@RequestMapping(value = "admin-member", method = RequestMethod.GET)
	public String manageMemberPage()
	{
		return "myPage/admin/admin_manage_member";
	}

	@ResponseBody
	@RequestMapping(value = "admin-member-search")
	public String searchMember(String id)
	{
		System.out.println("넘어온 ID : " + id);
		
		List<MemberDTO> list = ms.selectByLikeId(id);
		
		System.out.println("검색된 결과 수 : " + list.size());
		
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			jo.addProperty("id", list.get(i-1).getId());
			ja.add(jo);
		}
		
		
		return new Gson().toJson(ja);
	}
}
