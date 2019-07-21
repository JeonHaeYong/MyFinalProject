package kh.spring.dao;

import java.util.List;

import kh.spring.dto.TrainingDTO;

public interface TrainingDAO {
	public int insertTrainingWithoutImg(TrainingDTO tdto);
	public int insertTraining(TrainingDTO tdto);
	public List<TrainingDTO> trainingPerPage(int currentPage);
	public String replaceAll(String text);
	public int recordCount();
}
