package kh.spring.fin;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.BlackListDTO;
import kh.spring.serviceImpl.BlackListServiceImpl;
import kh.spring.serviceImpl.ChartServiceImpl;

@Controller
public class AdminController
{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	BlackListServiceImpl blackService;
	@Autowired
	ChartServiceImpl chartService;
	
	@RequestMapping(value = "admin-member")
	public String manageMemberPage()
	{
		logger.info("회원 관리 페이지");
		return "myPage/admin/admin_manage_member";
	}
	@ResponseBody
	@RequestMapping(value = "admin-member-search", produces="application/json;charset=utf-8")
	public String searchMember(String id)
	{
		String result = "error";
		try
		{
			result = blackService.searchMember(id);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
		
	}
	@RequestMapping(value = "admin-member-black")
	public String blackMember(String id, String reason)
	{
		String result = "error";
		try
		{
			result = blackService.blackMember(id, reason);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@RequestMapping(value = "admin-member-release", method = RequestMethod.POST)
	public String releaseMember(BlackListDTO dto)
	{
		String result = "error";
		
		try
		{
			result = blackService.delete(dto);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "admin-chart")
	public String chartPage()
	{
		return "myPage/admin/admin_chart";
	}
	@ResponseBody
	@RequestMapping(value = "admin-chart-visit", produces="application/json;charset=utf-8")
	public String chartGetVisitCount()
	{
		String result = "error";
		try
		{
			result = chartService.getVisitCount();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
		
	}
	@RequestMapping(value = "admin-chart-insert")
	public String insertDummyData()
	{
		String result = "error";
		try
		{
			result = chartService.insertRandomRecord();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
}
