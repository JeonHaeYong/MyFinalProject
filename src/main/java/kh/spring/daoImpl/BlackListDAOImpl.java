package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.BlackListDAO;
import kh.spring.dto.BlackListDTO;

@Repository
public class BlackListDAOImpl implements BlackListDAO
{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insert(BlackListDTO dto) throws Exception
	{
		return sst.insert("BlackListDAO.insert", dto);
	}

	@Override
	public BlackListDTO selectById(BlackListDTO dto) throws Exception
	{
		return sst.selectOne("BlackListDAO.selectById", dto);
	}

	@Override
	public int selectCountById(BlackListDTO dto) throws Exception
	{
		return sst.selectOne("BlackListDAO.selectCountById", dto);
	}
	
	@Override
	public int deleteById(BlackListDTO dto) throws Exception
	{
		return sst.delete("BlackListDAO.deleteById", dto);
	}
	
}
