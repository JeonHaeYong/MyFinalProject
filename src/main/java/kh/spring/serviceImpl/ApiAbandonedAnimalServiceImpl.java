package kh.spring.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ApiAbandonedAnimalDAO;
import kh.spring.dto.ApiAbandonedAnimalDTO;
import kh.spring.service.ApiAbandonedAnimalService;

@Service
public class ApiAbandonedAnimalServiceImpl implements ApiAbandonedAnimalService{
	@Autowired
	private ApiAbandonedAnimalDAO apiAbdnDao;
	
	public Map<String, Integer> getNaviforApiAbandonedAnimal(int currentPage) throws Exception {
		Map<String, Integer> pageNavi = apiAbdnDao.getNaviForApiAbandonedAnimal(currentPage);
		return pageNavi;
	}

	@Override
	public List<ApiAbandonedAnimalDTO> selectApiAbandonedAnimal(int currentPage) throws Exception {
		List<ApiAbandonedAnimalDTO> dto = apiAbdnDao.selectAllApiAbandonedAnimal(currentPage);
		return dto;
	}

	@Override
	public ApiAbandonedAnimalDTO readOneApiAbandonedAnimal(int seq) throws Exception {
		ApiAbandonedAnimalDTO dto = apiAbdnDao.readOneApiAbandonedAnimal(seq);
		return dto;	
	}

	@Override
	public int ApiAbandonedAnimalContentsSize() throws Exception {
		int result = apiAbdnDao.apiAbandonedAnimalContentsSize();
		return result;
	}
}