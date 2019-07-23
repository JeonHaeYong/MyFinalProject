package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import kh.spring.dto.PayLogDTO;

public interface LogDAO
{
	public int insertPayLog(PayLogDTO dto) throws Exception;
	
	
	public List<PayLogDTO> selectAllPayLogByLikeBuyer(HashMap<String, String> params) throws Exception;
	public int selectCountPayLogByLikeBuyer(HashMap<String, String> params) throws Exception;
	
	public List<PayLogDTO> selectAllPayLogByLikeSeller(HashMap<String, String> params) throws Exception;
	public int selectCountPayLogByLikeSeller(HashMap<String, String> params) throws Exception;
	
	public List<PayLogDTO> selectAllPayLogByBuyer(HashMap<String, String> params) throws Exception;
	public int selectCountPayLogByBuyer(HashMap<String, String> params) throws Exception;
	
	public List<PayLogDTO> selectAllPayLogBySeller(HashMap<String, String> params) throws Exception;
	public int selectCountPayLogBySeller(HashMap<String, String> params) throws Exception;
	
	public List<PayLogDTO> selectAllPayLogByDate(HashMap<String, String> params) throws Exception;
	public int selectCountPayLogByDate(HashMap<String, String> params) throws Exception;
}
