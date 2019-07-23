package kh.spring.fin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.service.DonationService;

@Controller
public class DonationController
{
	@Autowired
	DonationService donationService;
	
	@RequestMapping(value = "donation", method = RequestMethod.GET)
	public Object donationPage()
	{
		Object result = "error";
		
		try
		{
			result = donationService.selectRecentDTO();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
		return result;
	}
}
