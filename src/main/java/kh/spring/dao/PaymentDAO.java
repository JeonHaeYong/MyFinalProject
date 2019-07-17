package kh.spring.dao;

import java.util.List;

import kh.spring.dto.ItemDTO;
import kh.spring.dto.PaymentDTO;

public interface PaymentDAO {
	public List<ItemDTO> selectItemForPayment(String[] items);
	public int insertPayment(PaymentDTO dto);
	public List<PaymentDTO> selectAllPayment();
	public List<PaymentDTO> selectPaymentById(String id);
	public List<PaymentDTO> selectPaymentByOrderNum(String orderNumber);
}
