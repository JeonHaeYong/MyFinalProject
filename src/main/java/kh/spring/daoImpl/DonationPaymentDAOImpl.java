package kh.spring.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.DonationPaymentDAO;
import kh.spring.dto.DonationPaymentDTO;

@Repository
public class DonationPaymentDAOImpl implements DonationPaymentDAO {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertDonationPayment(DonationPaymentDTO dto) {
		System.out.println("DonationPaymentDAOImpl실행!!");
		System.out.println(dto.getDonator() + " " + dto.getDonator_name() + " " + dto.getDonation() + " " + dto.getDonation_name());
		return sst.insert("DonationPaymentDAO.insertDonationPayment", dto);
	}
	
	@Override
	public List<DonationPaymentDTO> selectDonationPaymentById(Map<String, String> param) {
		return sst.selectList("DonationPaymentDAO.selectDonationPaymentById", param);
	}
	
	@Override
	public int getDonationPaymentTotalCountById(String id) {
		return sst.selectOne("DonationPaymentDAO.getDonationPaymentTotalCountById", id);
	}
	
}
