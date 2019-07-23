package kh.spring.dao;

import kh.spring.dto.DonationDTO;

public interface DonationDAO
{
	public int insert(DonationDTO dto) throws Exception;

	
	
	public DonationDTO selectRecentDTO() throws Exception;
	public DonationDTO selectDTOByRowNumber(String page) throws Exception;
	public DonationDTO selectBySeq(DonationDTO dto) throws Exception;
	public int selectCount() throws Exception;
	
	public int delete() throws Exception;
	
	public int updateCurrentMoney(int currentMoney);
	
	public int updateNameBySeq(DonationDTO dto) throws Exception;
	public int updateTitleBySeq(DonationDTO dto) throws Exception;
	public int updateExplanationBySeq(DonationDTO dto) throws Exception;
	public int updateGoalmoneyBySeq(DonationDTO dto) throws Exception;
	public int updateStartdateBySeq(DonationDTO dto) throws Exception;
	public int updateEnddateBySeq(DonationDTO dto) throws Exception;
	public int updateImage1BySeq(DonationDTO dto) throws Exception;
	public int updateImage2BySeq(DonationDTO dto) throws Exception;
	public int updateImage3BySeq(DonationDTO dto) throws Exception;
	public int updateLeftBySeq(DonationDTO dto) throws Exception;
	public int updateRightBySeq(DonationDTO dto) throws Exception;
	
}
