package kh.spring.dao;

import java.util.List;

import kh.spring.dto.ItemDTO;

public interface PaymentDAO {
	public List<ItemDTO> selectItemForPayment(String[] items);
}
