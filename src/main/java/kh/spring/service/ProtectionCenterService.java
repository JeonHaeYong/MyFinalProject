package kh.spring.service;

import java.util.List;

import kh.spring.dto.ProtectionCenterDTO;

public interface ProtectionCenterService {
	public List<ProtectionCenterDTO> selectAllCenter();
	public List<ProtectionCenterDTO> selectCenterPerPage(int currentPage);
	public int getRecordTotalCount();
	public String getNaviForCenter(int currentPage);
}
