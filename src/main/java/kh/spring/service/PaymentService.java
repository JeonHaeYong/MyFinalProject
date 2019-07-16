package kh.spring.service;

import java.util.List;

import kh.spring.dto.ItemDTO;
import kh.spring.dto.ItemDTOList;
import kh.spring.dto.PaymentDTO;

public interface PaymentService {
	public List<ItemDTO> selectItemForPaymentService(String[] items);
	public int paymentComplete(PaymentDTO dto, ItemDTOList list);
}
