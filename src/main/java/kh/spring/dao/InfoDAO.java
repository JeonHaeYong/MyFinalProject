package kh.spring.dao;

import java.util.List;

import kh.spring.dto.TrainingDTO;

public interface InfoDAO {

	public int insertInfo(TrainingDTO dto) throws Exception;
	public List<TrainingDTO> selectall(int end, int start) throws Exception;
	public TrainingDTO detail_info(int seq) throws Exception;
	public int update_info(TrainingDTO dto) throws Exception;

}
