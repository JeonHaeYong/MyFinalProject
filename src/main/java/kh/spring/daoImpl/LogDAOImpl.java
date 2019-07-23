package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;

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
	
	//구매자 Like 검색에 사용
	@Override
	public List<PayLogDTO> selectAllPayLogByLikeBuyer(HashMap<String, String> params) throws Exception
	{
		return sst.selectList("LogDAO.selectAllPayLogByLikeBuyer", params);
	}
	@Override
	public int selectCountPayLogByLikeBuyer(HashMap<String, String> params) throws Exception
	{
		return sst.selectOne("LogDAO.selectCountPayLogByLikeBuyer", params);
	}

	@Override
	public List<PayLogDTO> selectAllPayLogByLikeSeller(HashMap<String, String> params) throws Exception
	{
		return sst.selectList("LogDAO.selectAllPayLogByLikeSeller", params);
	}

	@Override
	public int selectCountPayLogByLikeSeller(HashMap<String, String> params) throws Exception
	{
		return sst.selectOne("LogDAO.selectCountPayLogByLikeSeller", params);
	}

	@Override
	public List<PayLogDTO> selectAllPayLogByBuyer(HashMap<String, String> params) throws Exception
	{
		return sst.selectList("LogDAO.selectAllPayLogByBuyer", params);
	}

	@Override
	public int selectCountPayLogByBuyer(HashMap<String, String> params) throws Exception
	{
		return sst.selectOne("LogDAO.selectCountPayLogByBuyer", params);
	}

	@Override
	public List<PayLogDTO> selectAllPayLogBySeller(HashMap<String, String> params) throws Exception
	{
		return sst.selectList("LogDAO.selectAllPayLogBySeller", params);
	}

	@Override
	public int selectCountPayLogBySeller(HashMap<String, String> params) throws Exception
	{
		return sst.selectOne("LogDAO.selectCountPayLogBySeller", params);
	}

	@Override
	public List<PayLogDTO> selectAllPayLogByDate(HashMap<String, String> params) throws Exception
	{
		return sst.selectList("LogDAO.selectAllPayLogByDate", params);
	}

	@Override
	public int selectCountPayLogByDate(HashMap<String, String> params) throws Exception
	{
		return sst.selectOne("LogDAO.selectCountPayLogByDate", params);
	}
	
}
