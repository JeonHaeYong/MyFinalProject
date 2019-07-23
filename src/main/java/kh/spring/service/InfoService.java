package kh.spring.service;

import java.util.List;


import kh.spring.dto.InfomaitionDTO;

public interface InfoService {
	public int Infoinsert(InfomaitionDTO tdto) throws Exception;

	public List<InfomaitionDTO> selectAll(int currentpage) throws Exception;

	public InfomaitionDTO detail_info(int seq) throws Exception;

	public int update_info(InfomaitionDTO dto) throws Exception;

	public String getNavi(int currentPage) throws Exception;

	public int boardselcount() throws Exception;

	public int deleteinfo(int seq)throws Exception;

	public List<InfomaitionDTO> selectAll_training(int currentPage) throws Exception;

	public String getNavi_training(int currentPage) throws Exception;

	int boardselcount_training() throws Exception;

}
