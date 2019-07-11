package kh.spring.fin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
