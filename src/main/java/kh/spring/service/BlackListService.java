package kh.spring.service;

import kh.spring.dto.BlackListDTO;

public interface BlackListService
{
	public void insert(BlackListDTO dto) throws Exception;
	public Object delete() throws Exception;
}
