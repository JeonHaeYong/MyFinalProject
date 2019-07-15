package kh.spring.fin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService ps;
	
	@RequestMapping("toPayment")
	public String toPayment(HttpServletRequest request, String[] items) {
//		String itemStr = items[0] + "', ";
//		for(int i = 1; i < items.length; i++) {
//			if(i == items.length-1) {
//				itemStr += "'" + items[i];
//				break;
//			}
//			itemStr += "'" + items[i] + "', ";
//		}
		String itemStr = "";
		for(int i = 0; i < items.length; i++) {
			if(i == items.length-1) {
				itemStr += items[i];
				break;
			}
			itemStr += items[i] + ", ";
		}
		
		System.out.println(itemStr);
		request.setAttribute("items", ps.selectItemForPaymentService(itemStr));
		return "payment/payment";
	}
}
