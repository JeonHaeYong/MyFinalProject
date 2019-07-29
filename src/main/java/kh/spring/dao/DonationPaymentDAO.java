package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.DonationPaymentDTO;

public interface DonationPaymentDAO {
	public int insertDonationPayment(DonationPaymentDTO dto);
	public List<DonationPaymentDTO> selectDonationPaymentById(Map<String, String> param);
	public int getDonationPaymentTotalCountById(String id);
	
	public List<DonationPaymentDTO> selectDonatedListByGroup(Map<String, Integer> param) throws Exception;
	public List<DonationPaymentDTO> selectDonatedListAll(Map<String, Integer> param) throws Exception;
	public int selectCountForList() throws Exception;
}
