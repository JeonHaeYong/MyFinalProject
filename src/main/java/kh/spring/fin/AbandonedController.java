package kh.spring.fin;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xml.sax.SAXException;

import kh.spring.daoImpl.ApiAbandonedAnimalDAOImpl;
import kh.spring.dto.ApiAbandonedAnimalDTO;
import kh.spring.dto.TempProtectDTO;
import kh.spring.serviceImpl.ApiAbandonedAnimalServiceImpl;
import kh.spring.serviceImpl.TempProtectServiceImpl;

@Controller
public class AbandonedController {
	@Autowired
	private HttpSession session;

	@Autowired
	ApiAbandonedAnimalDAOImpl dao;

	@Autowired
	ApiAbandonedAnimalServiceImpl apiService;

	@Autowired
	TempProtectServiceImpl tempService;
	
	@RequestMapping("deleteMyTempProtect")
	public String deleteMyTempProtect(int seq) {
		tempService.deleteTempProtect(seq);
		return "redirect: listTempProtect?currentPage=1";
	}
	@RequestMapping("toModifyPageTempProtect")
	public String toModifyPageTempProtect(HttpServletRequest request, int seq) {
		TempProtectDTO dto = tempService.selectOneTempProtect(seq);
		request.setAttribute("dto", dto);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String findDateString = sdf.format(dto.getFindDate());
		request.setAttribute("findDateString", findDateString);
		
		Date today = new Date();
		String todayStr = sdf.format(today);
		request.setAttribute("todayStr", todayStr);
		
		return "abandoned/modifyTempProtect";
	}
	@RequestMapping("modifyTempProtect")
	public String modifyTempProtect(TempProtectDTO dto, String findDateString, MultipartFile image) throws ParseException, IllegalStateException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(findDateString);
		Date findDate = (Date) sdf.parse(findDateString);
		dto.setFindDate(findDate);

		String resourcePath = session.getServletContext().getRealPath("/resources/images/tempProtect/");
		long time = System.currentTimeMillis();
		String realPath = resourcePath + "/" + time +"_"+image.getOriginalFilename();
		System.out.println(realPath);
		image.transferTo(new File(realPath));
		System.out.println(realPath);
		String imagePath = "resources/images/tempProtect/" + time +"_"+image.getOriginalFilename();
		dto.setImagePath(imagePath);


		dto.setWriter((String)session.getAttribute("id"));
		Timestamp ts = new Timestamp(time);
		dto.setWriteTime(ts);
		int result = tempService.modifyTempProtect(dto);
		
		return "redirect: listTempProtect?currentPage=1";
	}
	@RequestMapping("detailTempProtect")
	public String detailTempProtect(HttpServletRequest request, int seq) {
		
		TempProtectDTO dto = tempService.selectOneTempProtect(seq);
		request.setAttribute("dto", dto);
		request.setAttribute("loginId", session.getAttribute("id"));
		return "abandoned/detailTempProtect";
	}
	@RequestMapping("uploadTempProtect")
	public String uploadTempProtect(TempProtectDTO dto, String findDateString, MultipartFile image) throws ParseException, IllegalStateException, IOException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date findDate = (Date) sdf.parse(findDateString);
		dto.setFindDate(findDate);

		String resourcePath = session.getServletContext().getRealPath("/resources/images/tempProtect/");
		long time = System.currentTimeMillis();
		String realPath = resourcePath + "/" + time +"_"+image.getOriginalFilename();
		image.transferTo(new File(realPath));
		System.out.println(realPath);
		String imagePath = "resources/images/tempProtect/" + time +"_"+image.getOriginalFilename();
		dto.setImagePath(imagePath);

		dto.setWriter((String)session.getAttribute("id"));
		Timestamp ts = new Timestamp(time);
		dto.setWriteTime(ts);
		int result = tempService.uploadTempProtect(dto);
		
		return "redirect: listTempProtect?currentPage=1";
	}

	@RequestMapping("listTempProtect")
	public String tempProtect(HttpServletRequest request, int currentPage ) {
		System.out.println(currentPage);
		request.setAttribute("loginId", session.getAttribute("id"));
		List<TempProtectDTO> list = tempService.selectAllTempProtect(currentPage);
		Map<String, Integer> pageNavi = tempService.getNaviForTempProtect(currentPage);
	
		request.setAttribute("list", list);
		request.setAttribute("listsize", list.size());
		request.setAttribute("pageNavi", pageNavi);
		return "abandoned/listTempProtect";
	}
	@RequestMapping("writeTempProtect")
	public String writeTempProtect(HttpServletRequest request) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String todayStr = sdf.format(today);
		request.setAttribute("todayStr", todayStr);

		return "abandoned/writeTempProtect";
	}
	@RequestMapping("detailAbandoned")
	public String detailAbandoned(HttpServletRequest request, int seq) {
		
		ApiAbandonedAnimalDTO dto = apiService.selectOneApiAbandonedAnimal(seq);
		request.setAttribute("dto", dto);
		return "abandoned/detailAbandoned";
	}
	@RequestMapping(value="shelterAjax", produces="application/json;charset=utf-8")
	@ResponseBody
	public String shelterAjax(String sidoCd, String sigunguCd) throws SAXException, IOException, InterruptedException {
		try {
			return apiService.shelterAjax(sidoCd, sigunguCd);
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("toAbandoned")
	public String abandoned(HttpServletRequest request, int currentPage) {

		try {
			List<ApiAbandonedAnimalDTO> list = apiService.selectAll(currentPage);
			Map<String, Integer> pageNavi = apiService.getNaviTotal(currentPage);
			request.setAttribute("list", list);
			request.setAttribute("pageNavi", pageNavi);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			String todayStr = sdf.format(today);
			request.setAttribute("todayStr", todayStr);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "abandoned/abandoned";
	}

	@RequestMapping("select")
	public String select(HttpServletRequest request, int currentPage, String from, String to, String species,
			String speciesKind, String sido, String sigungu, String shelter, String processState) {
		System.out.println(currentPage);
		System.out.println(from);
		System.out.println(to);

		request.setAttribute("from", from);
		request.setAttribute("to", to);
		request.setAttribute("sido", sido);
		request.setAttribute("sigungu", sigungu);
		request.setAttribute("shelter", shelter);
		request.setAttribute("species", species);
		request.setAttribute("speciesKind", speciesKind);
		request.setAttribute("processState", processState);
		System.out.println(sido);
		System.out.println(sigungu);
		System.out.println(shelter);
		System.out.println(species);
		System.out.println(processState);

		try {
			List<ApiAbandonedAnimalDTO> list = apiService.selectByCondition(currentPage, from, to, species, speciesKind, sido, sigungu, shelter, processState);
			Map<String, Integer> pageNavi = apiService.getNaviCondition(currentPage,from, to, species, speciesKind, sido, sigungu, shelter, processState );
			request.setAttribute("list", list);
			request.setAttribute("listsize", list.size());
			System.out.println(list.size());
			request.setAttribute("pageNavi", pageNavi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "abandoned/abandoned";
	}
	


}

