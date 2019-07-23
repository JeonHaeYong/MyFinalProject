package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.DonationDAO;
import kh.spring.dto.DonationDTO;

@Repository
public class DonationDAOImpl implements DonationDAO
{
	
	@Autowired
	SqlSessionTemplate sst;
	
	@Override
	public int insert(DonationDTO dto) throws Exception
	{
		return sst.insert("DonationDAO.insert", dto);
	}

	@Override
	public DonationDTO selectRecentDTO() throws Exception
	{
		return sst.selectOne("DonationDAO.selectRecentDTO");
	}
	
	@Override
	public int delete() throws Exception
	{
		return sst.delete("DonationDAO.delete");
	}

	@Override
	public DonationDTO selectDTOByRowNumber(String page) throws Exception
	{
		return sst.selectOne("DonationDAO.selectDTOByRowNumber", page);
	}
	
	@Override
	public DonationDTO selectBySeq(DonationDTO dto) throws Exception
	{
		return sst.selectOne("DonationDAO.selectBySeq", dto);
	}
	
	@Override
	public int selectCount() throws Exception
	{
		return sst.selectOne("DonationDAO.selectCount");
	}
	
	@Override
	public int updateCurrentMoney(int currentMoney) {
		return sst.update("DonationDAO.updateCurrentMoney", currentMoney);
	}

	@Override
	public int updateNameBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateNameBySeq",dto);
	}

	@Override
	public int updateTitleBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateTitleBySeq",dto);
	}

	@Override
	public int updateExplanationBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateExplanationBySeq",dto);
	}

	@Override
	public int updateGoalmoneyBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateGoalmoneyBySeq",dto);
	}

	@Override
	public int updateStartdateBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateStartdateBySeq",dto);
	}

	@Override
	public int updateEnddateBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateEnddateBySeq",dto);
	}

	@Override
	public int updateImage1BySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateImage1BySeq",dto);
	}

	@Override
	public int updateImage2BySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateImage2BySeq",dto);
	}

	@Override
	public int updateImage3BySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateImage3BySeq",dto);
	}

	@Override
	public int updateLeftBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateLeftBySeq",dto);
	}

	@Override
	public int updateRightBySeq(DonationDTO dto) throws Exception
	{
		return sst.update("DonationDAO.updateRightBySeq",dto);
	}

	
}
