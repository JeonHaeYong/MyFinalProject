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

import kh.spring.dto.InfomaitionDTO;
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
			String infonavi = service.getNavi(Integer.parseInt(currentPage));
			request.setAttribute("currentPage", currentPage);
			List<InfomaitionDTO> infodto=service.selectAll(Integer.parseInt(currentPage));
			request.setAttribute("infodto", infodto);
			request.setAttribute("infonavi", infonavi);


			String tnavi = service.getNavi_training(Integer.parseInt(currentPage));
			request.setAttribute("currentPage", currentPage);
			List<InfomaitionDTO> tdto=service.selectAll_training(Integer.parseInt(currentPage));
			request.setAttribute("tdto", tdto);
			request.setAttribute("tnavi", tnavi);

			return "sense/information/info_main";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}	

	@RequestMapping("info_main")
	public String infoList_templet(HttpServletRequest request) {
		String currentPage=request.getParameter("currentPage");
		try {	String infonavi = service.getNavi(Integer.parseInt(currentPage));
		request.setAttribute("currentPage", currentPage);
		List<InfomaitionDTO> infodto=service.selectAll(Integer.parseInt(currentPage));
		request.setAttribute("infodto", infodto);
		request.setAttribute("infonavi", infonavi);

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "sense/information/infoList_templet";
	}

	@RequestMapping("train_main")
	public String trainingList_templet(HttpServletRequest request) {
		String currentPage=request.getParameter("currentPage");
		try {	String tnavi = service.getNavi_training(Integer.parseInt(currentPage));
		request.setAttribute("currentPage", currentPage);
		List<InfomaitionDTO> tdto=service.selectAll_training(Integer.parseInt(currentPage));
		request.setAttribute("tdto", tdto);
		request.setAttribute("tnavi", tnavi);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "sense/information/trainingList_templet";
	}








	@RequestMapping("infowrite")
	public String infowrite() {

		return "sense/information/infowrite";
	}

	@RequestMapping("writeformproc")
	public String writeformproc(InfomaitionDTO dto){
		System.out.println(dto.getTitle()+dto.getContents()+dto.getType());
		try {
			dto.setWriter((String)session.getAttribute("id"));	
			//---------스크립트공격------------------
			Pattern p=Pattern.compile("<img src=\"(.+?)\">");
			Matcher m=p.matcher(dto.getContents());

			if(m.find()==true) {			
				dto.setImage(m.group(0));	
				}
			else {
			
				dto.setImage("<img src='resources/images/dog_1.jpg' width='100%' height='100%'>");	}
			int result=service.Infoinsert(dto);
			if(result>0)
			{
				return "redirect:/information_t?currentPage=1";
			}
		} catch (Exception e) {		
			e.printStackTrace();
		}
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


	@RequestMapping("detail_info")
	public String detailinfo(HttpServletRequest request, int seq) {
		try {
			 InfomaitionDTO dto=service.detail_info(seq);
			if(dto.getType().equals("info")) {dto.setType("정보");}
			else {dto.setType("훈련");}
			request.setAttribute("dto",dto);

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
	public String upload(InfomaitionDTO dto)
	{
		System.out.println(dto.getTitle()+dto.getContents());
		try {
			dto.setWriter("관리자");
			Pattern p=Pattern.compile("<img src=\"(.+?)\">");
			Matcher m=p.matcher(dto.getContents());
			if(m.find()==true) {
				dto.setImage(m.group(0));
			}
			else {
				dto.setImage("<img src='resources/images/dog_1.jpg' width='100%' height='100%'>");
			}
			service.update_info(dto);
		} catch (Exception e) {
		
			e.printStackTrace();
		}
			return "redirect:/information_t?currentPage=1";
	}

	@RequestMapping("delinfo")
	public String delinfo(HttpServletRequest request) {
		String[] check = request.getParameterValues("check");
		int[]seq=new int[check.length];
		for(int i=0;i<check.length;)
		{
			seq[i]=Integer.parseInt(check[i]);
			System.out.println(seq[i]);

			try {
				if(service.deleteinfo(seq[i])>0) {
					i++;}
				else {
					i--;
				}
			}catch(Exception e) {e.printStackTrace();}
		}

		return "redirect:/information_t?currentPage=1";
	}



}