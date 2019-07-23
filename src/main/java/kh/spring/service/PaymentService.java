package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;
import kh.spring.dto.ItemDTOList;
import kh.spring.dto.PaymentDTO;

public interface PaymentService {
	public List<ItemDTO> selectItemForPaymentService(String[] items);
	public List<ItemDTO> paymentComplete(PaymentDTO dto, ItemDTOList list) throws Exception;
	public List<ItemDTO> selectItemByOrderNum(String orderNumber);
	public List<PaymentDTO> selectPaymentPerPageForBuyList(String id, int currentPage);
	public Map<String, Integer> getNaviForBuyList(String id, int currentPage);
}
