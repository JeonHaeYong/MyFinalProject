package kh.spring.fin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.DonationDTO;
import kh.spring.dto.DonationPaymentDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ChartService;
import kh.spring.service.DonationPaymentService;
import kh.spring.service.DonationService;
import kh.spring.service.MemberService;

@Controller
public class DonationController {
	@Autowired
	DonationService donationService;
	@Autowired
	MemberService ms;
	@Autowired
	ChartService cs;
	
	@Autowired
	private DonationPaymentService dps;

	@RequestMapping(value = "donation", method = RequestMethod.GET)
	public Object donationPage() {
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

	@RequestMapping("donationForm")
	public String donationForm_loginCheck(HttpServletRequest request) {
		MemberDTO member = ms.selectOneMemberService((String) request.getSession().getAttribute("id"));
		request.setAttribute("member", member);
		try {
			ModelAndView mav = (ModelAndView)donationService.selectRecentDTO();
			String donationName = ((DonationDTO)mav.getModel().get("dto")).getName();
			request.setAttribute("donationName", donationName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "donation/donationForm";
	}

	@RequestMapping("donationProc")
	public String donationProc_loginCheck(HttpServletRequest request, DonationPaymentDTO dto) {
		System.out.println(dto.getDonator_name());
		try {
			dps.insertDonationPaymentService(dto);
			cs.updateTodayPayAmount(dto.getDonation());
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:toMyPage_support";
	}

}
