package kh.spring.dao;

import java.util.List;

import kh.spring.dto.DisappearReportDTO;

public interface DisappearReportDAO {
	public int insertNoImage(DisappearReportDTO drdto);
	public int insert(DisappearReportDTO drdto);
	public List<DisappearReportDTO> selectPerPage(int currentPage);
	public int recordAllCount();
	public String getNavi(int currentPage);
	public DisappearReportDTO toReportContent(int seq);
	public int updateNoImage(DisappearReportDTO drdto);
	public int update(DisappearReportDTO drdto);
}
