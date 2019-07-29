package kh.spring.service;

import java.util.List;

import kh.spring.dto.ProtectionCenterDTO;
import kh.spring.insertDataldto.CenterDTO;

public interface ProtectionCenterService {
	public List<ProtectionCenterDTO> selectAllCenterService();
	public List<ProtectionCenterDTO> selectCenterPerPageService(int currentPage);
	public int getRecordTotalCountService();
	public String getNaviForCenterService(int currentPage,String option);
	public List<ProtectionCenterDTO> searchCenterPerPageService(int currentPage, String option);
	public void insertDataService(CenterDTO cdto);
	public void deleteCenterData();
}
