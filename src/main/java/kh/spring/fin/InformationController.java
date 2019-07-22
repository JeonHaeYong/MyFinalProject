package kh.spring.fin;

import java.io.File;
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

import kh.spring.dto.TrainingDTO;
import kh.spring.service.InfoService;

@Controller
public class InformationController {
	@Autowired
	InfoService service;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	@RequestMapping("information_t")
	public String informaition_t(String currentPage) {
		try {
			session.setAttribute("currentPage", currentPage);
			List<TrainingDTO> tdto=service.selectAll(Integer.parseInt(currentPage));
			request.setAttribute("infodto", tdto);
			return "sense/information/information";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
			
		}
		
		
	}

	@RequestMapping("infowrite")
	public String infowrite() {

		return "sense/information/infowrite";
	}

	@RequestMapping("writeformproc")
	public String writeformproc(TrainingDTO tdto){
		System.out.println(tdto.getTitle()+tdto.getContents());
		try {
			tdto.setWriter("관리자");
			tdto.setIp(request.getRemoteAddr());
		
			Pattern p=Pattern.compile("<img src=\"(.+?)\">");
			Matcher m=p.matcher(tdto.getContents());
			if(m.find()==true) {
			tdto.setImage(m.group(0));
			}
			else {
				tdto.setImage("null");
			}
			int result=service.Infoinsert(tdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(tdto);
	
		return "redirect:/information_t?currentPage=1";

	}
	@ResponseBody
	@RequestMapping("fileajax")
	public String imageUploadLogin(HttpServletRequest request, MultipartFile files) {
		/*String id = (String)request.getSession().getAttribute("id");*/
		/*System.out.println(id);*/
		String resource= request.getSession().getServletContext().getRealPath("/resources");
		System.out.println(resource);
		File file = new File(resource + "/info_board/" + "admin");
		if(!(file.exists()))
		{
			file.mkdirs();
		}
		
		long currTime = System.currentTimeMillis();
		String imagePath =  "info_board/" +  "admin" + "/" + currTime + ".png";

		try {
			files.transferTo(new File(resource + "/info_board/" + "admin" + "/" + currTime + ".png"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return imagePath;
	}
	
	//detail
	@RequestMapping("detail")
	public String detailinfo(HttpServletRequest request, int seq) {
		try {
			request.setAttribute("dto", service.detail_info(seq));
			
			return "sense/information/detail_info";
		} catch (Exception e) {
			e.printStackTrace();
		}
	return "error";
	}
@RequestMapping("updatewrite")
public String updatewrite(HttpServletRequest request,int seq) {
	
	try {
		request.setAttribute("dto", service.detail_info(seq));
	} catch (Exception e) {
		
		e.printStackTrace();
	}
return "sense/information/update";}

@RequestMapping("uploadformproc")
public String upload(TrainingDTO tdto)
{
	System.out.println(tdto.getTitle()+tdto.getContents());
	try {
		tdto.setWriter("관리자");
		tdto.setIp(request.getRemoteAddr());
	
		Pattern p=Pattern.compile("<img src=\"(.+?)\">");
		Matcher m=p.matcher(tdto.getContents());
		if(m.find()==true) {
		tdto.setImage(m.group(0));
		}
		else {
			tdto.setImage("null");
		}
		int result=service.update_info(tdto);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println(tdto);

	return "redirect:/information_t?currentPage=1";
	}
	
	
}