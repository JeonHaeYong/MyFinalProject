package kh.spring.fin;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.httpinvoker.HttpInvokerServiceExporter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.DisappearCommentsDTO;
import kh.spring.dto.DisappearReportDTO;
import kh.spring.service.DisappearCommentsService;
import kh.spring.service.DisappearReportService;

@Controller
public class DisappearController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private DisappearReportService drs;
	@Autowired
	private DisappearCommentsService dcService;
	
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
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "disappear/disappearList";
	}
	@RequestMapping("toReportForm")
	public String toReportForm_loginCheck(HttpServletRequest request) {
		String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		request.setAttribute("todayDate", todayDate);
		return "disappear/reportForm";
	}

	@RequestMapping("insertProc.dis")
	public String insertProc_loginCheck(HttpServletRequest request, MultipartFile[] image) {
		System.out.println(image.length);
		String disappearDate = request.getParameter("disappearDate");
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
		
			
			List<String> imgPath = drs.imageUploadService(image);
			DisappearReportDTO drdto = null;
			if(imgPath.size() == 2) {
				drdto = new DisappearReportDTO(0, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath.get(0), "noImage", "noImage", writer, null, ip);

			} else if(imgPath.size() ==3) {
				if(image[1].getSize()==0) {
					drdto = new DisappearReportDTO(0, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath.get(0), imgPath.get(1), "noImage", writer, null, ip);
				}else {
					drdto = new DisappearReportDTO(0, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath.get(0), imgPath.get(1), imgPath.get(2), writer, null, ip);
				}
			}
			
			try {
				drs.insert(drdto);
			}catch(Exception e) {e.printStackTrace();}
		
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
		
		//댓글
		List<DisappearCommentsDTO> list = dcService.selectAllDisappearCommentsService(seq,1);
		//(댓글 navi)
		List<String> reply_navi = dcService.getNaviForDisappearCommentsList(seq, 1);
		request.setAttribute("replyList", list);
		request.setAttribute("reply_navi", reply_navi);
		return "disappear/ReportContents";
	}
	@RequestMapping("toAlterForm")
	public String toAlterForm_loginCheck(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		DisappearReportDTO content = null;
		try {
			content = drs.toReportContentService(seq);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("content", content);
		request.setAttribute("todayDate", todayDate);
		return "disappear/alterForm";
	}
	@RequestMapping("alterProc.dis")
	public String alterProc_loginCheck(HttpServletRequest request, MultipartFile[] image) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println(image.length);
		System.out.println("글번호"+seq);
		
		String disappearDate = request.getParameter("disappearDate");
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
		
		List<String> imgPath = drs.imageUploadService(image);
		DisappearReportDTO drdto = null;
		if(imgPath.size()==1){
			System.out.println("이미지 없음");
			drdto = new DisappearReportDTO(seq, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, null, null, null, null, null, null);
		}else if(imgPath.size() == 2) {
			System.out.println("이미지 하나");
			drdto = new DisappearReportDTO(seq, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath.get(0), null, null, null, null, null);
		} else if(imgPath.size() ==3) {
			if(image[2].getSize()==0) {
				System.out.println("이미지 둘");
				drdto = new DisappearReportDTO(seq, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath.get(0), imgPath.get(1), null, null, null, null);
			}else {
				System.out.println("이미지 셋");
				drdto = new DisappearReportDTO(seq, disDate, areaList, disappearArea, tel, kind, gender, neuter, age, furColor, feature, et, imgPath.get(0), imgPath.get(1), imgPath.get(2), null, null, null);
			}
		}
			try {
				drs.updateService(drdto);
			}catch(Exception e) {e.printStackTrace();}
		
		return "redirect:/toReportContent?seq="+seq;
	}
	@RequestMapping("deleteProc.dis")
	public String deleteProc_loginCheck(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		try {
			drs.deleteService(seq);
		}catch(Exception e) {e.printStackTrace();}
		return "redirect:/toDisappearList?currentPage="+session.getAttribute("currentPage");
	}
	
}

