package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.QuizDAO;
import kh.spring.dto.QuizDTO;

@Repository
public class QuizDAOImpl implements QuizDAO {
	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 10;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 10;
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertQuiz(QuizDTO dto) {
		return sst.insert("QuizDAO.insertQuiz", dto);
	}

	@Override
	public List<QuizDTO> selectAllQuiz() {
		return sst.selectList("QuizDAO.selectAllQuiz");
	}
	@Override
	public List<QuizDTO> selectRandQuiz(int quizNum) {
		Set<Integer> set = new HashSet<>();
		while(true) {
			int rand = (int)(Math.random()*(quizNum-1)+1);
			System.out.println(rand);
			set.add(rand);
			if(set.size() == 10) {
				break;
			}
		}
		Object[] rands = set.toArray();
		Map<String, Integer> randSeq = new HashMap<>();
		String key = "num";
		for(int i = 0; i < 10; i++) {
			randSeq.put(key+(i+1), (int)rands[i]);
		}
		System.out.println(randSeq);
		return sst.selectList("QuizDAO.selectRandQuiz", randSeq);
	}

	@Override
	public int getQuizNum() {
		return sst.selectOne("QuizDAO.getQuizNum");
	}

	@Override
	public int deleteQuiz(int seq) {
		return sst.delete("QuizDAO.deleteQuiz", seq);
	}
	@Override
	public int updatePoint(int point, String id) {
		Map<String,Object> hs = new HashMap<>();
		hs.put("point", point);
		hs.put("id", id);
		return sst.update("QuizDAO.updatePoint",hs);
	}
	@Override
	public List<QuizDTO> selectQuizPerPage(int currentPage){
		Map<String,Integer> hs = new HashMap<>();
		int end = currentPage * recordCountPerPage;
		int start = end - 9;
		hs.put("end", end);
		hs.put("start", start);
		return sst.selectList("QuizDAO.selectQuizPerPage", hs);
	}
	@Override
	public int QuizCount() {
		return sst.selectOne("QuizDAO.quizCount");
	}
	@Override
	public String getNaviQuiz(int currentPage) {
		int recordTotalCount = this.QuizCount();
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
		boolean needPrev = true;	
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<a class='prev' href='quizAdmin?currentPage=" + (startNavi - 1) + "'> ◀  </a>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a class='pageNum' href='quizAdmin?currentPage=" + i + "'> " + i + "</a>");
		}
		if(needNext) {
			sb.append("<a class='next' href='quizAdmin?currentPage=" + (endNavi + 1) + "'> ▶ </a>");
		}
		return sb.toString();
	}
}
