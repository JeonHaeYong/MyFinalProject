package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.AnimalHospitalDTO;

public interface AnimalHospitalDAO {
	public List<AnimalHospitalDTO> selectAllAniHospital();
	public List<AnimalHospitalDTO> selectAniHospitalPerPage(int start, int end);
	public int getRecordTotalCount();
	public Map<String, Integer> getNaviForAniHospital(int currentPage);
}
