package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.AnimalHospitalDTO;

public interface AnimalHospitalService {
	public List<AnimalHospitalDTO> selectAniHospitalPerPageService(int currentPage);
	public String getNaviForAniHospitalService(int currentPage,String option);
	public List<AnimalHospitalDTO> searchAniHospitalPerPageService(int currentPage, String option);
}
