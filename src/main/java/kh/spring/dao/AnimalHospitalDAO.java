package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.AnimalHospitalDTO;

public interface AnimalHospitalDAO {
	public List<AnimalHospitalDTO> selectAllAniHospital();
	public List<AnimalHospitalDTO> selectAniHospitalPerPage(int currentPage);
	public int getRecordTotalCount();
	public int searchRecordTotalCount(String option);
	public List<AnimalHospitalDTO> searchAniHospitalPerPage(int currentPage, String option);
	public String getNaviForAniHospital(int currentPage, String option);
}
