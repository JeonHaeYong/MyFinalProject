package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.AnimalHospitalDAO;
import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.insertDataldto.GyeonggiDTO;
import kh.spring.insertDataldto.SeoulDTO;
import kh.spring.insertDataldto.UlsanDTO;

@Repository
public class AnimalHospitalDAOImpl implements AnimalHospitalDAO {

	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 10;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 10;

	@Autowired
	private SqlSessionTemplate sst;

	public List<AnimalHospitalDTO> selectAllAniHospital(){
		return sst.selectList("AnimalHospitalDAO.selectAllAniHospital");
	}
	
	public List<AnimalHospitalDTO> selectAniHospitalPerPage(int currentPage){//리스트 10개씩 
		Map<String, Integer> param = new HashMap<>();
		int end = currentPage * recordCountPerPage;
		int start = end - 9; 
		
		param.put("start", start);
		param.put("end", end);
		return sst.selectList("AnimalHospitalDAO.selectAniHospitalPerPage", param);
	}
	public int getRecordTotalCount() { // 병원 전체개수
		return sst.selectOne("AnimalHospitalDAO.getRecordTotalCount");
	}
	@Override
	public String getNaviForAniHospital(int currentPage, String option){//페이지 네비게이션
		int recordTotalCount = 0;
		if(option == null) {//검색어 없으면
			recordTotalCount = this.getRecordTotalCount();
		}else {
			recordTotalCount = this.searchRecordTotalCount(option);
			
		}
		
		 
		// 가지고 있는 게시글의 수에 맞는 페이지의 개수를 구함.
		int pageTotalCount = recordTotalCount / recordCountPerPage;//전체페이지수 
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else if(recordTotalCount % recordCountPerPage == 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		// 현재 페이지 오류 검출 및 정정
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		// 네비게이터 시작과 끝
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		// 네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;	// 1이면 true, -1이면 false
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		if(option == null){
			if(needPrev) {
				sb.append("<a class='prev' href='toHospital?currentPage=" + (startNavi - 1) + "'> ◀  </a>");
				//sb.append("<input type='button' value='◀' onClick='location.href='location.href="+ (startNavi - 1) +"'>");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a class='pageNum' href='toHospital?currentPage=" + i + "'> " + i + "</a>");
				//sb.append("<input type='button' value='"+i+"' onClick='location.href=toHospital?currentPage="+i+"' class='pageNum'>");
				
			}
			if(needNext) {
				sb.append("<a class='next' href='toHospital?currentPage=" + (endNavi + 1) + "'> ▶ </a>");
			}
		}else{
			if(needPrev) {
				sb.append("<a class='prev' href='searchToHospital?&&option="+option+"&&currentPage=" + (startNavi - 1) + "'> ◀  </a>");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a class='pageNum' href='searchToHospital?&&option="+option+"&&currentPage=" + i + "'> " + i + "</a>");
			}
			if(needNext) {
				sb.append("<a class='next' href='searchToHospital?&&option="+option+"&&currentPage=" + (endNavi + 1) + "'> ▶ </a>");
			}
		}
		return sb.toString();
		
	}
	//----검색기능-------------------------------------------------------------------------------------------------------------------------------
	@Override
	public int searchRecordTotalCount(String option) { // 병원 전체개수
		return sst.selectOne("AnimalHospitalDAO.searchRecordCount", option);
	}
	@Override
	public List<AnimalHospitalDTO> searchAniHospitalPerPage(int currentPage, String option){//리스트 10개씩 
		Map<String, Object> param = new HashMap<>();
		int end = currentPage * recordCountPerPage;
		int start = end - 9; 
		param.put("start", start);
		param.put("end", end);
		param.put("option", option);
		return sst.selectList("AnimalHospitalDAO.searchAniHospitalPerPage", param);
	}
	//--병원 데이터 삽입-------------------------------------------------------------------------------------------------------------------------------
	@Override
	public int gyeonggiHospitalData(GyeonggiDTO gdto) {
		String addr = null;
		String tel = null;
		if(gdto.getREFINE_ROADNM_ADDR() == null) {
			addr = gdto.getREFINE_LOTNO_ADDR();
		}else {
			addr = gdto.getREFINE_ROADNM_ADDR();
		}
		if(gdto.getLOCPLC_FACLT_TELNO() == null) {
			tel = "-";
		}else {tel = gdto.getLOCPLC_FACLT_TELNO();}
		Map<String,String> hs = new HashMap<>();
		hs.put("area", "경기");
		hs.put("name", gdto.getBIZPLC_NM());
		hs.put("addr", addr);
		hs.put("tel", tel);
		return sst.insert("AnimalHospitalDAO.insertHospitalData",hs);
	}
	@Override
	public int seoulHospitalData(SeoulDTO sdto) {
		String addr = null;
		String tel = null;
		if(sdto.getAddr() == null) {
			addr = sdto.getAddr_old();
		}else {
			addr =sdto.getAddr();
		}
		if(sdto.getTel() == null) {
			tel = "-";
		}else {tel = sdto.getTel();}
		Map<String,String> hs = new HashMap<>();
		hs.put("area", "서울");
		hs.put("name", sdto.getNm());
		hs.put("addr", addr);
		hs.put("tel", tel);
		return sst.insert("AnimalHospitalDAO.insertHospitalData",hs);
	}
	@Override
	public int ulsanHospitalData(UlsanDTO udto) {
		Map<String,String> hs = new HashMap<>();
		String addr = null;
		String tel = null;
		if(udto.getAddress() == null) {
			addr = "-";
		}else {addr = udto.getAddress();}
		if(udto.getTel() == null) {
			tel = "-";
		}else {tel = udto.getTel();}
		hs.put("area", "울산");
		hs.put("name", udto.getTitle());
		hs.put("addr", addr);
		hs.put("tel", tel);
		return sst.insert("AnimalHospitalDAO.insertHospitalData",hs);
	}
	@Override
	public int deleteHospitalData(String area) {
		return sst.delete("AnimalHospitalDAO.deleteHospitalData",area);
	}
	
}
