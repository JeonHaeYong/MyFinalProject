package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ApiAbandonedAnimalDTO;

public interface ApiAbandonedAnimalService {
	public List<ApiAbandonedAnimalDTO> selectApiAbandonedAnimal(int currentPage) throws Exception;
	public ApiAbandonedAnimalDTO readOneApiAbandonedAnimal(int seq) throws Exception;
	public int ApiAbandonedAnimalContentsSize() throws Exception;
	public Map<String, Integer> getNaviforApiAbandonedAnimal(int currentPage) throws Exception;
}
