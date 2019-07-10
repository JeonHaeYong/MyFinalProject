package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.AnimalHospitalDTO;

public interface AnimalHospitalService {
	public List<AnimalHospitalDTO> selectAniHospitalPerPage(int currentPage);
	public String getNaviForAniHospital(int currentPage);
	
}
