package kh.spring.fin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ItemDTO;
import kh.spring.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService ps;
	
	@RequestMapping("toPayment")
	public String toPayment(HttpServletRequest request, String[] items) {
		List<ItemDTO> itemList = ps.selectItemForPaymentService(items);
		int totalAmount = 0;
		for(ItemDTO dto : itemList) {
			totalAmount += Integer.parseInt(dto.getPrice().replaceAll(",", "").replaceAll(" ", ""));
		}
		request.setAttribute("items", itemList);
		request.setAttribute("totalAmount", totalAmount);
		return "payment/payment";
	}
}
