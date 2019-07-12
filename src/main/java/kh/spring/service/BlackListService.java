package kh.spring.service;

import kh.spring.dto.BlackListDTO;

public interface BlackListService
{
	public void insert(BlackListDTO dto) throws Exception;
	public BlackListDTO selectById(BlackListDTO dto) throws Exception;
	public void delete(BlackListDTO dto) throws Exception;
}
