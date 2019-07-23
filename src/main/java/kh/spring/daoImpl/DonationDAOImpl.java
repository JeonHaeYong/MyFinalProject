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
	public int selectCount() throws Exception
	{
		return sst.selectOne("DonationDAO.selectCount");
	}
	
}
