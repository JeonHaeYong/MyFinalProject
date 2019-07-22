package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.TrainingDAO;
import kh.spring.dto.TrainingDTO;

@Repository
public class TrainingDAOImpl implements TrainingDAO{
	@Autowired
	private SqlSessionTemplate sst;
	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 6;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 10;
	@Override
	public int insertTrainingWithoutImg(TrainingDTO tdto) {
		String reTitle = this.replaceAll(tdto.getTitle());
		String reContents = this.replaceAll(tdto.getContents());
		tdto.setTitle(reTitle);
		tdto.setContents(reContents);
		return sst.insert("TrainingDAO.insertTrainingWithoutImg", tdto);
	}
	@Override
	public int insertTraining(TrainingDTO tdto) {
	
		String reTitle = this.replaceAll(tdto.getTitle());
		String reContents = this.replaceAll(tdto.getContents());
		tdto.setTitle(reTitle);
		tdto.setContents(reContents);
		return sst.insert("TrainingDAO.insertTraining", tdto);
	}
	@Override
	public List<TrainingDTO> trainingPerPage(int currentPage){
		Map<String, Integer> hs = new HashMap<>();
		int end = currentPage * recordCountPerPage;
		int start = end - 9;
		hs.put("end", end);
		hs.put("start", start);
		return sst.selectList("TrainingDAO.trainingPerPage", hs);
	}
	@Override
	public int recordCount() {
		return sst.selectOne("TrainingDAO.recordCount");
	}
	@Override
	public String replaceAll(String text) {
		String reText = text;
		reText = reText.replaceAll("<script", "");
		reText = reText.replaceAll("< script", "");
		reText = reText.replaceAll("script>", "");
		reText = reText.replaceAll("srcipt >", "");
		reText = reText.replaceAll("\"\\)\\;", "");
		reText = reText.replaceAll(">alert", "");
		reText = reText.replaceAll("\\(\"", "");
		reText = reText.replaceAll("\\</", "");
		return reText;
	}
}
