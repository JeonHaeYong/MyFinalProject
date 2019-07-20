package kh.spring.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import kh.spring.dto.ApiAbandonedAnimalDTO;

public interface ApiAbandonedAnimalDAO {
	public int insertApi(ApiAbandonedAnimalDTO dto);
	public int apiAbandonedAnimalContentsSize();
	public ApiAbandonedAnimalDTO readOneApiAbandonedAnimal(int seq);
	public List<ApiAbandonedAnimalDTO> selectAllApiAbandonedAnimal(int currentPage,Date dateFrom, Date dateTo, String species, String speciesKind, String sido, String sigungu, String shelter);
	public int deleteAll();
	public Map<String, Integer> getNaviForApiAbandonedAnimal(int currentPage);
}
