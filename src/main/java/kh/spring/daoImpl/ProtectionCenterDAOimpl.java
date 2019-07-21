package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.ProtectionCenterDAO;
import kh.spring.dto.ProtectionCenterDTO;

@Repository
public class ProtectionCenterDAOimpl implements ProtectionCenterDAO{
	@Autowired
	private SqlSessionTemplate sst;
	
	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 10;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 10;
	
	@Override
	public List<ProtectionCenterDTO> selectAllCenter() {
		return sst.selectList("ProtectionCenterDAO.selectAllCenter");
	}

	@Override
	public List<ProtectionCenterDTO> selectCenterPerPage(int currentPage) {
		Map<String, Integer> hs = new HashMap<>();
		int end = currentPage * recordCountPerPage;
		int start = end - 9; 
		hs.put("end", end);
		hs.put("start", start);
		return	sst.selectList("ProtectionCenterDAO.selectCenterPerPage",hs);
	}

	@Override
	public int getRecordTotalCount() {
		return sst.selectOne("ProtectionCenterDAO.getRecordTotalCount");
	}
	@Override
	public String getNaviForCenter(int currentPage, String option){//페이지 네비게이션
		int recordTotalCount = 0;
		if(option == null) {
			recordTotalCount = this.getRecordTotalCount();
		}else{
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
		if(option == null) {
			if(needPrev) {
				sb.append("<a class='prev' href='toCenter?currentPage=" + (startNavi - 1) + "'> ◀  </a>");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a class='pageNum' href='toCenter?currentPage=" + i + "'> " + i + "</a>");
			}
			if(needNext) {
				sb.append("<a class='next' href='toCenter?currentPage=" + (endNavi + 1) + "'> ▶ </a>");
			}
		}else {
			if(needPrev) {
				sb.append("<a class='prev' href='searchToCenter?option="+option+"&&currentPage=" + (startNavi - 1) + "'> ◀  </a>");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a class='pageNum' href='searchToCenter?option="+option+"&&currentPage=" + i + "'> " + i + "</a>");
			}
			if(needNext) {
				sb.append("<a class='next' href='searchToCenter?option="+option+"&&currentPage=" + (endNavi + 1) + "'> ▶ </a>");
			}
		}
		
		
		return sb.toString();
	}
	
	//-검색기능-----------------------------------------------------------------------------------------------------
	@Override
	public int searchRecordTotalCount(String option) {
		return sst.selectOne("ProtectionCenterDAO.searchRecordCount", option + "%");
	}
	@Override
	public List<ProtectionCenterDTO> searchCenterPerPage(int currentPage, String option){
		Map<String, Object> param = new HashMap<>();
		int end = currentPage * recordCountPerPage;
		int start = end - 9;
		param.put("option", option + "%");
		param.put("start", start);
		param.put("end", end);
		return sst.selectList("ProtectionCenterDAO.searchCenterPerPage", param);
	}
	
}
