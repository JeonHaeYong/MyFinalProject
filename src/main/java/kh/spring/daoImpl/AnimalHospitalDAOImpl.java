package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.AnimalHospitalDAO;
import kh.spring.dto.AnimalHospitalDTO;

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
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a class='pageNum' href='toHospital?currentPage=" + i + "'> " + i + "</a>");
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
		return sst.selectOne("AnimalHospitalDAO.searchRecordCount",option);
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
	
}
