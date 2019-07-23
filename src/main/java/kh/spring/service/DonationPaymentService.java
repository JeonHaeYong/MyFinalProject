package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.DonationPaymentDTO;

public interface DonationPaymentService {
	public int insertDonationPaymentService(DonationPaymentDTO dto) throws Exception;
	public List<DonationPaymentDTO> selectDonationPaymentById(String id, int currentPage);
	public int getDonationPaymentTotalCountById(String id);
	public Map<String, Integer> getNaviForDonationPayment(int currentPage, int recordTotalCount);
}
