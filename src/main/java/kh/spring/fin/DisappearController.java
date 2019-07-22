package kh.spring.fin;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.DisappearReportDTO;
import kh.spring.service.DisappearReportService;

@Controller
public class DisappearController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private DisappearReportService drs;
	
	@RequestMapping("toDisappearList")
	public String toDisappearList(HttpServletRequest request) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<DisappearReportDTO> list = new ArrayList<>();
		String navi = null;
		try {
		 list = drs.selectPerPageService(currentPage);
		 navi = drs.getNaviService(currentPage);
		}catch(Exception e) {e.printStackTrace();}
		System.out.println("지역:"+list.get(0).getDisappearArea());
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "disappear/disappearList";
	}
	@RequestMapping("toReportForm")
	public String toReportForm(HttpServletRequest request) {
		String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		request.setAttribute("todayDate", todayDate);
		return "disappear/reportForm";
	}
	
	@RequestMapping("insertProc.dis")
	public String insertProc(HttpServletRequest request, MultipartFile image) {
		
		String disappearDate = request.getParameter("disappearDate");
		System.out.println("날짜ㄴㄴㄴㄴ"+disappearDate);
		java.sql.Date disDate = null;
		try {
			 disDate = java.sql.Date.valueOf(disappearDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String areaList = request.getParameter("areaList");
		String disappearArea = request.getParameter("disappearArea");
		String tel = request.getParameter("tel");
		String kind = request.getParameter("kind");
		String gender = request.getParameter("gender");
		String neuter = request.getParameter("neuter");
		String age = request.getParameter("age");
		String furColor = request.getParameter("furColor");
		String feature = request.getParameter("feature");
		String et = request.getParameter("et");
		String writer = (String)session.getAttribute("id");
		String ip = request.getRemoteAddr();
		
		if(image.getSize() == 0) { // 이미지가 없을 경
			DisappearReportDTO drdto = new DisappearReportDTO(0, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, null, writer, null, ip);
			drs.insertNoImageService(drdto);
		}else {// 이미지가 있을 경
			String imgPath = drs.imageUploadService(image);
			DisappearReportDTO drdto = new DisappearReportDTO(0, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath, writer, null, ip);
			try {
				drs.insert(drdto);
			}catch(Exception e) {e.printStackTrace();}
		}
		return "redirect:/toDisappearList?currentPage="+session.getAttribute("currentPage");
	}
	@RequestMapping("toReportContent")
	public String toContent(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		DisappearReportDTO content = null;
		try {
			content = drs.toReportContentService(seq);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("content", content);
		return "disappear/ReportContents";
	}
	@RequestMapping("toAlterForm")
	public String toAlterForm(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		DisappearReportDTO content = null;
		try {
			content = drs.toReportContentService(seq);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("content", content);
		return "disappear/alterForm";
	}
	@RequestMapping("alterProc.dis")
	public String alterProc(HttpServletRequest request, MultipartFile image) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		String disappearDate = request.getParameter("disappearDate");
		System.out.println("날짜ㄴㄴㄴㄴ"+disappearDate);
		java.sql.Date disDate = null;
		try {
			 disDate = java.sql.Date.valueOf(disappearDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		String areaList = request.getParameter("areaList");
		String disappearArea = request.getParameter("disappearArea");
		String tel = request.getParameter("tel");
		String kind = request.getParameter("kind");
		String gender = request.getParameter("gender");
		String neuter = request.getParameter("neuter");
		String age = request.getParameter("age");
		String furColor = request.getParameter("furColor");
		String feature = request.getParameter("feature");
		String et = request.getParameter("et");
		if(image.getSize() == 0) { // 이미지가 없을 경
			DisappearReportDTO drdto = new DisappearReportDTO(0, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, null, null, null, null);
			drs.insertNoImageService(drdto);
		}else {// 이미지가 있을 경
			String imgPath = drs.imageUploadService(image);
			DisappearReportDTO drdto = new DisappearReportDTO(0, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath, null, null, null);
			try {
				drs.insert(drdto);
			}catch(Exception e) {e.printStackTrace();}
		}
		return "redirect:/toReportContent?seq="+seq;
	}
	
}

