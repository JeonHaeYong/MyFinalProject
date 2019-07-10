package kh.spring.fin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.service.AnimalHospitalService;

@Controller
public class AnimalController {
	@Autowired
	HttpSession session;
	@Autowired
	AnimalHospitalService ahs;
	
	@RequestMapping("toHospital")
	public ModelAndView toHospital(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage); // currentPage
		List<AnimalHospitalDTO> list = null;
		String navi = null;
		try {
			list = ahs.selectAniHospitalPerPage(currentPage);//currentPage
			navi = ahs.getNaviForAniHospital(currentPage);//currentPage
		}catch(Exception e) {e.printStackTrace();}
		mav.addObject("list", list);
		mav.addObject("navi", navi);
		mav.setViewName("animal/hospital");
		return mav;
	}
}
