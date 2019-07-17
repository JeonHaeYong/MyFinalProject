package kh.spring.dao;

import kh.spring.dto.TrainingDTO;

public interface TrainingDAO {
	public int insertTrainingWithoutImg(TrainingDTO tdto);
	public int insertTraining(TrainingDTO tdto);
}
