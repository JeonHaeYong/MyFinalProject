package kh.spring.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kh.spring.dao.TempProtectDAO;
import kh.spring.dto.TempProtectDTO;

@Repository
public class TempProtectDAOImpl implements TempProtectDAO {

	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 12;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 5;
	
	@Autowired
	private SqlSessionTemplate sst;

	public int deleteTempProtect(TempProtectDTO dto) {
		return sst.delete("TempProtectDAO.delete", dto);
	}

	public int modifyTempProtect(TempProtectDTO dto) {
		return sst.update("TempProtectDAO.modify", dto);
	}

	@Override
	public int tempProtectContentsSize() {
		return sst.selectOne("TempProtectDAO.select");
	}
	@Override
	public TempProtectDTO selectOneTempProtect(int seq) {
		return sst.selectOne("TempProtectDAO.selectBySeq", seq);
	}

	public int uploadTempProtect(TempProtectDTO dto) {
		return sst.insert("TempProtectDAO.upload", dto);
	}
	
	public List<TempProtectDTO> selectAllTempProtect(int currentPage){

		int endNum = currentPage*recordCountPerPage;
		int startNum = endNum - (recordCountPerPage-1);	

		return sst.selectList("TempProtectDAO.selectList", new Object[] {startNum,endNum});
	}

	@Override
	public Map<String, Integer> getNaviForTempProtect(int currentPage) {
		int recordTotalCount = this.tempProtectContentsSize();
		// 가지고 있는 게시글의 수에 맞는 페이지의 개수를 구함.
		int pageTotalCount = recordTotalCount / recordCountPerPage;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount++;
		}
		// 현재 페이지 오류 검출 및 정정
		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		// 네비게이터 시작과 끝
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		// 네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		int needPrev = 1;	// 1이면 true, -1이면 false
		int needNext = 1;

		if(startNavi == 1) {
			needPrev = -1;
		}
		if(endNavi == pageTotalCount) {
			needNext = -1;
		}

		int fromIndex = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int toIndex = currentPage*recordCountPerPage;

		if(toIndex > recordTotalCount) {
			toIndex = recordTotalCount;
		}

		Map<String, Integer> pageNavi = new HashMap<>();
		pageNavi.put("currentPage", currentPage);
		pageNavi.put("recordTotalCount", recordTotalCount);
		pageNavi.put("recordCountPerPage", recordCountPerPage);
		pageNavi.put("naviCountPerPage", naviCountPerPage);
		pageNavi.put("pageTotalCount", pageTotalCount);
		pageNavi.put("startNavi", startNavi);
		pageNavi.put("endNavi", endNavi);
		pageNavi.put("needPrev", needPrev);
		pageNavi.put("needNext", needNext);
		pageNavi.put("fromIndex", fromIndex);
		pageNavi.put("toIndex", toIndex);

		return pageNavi;
	}

}
