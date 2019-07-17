package kh.spring.fin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String informaition_t() {		
		return "sense/information/information";
	}

	@RequestMapping("infowrite")
	public String infowrite() {

		return "sense/information/infowrite";
	}

	@RequestMapping("writeformproc")
	public String writeformproc(TrainingDTO dto){
		System.out.println(dto.getTitle()+dto.getContents());
		String uploadpath=session.getServletContext().getRealPath("/resources");
		System.out.println("위치"+uploadpath);
		
		try {
			String filename="/board/"+dto.getWriter()+"/"+System.currentTimeMillis()+"_write.png";
			if(fdto.getImage().getSize()==0) {
				fdto.setImgpath("null");
			}else {
				fdto.getImage().transferTo(new File(uploadpath+filename));

				fdto.setImgpath(filename);

			}
			
			dto.setIp(request.getRemoteAddr());
			dto.setWriter("관리자");
			int result =service.Infoinsert(dto,fdto);
		System.out.println(result);
		
		} catch (Exception e) {
			
		}

		return "redirect:/information_t";

	}
}
