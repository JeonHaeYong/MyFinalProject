package kh.spring.dao;

import java.util.List;

import kh.spring.dto.InfomaitionDTO;

public interface InfoDAO {

	public int insertInfo(InfomaitionDTO dto) throws Exception;
	public List<InfomaitionDTO> selectall(int end, int start) throws Exception;
	public InfomaitionDTO detail_info(int seq) throws Exception;
	public int update_info(InfomaitionDTO dto) throws Exception;
	public int boardselCount() throws Exception;
	public int deleteinfo(int seq) throws Exception;
	public List<InfomaitionDTO> selectalltraining(int start, int end)throws Exception;
	int boardselCount_training() throws Exception;

}
