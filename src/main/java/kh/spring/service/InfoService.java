package kh.spring.service;

import java.util.List;


import kh.spring.dto.TrainingDTO;

public interface InfoService {
	int Infoinsert(TrainingDTO tdto) throws Exception;

	List<TrainingDTO> selectAll(int currentpage) throws Exception;

}
