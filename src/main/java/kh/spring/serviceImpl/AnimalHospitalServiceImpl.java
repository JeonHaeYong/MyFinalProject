package kh.spring.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.AnimalHospitalDAO;
import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.insertDataldto.GyeonggiDTO;
import kh.spring.insertDataldto.SeoulDTO;
import kh.spring.insertDataldto.UlsanDTO;
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
	
	@Override
	public void seoulHospitalService(SeoulDTO sdto) {//서울병원 데이터 삽입
		adao.seoulHospitalData(sdto);
	}
	@Override
	public void gyeonggiHospitalService(GyeonggiDTO gdto) {//경기병원 데이터 삽입
		adao.gyeonggiHospitalData(gdto);
	}
	@Override
	public void ulsanHospitalService(UlsanDTO udto) {//울산병원 데이터 삽입
		adao.ulsanHospitalData(udto);
	}
	@Override
	public void deleteHospitalData(String area) {
		adao.deleteHospitalData(area);
	}
	
}
