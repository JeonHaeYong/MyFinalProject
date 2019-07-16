package kh.spring.service;

import kh.spring.dto.NoticeDTO;

public interface NoticeService
{
	public String insert(NoticeDTO dto) throws Exception;
	
	public String insertDummy() throws Exception;
	
	public String selectForPage() throws Exception;
}
