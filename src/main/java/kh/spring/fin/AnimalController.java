package kh.spring.fin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnimalController {

	@RequestMapping("toHospital")
	public ModelAndView toHospital() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("animal/hospital");
		return mav;
	}
}
