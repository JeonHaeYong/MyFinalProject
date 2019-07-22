package kh.spring.service;

import java.util.List;
import java.util.Map;

import org.w3c.dom.Element;

import kh.spring.dto.ApiAbandonedAnimalDTO;

public interface ApiAbandonedAnimalService {

	public int deleteAll();
	public List<ApiAbandonedAnimalDTO> selectByCondition(int currentPage,String from, String to, String species, String speciesKind,
			String sido, String sigungu, String shelter, String processState);
	public ApiAbandonedAnimalDTO selectOneApiAbandonedAnimal(int seq);
	public int apiAbandonedAnimalContentsSize();
	public Map<String, Integer> getNaviforApiAbandonedAnimal(int currentPage);
	public String getTagValue(String tag, Element eElement);
	public List<ApiAbandonedAnimalDTO> selectAll(int currentPage);

}
