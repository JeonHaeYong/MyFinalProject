package kh.spring.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import kh.spring.dto.ApiAbandonedAnimalDTO;

public interface ApiAbandonedAnimalDAO {
	public List<ApiAbandonedAnimalDTO> selectForMain();
	public int insertApi(ApiAbandonedAnimalDTO dto);
	public int apiAbandonedAnimalContentsSize();
	public int apiSizeByCondition(Date dateFrom,
			Date dateTo, String species, String speciesKind, String sido, String sigungu, String shelter, String processState);
	public ApiAbandonedAnimalDTO selectOneApiAbandonedAnimal(int seq);
	public List<ApiAbandonedAnimalDTO> selectAll(int currentPage, int startNum, int endNum, Date dateFrom, Date dateTo,
			String processState);
	public List<ApiAbandonedAnimalDTO> selectByCondition(int currentPage,int startNum, int endNum, 
			Date dateFrom, Date dateTo, String species, String speciesKind, String sido, String sigungu, String shelter, String processState);
	public int deleteAll();
	public int dropSeq();
	public int createSeq();
	public Map<String, Integer> getNaviTotal(int currentPage);
	public Map<String, Integer> getNaviCondition(int currentPage,Date dateFrom,
			Date dateTo, String species, String speciesKind, String sido, String sigungu, String shelter, String processState);
}
