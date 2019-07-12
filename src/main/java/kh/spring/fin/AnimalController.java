package kh.spring.fin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.dto.ProtectionCenterDTO;
import kh.spring.service.AnimalHospitalService;
import kh.spring.service.ProtectionCenterService;

@Controller
public class AnimalController {
	@Autowired
	HttpSession session;
	@Autowired
	AnimalHospitalService ahs;
	@Autowired
	ProtectionCenterService pcs;
	
	@RequestMapping("toHospital")
	public ModelAndView toHospital(HttpServletRequest request) {// 동물병원 조회
		ModelAndView mav = new ModelAndView();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<AnimalHospitalDTO> list = null;
		String navi = null;
		try {
			list = ahs.selectAniHospitalPerPage(currentPage);
			navi = ahs.getNaviForAniHospital(currentPage, null);//검색아님 option = null
		}catch(Exception e) {e.printStackTrace();}
		mav.addObject("list", list);
		mav.addObject("navi", navi);
		mav.setViewName("animal/hospital");
		return mav;
	}
	@RequestMapping("searchToHospital")
	public ModelAndView searchHospital(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String option = request.getParameter("option");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<AnimalHospitalDTO> list = new ArrayList<>();
		String navi = null;
		try {
			list = ahs.searchAniHospitalPerPage(currentPage, option);
			navi = ahs.getNaviForAniHospital(currentPage, option);
		}catch(Exception e) {e.printStackTrace();}
		mav.addObject("list", list);
		mav.addObject("navi", navi);
		mav.setViewName("animal/hospital");
		return mav;
	}
	@RequestMapping("toCenter")
	public ModelAndView toCenter(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<ProtectionCenterDTO> list = null;
		String navi = null;
		try {
			navi = pcs.getNaviForCenter(currentPage, null);
			list = pcs.selectCenterPerPage(currentPage);
		}catch(Exception e) {e.printStackTrace();}
		mav.addObject("list", list);
		mav.addObject("navi", navi);
		mav.setViewName("animal/protectionCenter");
		return mav;
	}
	@RequestMapping("searchToCenter")
	public ModelAndView searchToCenter(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String option = request.getParameter("option");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		System.out.println(option + "현재페이지" + currentPage);
		List<ProtectionCenterDTO> list = null;
		String navi = null;
		try {
			navi = pcs.getNaviForCenter(currentPage, option);
			list = pcs.searchCenterPerPage(currentPage, option);
		}catch(Exception e) {e.printStackTrace();}
		mav.addObject("list", list);
		mav.addObject("navi", navi);
		mav.setViewName("animal/protectionCenter");
		return mav;
	}
}
