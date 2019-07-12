package kh.spring.dao;

import kh.spring.dto.BlackListDTO;

public interface BlackListDAO
{
	public int insert(BlackListDTO dto) throws Exception;
	public BlackListDTO selectById(BlackListDTO dto) throws Exception;
	public int selectCountById(BlackListDTO dto) throws Exception;
	public int deleteById(BlackListDTO dto) throws Exception;
}
