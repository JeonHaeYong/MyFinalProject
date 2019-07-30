package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;
import kh.spring.dto.PaymentDTO;

public interface PaymentDAO {
	public List<ItemDTO> selectItemForPayment(String[] items);
	public int insertPayment(PaymentDTO dto);
	public List<PaymentDTO> selectAllPayment();
	public List<PaymentDTO> selectPaymentById(String id);
	public List<PaymentDTO> selectPaymentByOrderNum(String orderNumber);
	public List<PaymentDTO> selectPaymentPerPageForBuyList(Map<String, String> param);
	public int getPaymentTotalCountById(String id);
	public Map<String, Integer> getNaviForBuyList(int currentPage, int recordTotalCount);
	public int updateWithdrawalBybuyer(String id);//buyer가 탈퇴했을때
	public int updateWithdrawalByseller(String id);//seller가 탈퇴했을때
	public int checkPayDate(String id);
}
