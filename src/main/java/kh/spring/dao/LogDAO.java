package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import kh.spring.dto.PayLogDTO;

public interface LogDAO
{
	public int insertPayLog(PayLogDTO dto) throws Exception;
	
	public List<PayLogDTO> selectAllPayLogByLikeBuyer(HashMap<String, String> params) throws Exception;
	public int selectCountPayLogByLikeBuyer(HashMap<String, String> params) throws Exception;
}
