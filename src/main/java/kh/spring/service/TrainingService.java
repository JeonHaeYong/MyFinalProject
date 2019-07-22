package kh.spring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.FileDTO;
import kh.spring.dto.TrainingDTO;

public interface TrainingService {
	public int NoImageService(TrainingDTO tdto);
	public int insertTrainingService(TrainingDTO tdto);
	public String imageUploadService(MultipartFile image);
	public List<TrainingDTO> trainingPerPageService(int currentPage);
	public int recordCountService();
	
}
