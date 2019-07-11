package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ApiAbandonedAnimalDTO;

public interface ApiAbandonedAnimalService {
	public List<ApiAbandonedAnimalDTO> selectApiAbandonedAnimal(int currentPage);
	public ApiAbandonedAnimalDTO readOneApiAbandonedAnimal(int seq);
	public int apiAbandonedAnimalContentsSize();
	public Map<String, Integer> getNaviforApiAbandonedAnimal(int currentPage);
}
