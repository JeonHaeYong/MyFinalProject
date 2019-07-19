/*package kh.spring.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TrainingDAO;
import kh.spring.dto.FileDTO;
import kh.spring.dto.TrainingDTO;
import kh.spring.service.TrainingService;

@Service
public class TrainingServiceImpl implements TrainingService{
	@Autowired
	private TrainingDAO tdao;
	@Autowired
	private HttpSession session;
	@Override
	public int NoImageService(TrainingDTO tdto) { // 이미지 없는 글 등록
		return tdao.insertTrainingWithoutImg(tdto);
	
	}
	@Override
	public int insertTrainingService(TrainingDTO tdto) { // 이미지 있는 글 등록
		return tdao.insertTraining(tdto);
	}
	@Override
	public String imageUploadService(FileDTO fdto) {//이미지 서버에 업로드
		String date = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		long time = System.currentTimeMillis();
		String id = (String)session.getAttribute("id");
		
		String resourcePath = session.getServletContext().getRealPath("/resources");
		String boardPath = resourcePath + "/trainingBoard";
		String datePath = boardPath + "/" + date;
		String usersPath = datePath + "/" + id;
		System.out.println("이미지 경로: " + resourcePath);
		
		File uploadPath = new File(usersPath);
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		try {
			fdto.getFiles().transferTo(new File(usersPath + "/" + time + "_tBoard_image.png"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		String pjPath = "/trainingBoard/" + date + "/" + id + "/" + time + "_tBoard_image.png";
		System.out.println(pjPath);
		return pjPath;
		
	}

}
*/