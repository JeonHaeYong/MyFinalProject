package kh.spring.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ProtectionCenterDAO;
import kh.spring.dto.ProtectionCenterDTO;
import kh.spring.service.ProtectionCenterService;

@Service
public class ProtectionCenterServiceimpl implements ProtectionCenterService{
	@Autowired
	private ProtectionCenterDAO pdao;

	@Override
	public List<ProtectionCenterDTO> selectAllCenterService() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<ProtectionCenterDTO> selectCenterPerPageService(int currentPage) {
		List<ProtectionCenterDTO> list = new ArrayList<>();
		list = pdao.selectCenterPerPage(currentPage);
		return list;
	}
	@Override
	public int getRecordTotalCountService() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public String getNaviForCenterService(int currentPage, String option) {
		String navi = pdao.getNaviForCenter(currentPage, option);
		return navi;
	}
	@Override
	public List<ProtectionCenterDTO> searchCenterPerPageService(int currentPage, String option){
		List<ProtectionCenterDTO> list = new ArrayList<>();
		return list = pdao.searchCenterPerPage(currentPage, option);
	}
	

}
