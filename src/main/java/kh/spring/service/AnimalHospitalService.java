package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.insertDataldto.GyeonggiDTO;
import kh.spring.insertDataldto.SeoulDTO;
import kh.spring.insertDataldto.UlsanDTO;

public interface AnimalHospitalService {
	public List<AnimalHospitalDTO> selectAniHospitalPerPageService(int currentPage);
	public String getNaviForAniHospitalService(int currentPage,String option);
	public List<AnimalHospitalDTO> searchAniHospitalPerPageService(int currentPage, String option);
	public void seoulHospitalService(SeoulDTO sdto);
	public void gyeonggiHospitalService(GyeonggiDTO gdto);
	public void ulsanHospitalService(UlsanDTO udto);
}
