package kh.spring.fin;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.ItemDTO;
import kh.spring.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService is;

	@RequestMapping("freeMarket")
	public String freeMarket(HttpServletRequest request, int currentPage, String category) {
		System.out.println(category);
		if(category.equals("all")) {
			request.setAttribute("itemList", is.selectItemPerPage(currentPage));
		}else {
			request.setAttribute("itemList", is.selectItemPerPageByCategory(currentPage, category));
		}
		request.setAttribute("pageNavi", is.getNaviforItem(currentPage, category));
		request.setAttribute("category", category);
		return "item/freeMarket";
	}

	@RequestMapping("item")
	public String readOneItem(HttpServletRequest request, int seq) {
		request.setAttribute("item", is.readOneItem(seq));
		return "item/item";
	}
	
	@RequestMapping("addItem")
	public String addItem() {
		return "item/addItem";
	}

	@RequestMapping("toMyPage_shopping")
	public String toMyPage_shopping(HttpServletRequest request) {
		request.setAttribute("shopping", true);
		return "myPage/user/user_myPage";
	}
	
	@ResponseBody
	@RequestMapping("imageUpload")
	public String imageUploadLogin(HttpServletRequest request, MultipartFile image) {
		String id = (String)request.getSession().getAttribute("id");
		System.out.println(id);
		String resourcePath = request.getSession().getServletContext().getRealPath("/resources");
		System.out.println(resourcePath);
		long currTime = System.currentTimeMillis();
		String imagePath = "/resources/" + id + "/" + currTime + "_board_image.png";

		try {
			image.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_board_image.png"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return imagePath;
	}
	
	@ResponseBody
	@RequestMapping("deleteImage")
	public String deleteImageLogin(HttpServletRequest request, String imagePath) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(request.getSession().getAttribute("flag"));
		String resourcePath = request.getSession().getServletContext().getRealPath("/");
		//		boolean flag = (boolean)session.getAttribute("flag");
		System.out.println(resourcePath);

		//		if(!flag) {
		if(imagePath.startsWith("http")) {
			imagePath = imagePath.replaceAll("http://.+?/", "");
		}
		String deletePath = resourcePath + imagePath;
		new File(deletePath).delete();
		//		}
		//		session.setAttribute("flag", false);
		return null;
	}
	
	@RequestMapping("addItemProc")
	public String joinProc(HttpServletRequest request, ItemDTO dto, MultipartFile image1, MultipartFile image2, MultipartFile image3) {
		String id = (String)request.getSession().getAttribute("id");
		String resourcePath = request.getSession().getServletContext().getRealPath("/resources");
		System.out.println(resourcePath);
		System.out.println(dto.getImagePath1());
		long currTime = System.currentTimeMillis();
		try {
			image1.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_image1.png"));
			dto.setImagePath1("/resources/" + id + "/" + currTime + "_image1.png");
			image2.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_image2.png"));
			image3.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_image3.png"));
		}catch(Exception e) {
			e.printStackTrace();
		}	
		dto.setImagePath2("/resources/" + id + "/" + currTime + "_image2.png");
		dto.setImagePath3("/resources/" + id + "/" + currTime + "_image3.png");
		is.uploadItem(dto);
		return "redirect:freeMarket?currentPage=1&category=all";
	}
}
