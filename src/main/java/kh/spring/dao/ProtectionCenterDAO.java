package kh.spring.dao;

import java.util.List;

import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.dto.ProtectionCenterDTO;

public interface ProtectionCenterDAO {
	public List<ProtectionCenterDTO> selectAllCenter();
	public List<ProtectionCenterDTO> selectCenterPerPage(int currentPage);
	public int getRecordTotalCount();
	public String getNaviForCenter(int currentPage, String option);
	public int searchRecordTotalCount(String option);
	public List<ProtectionCenterDTO> searchCenterPerPage(int currentPage, String option);
	
	
}
