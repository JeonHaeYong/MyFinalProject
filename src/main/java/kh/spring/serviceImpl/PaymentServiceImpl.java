package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.PaymentDAO;
import kh.spring.dto.ItemDTO;
import kh.spring.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO pdao;
	
	public List<ItemDTO> selectItemForPaymentService(String itemStr) {
		return pdao.selectItemForPayment(itemStr);
	}
}
