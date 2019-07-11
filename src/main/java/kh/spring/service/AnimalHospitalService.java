package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.AnimalHospitalDTO;

public interface AnimalHospitalService {
	public List<AnimalHospitalDTO> selectAniHospitalPerPage(int currentPage);
	public String getNaviForAniHospital(int currentPage,String option);
	public List<AnimalHospitalDTO> searchAniHospitalPerPage(int currentPage, String option);
}
