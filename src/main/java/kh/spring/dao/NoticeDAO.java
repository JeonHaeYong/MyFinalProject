package kh.spring.dao;

import java.util.List;

import kh.spring.dto.NoticeDTO;

public interface NoticeDAO
{
	public int insert(NoticeDTO dto) throws Exception;

	public List<NoticeDTO> selectForPage(int pageStart, int pageEnd) throws Exception;
	public int selectCountAll() throws Exception;
}
