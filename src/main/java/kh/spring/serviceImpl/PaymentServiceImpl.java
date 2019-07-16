package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CartDAO;
import kh.spring.dao.MessageDAO;
import kh.spring.dao.PaymentDAO;
import kh.spring.dto.ItemDTO;
import kh.spring.dto.PaymentDTO;
import kh.spring.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO pdao;
	
	@Autowired
	private CartDAO cdao;
	
	@Autowired
	private MessageDAO mdao;
	
	public List<ItemDTO> selectItemForPaymentService(String[] items) {
		return pdao.selectItemForPayment(items);
	}
	
	public int paymentComplete(PaymentDTO dto) {
		pdao.insertPayment(dto);
		cdao.deleteCart(dto.getItem_seq(), dto.getSeller());
		return 0;
	}
}
