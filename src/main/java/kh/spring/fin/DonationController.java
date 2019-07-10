package kh.spring.fin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DonationController
{
	@RequestMapping(value = "donation", method = RequestMethod.GET)
	public String donationPage()
	{
		return "/donation/donation";
	}
}
