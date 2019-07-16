package kh.spring.fin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ItemDTO;
import kh.spring.dto.ItemDTOList;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.PaymentDTO;
import kh.spring.service.MemberService;
import kh.spring.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService ps;
	
	@Autowired
	private MemberService ms;
	
	
	@RequestMapping("toPayment")
	public String toPayment(HttpServletRequest request, String[] items) {
		List<ItemDTO> itemList = ps.selectItemForPaymentService(items);
		int totalAmount = 0;
		for(ItemDTO dto : itemList) {
			totalAmount += Integer.parseInt(dto.getPrice().replaceAll(",", "").replaceAll(" ", ""));
		}
		
		MemberDTO member = ms.selectOneMemberService((String)request.getSession().getAttribute("id"));
		
		
		request.setAttribute("items", itemList);
		request.setAttribute("totalAmount", totalAmount);
		request.setAttribute("member", member);
		return "payment/payment";
	}
	
	@RequestMapping("paymentProc")
	public String paymentProc(HttpServletRequest request, ItemDTOList list, PaymentDTO dto) {
		dto.setBuyer((String)request.getSession().getAttribute("id"));
		ps.paymentComplete(dto, list);
		return "payment/paymentComplete";
	}
}
