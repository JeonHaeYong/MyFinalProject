package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.TrainingDAO;
import kh.spring.dto.TrainingDTO;

@Repository
public class TrainingDAOImpl implements TrainingDAO{
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public int insertTrainingWithoutImg(TrainingDTO tdto) {
		return sst.insert("TrainingDAO.insertTrainingWithoutImg", tdto);
	}
	@Override
	public int insertTraining(TrainingDTO tdto) {
		return sst.insert("TrainingDAO.insertTraining", tdto);
	}
	
}
