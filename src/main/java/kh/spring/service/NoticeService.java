package kh.spring.service;

import kh.spring.dto.NoticeDTO;

public interface NoticeService
{
	public String insert(NoticeDTO dto) throws Exception;
	
	public String insertDummy() throws Exception;
	
	public String selectForPage(String page) throws Exception;
	
	public Object NoticeDetailPage(NoticeDTO dto) throws Exception;
	
}
