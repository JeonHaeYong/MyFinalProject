package kh.spring.service;

import java.util.List;


import kh.spring.dto.TrainingDTO;

public interface InfoService {
	public int Infoinsert(TrainingDTO tdto) throws Exception;

	public List<TrainingDTO> selectAll(int currentpage) throws Exception;

	public TrainingDTO detail_info(int seq) throws Exception;

	public int update_info(TrainingDTO dto) throws Exception;

}
