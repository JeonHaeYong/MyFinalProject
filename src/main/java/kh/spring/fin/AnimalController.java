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
	public String toHospital(HttpServletRequest request) {// 동물병원 조회
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<AnimalHospitalDTO> list = null;
		String navi = null;
		try {
			list = ahs.selectAniHospitalPerPageService(currentPage);
			navi = ahs.getNaviForAniHospitalService(currentPage, null);//검색아님 option = null
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "animal/hospital";
	}
	@RequestMapping("searchToHospital")
	public String searchHospital(HttpServletRequest request) {
		String option = request.getParameter("option");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<AnimalHospitalDTO> list = new ArrayList<>();
		String navi = null;
		try {
			list = ahs.searchAniHospitalPerPageService(currentPage, option);
			navi = ahs.getNaviForAniHospitalService(currentPage, option);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "animal/hospital";
	}
	@RequestMapping("toCenter")
	public String toCenter(HttpServletRequest request) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<ProtectionCenterDTO> list = null;
		String navi = null;
		try {
			navi = pcs.getNaviForCenterService(currentPage, null);
			list = pcs.selectCenterPerPageService(currentPage);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "animal/protectionCenter";
	}
	@RequestMapping("searchToCenter")
	public String searchToCenter(HttpServletRequest request) {
		String option = request.getParameter("option");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		System.out.println(option + "현재페이지" + currentPage);
		List<ProtectionCenterDTO> list = null;
		String navi = null;
		try {
			navi = pcs.getNaviForCenterService(currentPage, option);
			list = pcs.searchCenterPerPageService(currentPage, option);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return"animal/protectionCenter";
	}
}
