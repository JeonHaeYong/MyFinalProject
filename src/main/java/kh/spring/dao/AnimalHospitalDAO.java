package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.insertDataldto.GyeonggiDTO;
import kh.spring.insertDataldto.SeoulDTO;
import kh.spring.insertDataldto.UlsanDTO;

public interface AnimalHospitalDAO {
	public List<AnimalHospitalDTO> selectAllAniHospital();
	public List<AnimalHospitalDTO> selectAniHospitalPerPage(int currentPage);
	public int getRecordTotalCount();
	public int searchRecordTotalCount(String option);
	public List<AnimalHospitalDTO> searchAniHospitalPerPage(int currentPage, String option);
	public String getNaviForAniHospital(int currentPage, String option);
	public int gyeonggiHospitalData(GyeonggiDTO gdto);
	public int seoulHospitalData(SeoulDTO sdto);
	public int ulsanHospitalData(UlsanDTO udto);
}
