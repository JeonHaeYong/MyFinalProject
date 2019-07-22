package kh.spring.dao;

import kh.spring.dto.PayLogDTO;

public interface LogDAO
{
	public int insertPayLog(PayLogDTO dto) throws Exception;
}
