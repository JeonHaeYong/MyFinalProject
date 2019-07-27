package kh.spring.dao;

import java.util.List;

import kh.spring.dto.ProtectionCenterDTO;
import kh.spring.insertDataldto.CenterDTO;

public interface ProtectionCenterDAO {
	public List<ProtectionCenterDTO> selectAllCenter();
	public List<ProtectionCenterDTO> selectCenterPerPage(int currentPage);
	public int getRecordTotalCount();
	public String getNaviForCenter(int currentPage, String option);
	public int searchRecordTotalCount(String option);
	public List<ProtectionCenterDTO> searchCenterPerPage(int currentPage, String option);
	public int insertData(CenterDTO cdto);
	public int deleteCenterData();
	
	
}
