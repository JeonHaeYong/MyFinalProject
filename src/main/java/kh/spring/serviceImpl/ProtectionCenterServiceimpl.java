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
	public List<ProtectionCenterDTO> selectAllCenter() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProtectionCenterDTO> selectCenterPerPage(int currentPage) {
		List<ProtectionCenterDTO> list = new ArrayList<>();
		list = pdao.selectCenterPerPage(currentPage);
		return list;
	}

	@Override
	public int getRecordTotalCount() {
		
		return 0;
	}

	@Override
	public String getNaviForCenter(int currentPage) {
		String navi = pdao.getNaviForCenter(currentPage);
		return navi;
	}

}
