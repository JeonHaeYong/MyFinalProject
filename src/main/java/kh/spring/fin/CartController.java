package kh.spring.fin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.CartDTO;
import kh.spring.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cs;
	
	@ResponseBody
	@RequestMapping("addCart")
	public String addCart(HttpServletRequest request, int item_seq) {
		CartDTO dto = new CartDTO();
		dto.setId((String)request.getSession().getAttribute("id"));
		dto.setItem_seq(item_seq);
		
		return cs.insertCartService(dto)+"";
	}
	
	@RequestMapping("toMyPage_cart")
	public String toMyPage_cart(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		request.setAttribute("list", cs.selectCartPerPage(id));
		return "myPage/user/user_myPage_cart";
	}
	
	@ResponseBody
	@RequestMapping("deleteCart")
	public String deleteCart(HttpServletRequest request, String[] seqs) {
		for(int i = 0; i < seqs.length; i++) {
			System.out.println(seqs[i]);
		}
		cs.deleteCartService(seqs);
		return null;
	}
}
