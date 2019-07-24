package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<BlackListDTO> selectList(HashMap<String, String> param) throws Exception
	{
		return sst.selectList("BlackListDAO.selectList", param);
	}

	@Override
	public int selectCount() throws Exception
	{
		return sst.selectOne("BlackListDAO.selectCount");
	}
	
}
