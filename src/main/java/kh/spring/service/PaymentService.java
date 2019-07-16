package kh.spring.service;

import java.util.List;

import kh.spring.dto.ItemDTO;

public interface PaymentService {
	public List<ItemDTO> selectItemForPaymentService(String[] items);
}
