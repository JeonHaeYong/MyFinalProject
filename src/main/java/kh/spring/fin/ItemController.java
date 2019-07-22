package kh.spring.fin;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.ItemDTO;
import kh.spring.service.CartService;
import kh.spring.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService is;
	
	@Autowired
	private CartService cs;

	@RequestMapping("freeMarket")
	public String freeMarket(HttpServletRequest request, String currentPage, String category) {
		if(currentPage == null) {
			currentPage = "1";
		}
		if(category == null || category.equals("all")) {
			category = "all";
			request.setAttribute("itemList", is.selectItemPerPage(Integer.parseInt(currentPage)));
		}else {
			request.setAttribute("itemList", is.selectItemPerPageByCategory(Integer.parseInt(currentPage), category));
		}
		request.setAttribute("pageNavi", is.getNaviforItem(Integer.parseInt(currentPage), category));
		request.setAttribute("category", category);
		
		String id = (String)request.getSession().getAttribute("id");
		if(!id.isEmpty()) {
			request.setAttribute("cartCount", cs.getCartCount(id));
		}
		return "item/freeMarket";
	}

	@RequestMapping("item")
	public String readOneItem(HttpServletRequest request, String currentPage, String category, int seq) {
		if(currentPage == null) {
			currentPage = "1";
		}
		if(category == null) {
			category = "all";
		}
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("category", category);
		request.setAttribute("item", is.readOneItem(seq));
		return "item/item";
	}

	@RequestMapping("addItem")
	public String addItem() {
		return "item/addItem";
	}

	@ResponseBody
	@RequestMapping("imageUpload")
	public String imageUploadLogin(HttpServletRequest request, MultipartFile image) {
		String id = (String)request.getSession().getAttribute("id");
		System.out.println(id);
		String resourcePath = request.getSession().getServletContext().getRealPath("/resources");
		
		File folder = new File(resourcePath + "/" + id);
		
		System.out.println(folder);
		System.out.println(folder.exists());
		
		if(!(folder.exists()))
		{
			System.out.println(folder.mkdirs());
		}
		
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

	/**
	 * 섬머노트에디터에서 이미지 삭제시 실행되는 메서드
	 * @param request
	 * @param imagePath
	 * @return null
	 */
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

	/**
	 * 나눔 신청시 실행되는 메서드
	 * @param request
	 * @param dto : ItemDTO
	 * @param image1 : 첫번째 첨부 이미지 (필수)
	 * @param image2
	 * @param image3
	 * @return 무료나눔 페이지로 이동
	 */
	@RequestMapping("/addItemProc")
	public String joinProc(HttpServletRequest request, ItemDTO dto, MultipartFile image1, MultipartFile image2, MultipartFile image3) {
		String id = (String)request.getSession().getAttribute("id");
		String resourcePath = request.getSession().getServletContext().getRealPath("/resources");
		System.out.println(resourcePath);
		long currTime = System.currentTimeMillis();
		try {
			// 첫번째 이미지 있을 때 저장! 없으면 무료나눔 페이지로 바로 이동.
			if(!image1.isEmpty()) {
				image1.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_image1.png"));
				dto.setImagePath1("/resources/" + id + "/" + currTime + "_image1.png");
			}else {
				return "redirect:freeMarket?currentPage=1&category=all";
			}
			
			// 두번째, 세번째 이미지 있을 때 저장!
			if(!image2.isEmpty()) {
				image2.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_image2.png"));
				dto.setImagePath2("/resources/" + id + "/" + currTime + "_image2.png");
			}
			if(!image3.isEmpty()) {
				image3.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_image3.png"));
				dto.setImagePath3("/resources/" + id + "/" + currTime + "_image3.png");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		dto.setName(dto.getName().replaceAll("<.?script>", ""));
		dto.setCategory(dto.getCategory().replaceAll("<.?script>", ""));
		dto.setContents(dto.getContents().replaceAll("<.?script>", ""));
		dto.setSeller(id);
		is.uploadItem(dto);
		return "redirect:freeMarket?currentPage=1&category=all";
	}
	
}
