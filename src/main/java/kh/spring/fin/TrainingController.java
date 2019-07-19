package kh.spring.fin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.dto.FileDTO;
import kh.spring.dto.TrainingDTO;
import kh.spring.service.TrainingService;

@Controller
public class TrainingController {
	@Autowired
	private HttpSession session;
	@Autowired
	private TrainingService ts;
	
	
	@RequestMapping("toTrainingList")
	public String toTrainingList(HttpServletRequest request) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<TrainingDTO> list = new ArrayList<>();
		int count = 0;
		try {
			list = ts.trainingPerPageService(currentPage);
			count = ts.recordCountService();
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error.jsp";
		}
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "sense/trainingList";
	}
	@RequestMapping("toWriteForm")
	public String toWriteForm() {
		return "sense/writeForm";
	}
	@ResponseBody
	@RequestMapping("imageUpload.train")//서버에 이미지 업로드
	public String imageUpload(MultipartFile files) {
		System.out.println("이미지: " + files);
		 String imgPath = ts.imageUploadService(files);
		 return imgPath;
	}
	@RequestMapping("writeProc.train")
	public String insertTraining(FileDTO fdto, HttpServletRequest request) {
		System.out.println("이미지: " + fdto.getFiles() + "   제목 : " + fdto.getTitle() + "  글내용: " + fdto.getContent());
		String id = (String)session.getAttribute("id");
		String ip = request.getRemoteAddr();
		String date = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		long time = System.currentTimeMillis();
		
		if(fdto.getFiles().getSize() == 0) { // 이미지가 없을 경우
			System.out.println("이미지 없음");
			TrainingDTO tdto = new TrainingDTO(0, fdto.getTitle(),fdto.getContent(), null, id, null, ip);
			int result = 0;
			try {
				result = ts.NoImageService(tdto);
			}catch(Exception e) {
				e.printStackTrace();
				return "redirect:/error.jsp";
			}
		}else { // 이미지가 있을 경우
			System.out.println("이미지 있음");
			//DB에 저장할 썸네일 이미지 경로 생성 -> 내용 안에 이미지 중에 첫번째 사진
			String imgPath = null;
			String regex = "<img src=\"(.+?)\">";
			Pattern p = Pattern.compile(regex);
			Matcher m = p.matcher(fdto.getContent());
			if(m.find()) {imgPath = m.group(1);}
			
			//DB에 저장
			TrainingDTO tdto = new TrainingDTO(0, fdto.getTitle(), fdto.getContent(), imgPath, id, null, ip);
			int result = 0;
			try {
				result = ts.insertTrainingService(tdto);
			}catch(Exception e) {
				e.printStackTrace();
				return "redirect:/error.jsp";
			}
			request.setAttribute("result", result);
		}
		return "redirect:/toTrainingList?currentPage="+session.getAttribute("currentPage");
	}
	@ResponseBody
	@RequestMapping(value = "loadmore.train", produces = "text/plain;charset=UTF-8")
	public String loadmore(HttpServletRequest request) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<TrainingDTO> list = new ArrayList<>();
		try {
			list = ts.trainingPerPageService(currentPage);
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error.jsp";
		}
		request.setAttribute("list", list);
		Gson g = new Gson();
		String moreList = g.toJson(list);
		System.out.println(moreList);
		return "{\"moreList\":"+moreList+"}";
		
	}
	
}
