package kh.spring.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.DisappearReportDAO;
import kh.spring.dto.DisappearReportDTO;
import kh.spring.service.DisappearReportService;

@Service
public class DisappearReportServiceImpl implements DisappearReportService{
	@Autowired
	private HttpSession session;
	@Autowired
	private DisappearReportDAO drdao;
	
	@Override
	public int insert(DisappearReportDTO drdto) {
		return drdao.insert(drdto);
	}
	@Override
	public String imageUploadService(MultipartFile image) {
		String date = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		long time = System.currentTimeMillis();
		String id = (String)session.getAttribute("id");
		String resourcePath = session.getServletContext().getRealPath("/resources");
		System.out.println(resourcePath);
		String boardPath = resourcePath + "/DisappearReport";
		String datePath = boardPath + "/" + date;
		String usersPath = datePath + "/" + id;
		System.out.println("이미지 경로: " + resourcePath);
		
		File uploadPath = new File(usersPath);
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		try {
			image.transferTo(new File(usersPath + "/" + time + "_disappear_image.png"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		String pjPath = "/DisappearReport/" + date + "/" + id + "/" + time + "_disappear_image.png";
		System.out.println(pjPath);
		return pjPath;
	}
	@Override
	public List<DisappearReportDTO> selectPerPageService(int currentPage){
		return drdao.selectPerPage(currentPage);
	}
	@Override
	public String getNaviService (int currentPage) {
		return drdao.getNavi(currentPage);
	}
	@Override
	public DisappearReportDTO toReportContentService(int seq) {
		return drdao.toReportContent(seq);
	}
	@Override
	public int updateNoimageService(DisappearReportDTO drdto) {
		return drdao.updateNoImage(drdto);
	}
	@Override
	public int updateService(DisappearReportDTO drdto) {
		return drdao.update(drdto);
	}
	@Override
	public int deleteService(int seq) {
		return drdao.delete(seq);
	}
}
