package kh.spring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.DisappearReportDTO;

public interface DisappearReportService {
	public int insert(DisappearReportDTO drdto);
	public String imageUploadService(MultipartFile image);
	public List<DisappearReportDTO> selectPerPageService(int currentPage);
	public String getNaviService (int currentPage);
	public DisappearReportDTO toReportContentService(int seq);
	public int updateNoimageService(DisappearReportDTO drdto);
	public int updateService(DisappearReportDTO drdto);
	public int deleteService(int seq);
}
