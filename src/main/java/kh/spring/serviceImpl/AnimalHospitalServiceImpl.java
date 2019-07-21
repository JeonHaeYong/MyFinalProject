package kh.spring.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AnimalHospitalDAO;
import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.service.AnimalHospitalService;

@Service
public class AnimalHospitalServiceImpl implements AnimalHospitalService{
	@Autowired
	AnimalHospitalDAO adao;
	
	@Override
	public List<AnimalHospitalDTO> selectAniHospitalPerPageService(int currentPage) {
		List<AnimalHospitalDTO> list = new ArrayList<>();
		list = adao.selectAniHospitalPerPage(currentPage);
		return list;
	}

	@Override
	public String getNaviForAniHospitalService(int currentPage, String option) {
		String navi = adao.getNaviForAniHospital(currentPage,option);
		return navi;
	}
	@Override
	public List<AnimalHospitalDTO> searchAniHospitalPerPageService(int currentPage, String option){
		List<AnimalHospitalDTO> list = new ArrayList<>();
		list = adao.searchAniHospitalPerPage(currentPage, option);
		return list;
	}
}
