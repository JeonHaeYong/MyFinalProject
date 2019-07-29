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
	public int updateWithdrawalDonator(String id) {
		return sst.update("DonationPaymentDAO.updateWithdrawalDonator", id);
	}
	
	@Override
	public List<DonationPaymentDTO> selectDonationPaymentById(Map<String, String> param) {
		return sst.selectList("DonationPaymentDAO.selectDonationPaymentById", param);
	}
	
	@Override
	public int getDonationPaymentTotalCountById(String id) {
		return sst.selectOne("DonationPaymentDAO.getDonationPaymentTotalCountById", id);
	}

	@Override
	public List<DonationPaymentDTO> selectDonatedListByGroup(Map<String, Integer> param) throws Exception
	{
		return sst.selectList("DonationPaymentDAO.selectList", param);
	}
	
	@Override
	public List<DonationPaymentDTO> selectDonatedListAll(Map<String, String> param) throws Exception
	{
		return sst.selectList("DonationPaymentDAO.selectAll", param);
	}
	
	@Override
	public int selectCountForList() throws Exception
	{
		return sst.selectOne("DonationPaymentDAO.selectCountForList");
	}

	@Override
	public int selectCountAll(Map<String, String> param) throws Exception
	{
		return sst.selectOne("DonationPaymentDAO.selectCountAll",param);
	}

	
}
