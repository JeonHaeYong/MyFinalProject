package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ApiAbandonedAnimalDTO;

public interface ApiAbandonedAnimalDAO {
	public int writeApiAbandonedAnimal(ApiAbandonedAnimalDTO dto);
	public int apiAbandonedAnimalContentsSize();
	public ApiAbandonedAnimalDTO readOneApiAbandonedAnimal(int seq);
	public List<ApiAbandonedAnimalDTO> selectAllApiAbandonedAnimal(int currentPage);
	public int deleteApiAbandonedAnimal(ApiAbandonedAnimalDTO dto);
	public Map<String, Integer> getNaviForApiAbandonedAnimal(int currentPage);
}
