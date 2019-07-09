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
		return sst.delete("QuizDAO", seq);
	}

}
