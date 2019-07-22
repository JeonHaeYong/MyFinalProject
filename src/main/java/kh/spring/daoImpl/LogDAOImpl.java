package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.LogDAO;
import kh.spring.dto.PayLogDTO;

@Repository
public class LogDAOImpl implements LogDAO
{
	
	@Autowired
	SqlSessionTemplate sst;
	
	@Override
	public int insertPayLog(PayLogDTO dto) throws Exception
	{
		return sst.insert("LogDAO.insertPayLog", dto);
	}
	
}
