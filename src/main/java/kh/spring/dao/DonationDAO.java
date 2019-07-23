package kh.spring.dao;

import kh.spring.dto.DonationDTO;

public interface DonationDAO
{
	public int insert(DonationDTO dto) throws Exception;

	
	
	public DonationDTO selectRecentDTO() throws Exception;
	public DonationDTO selectDTOByRowNumber(String page) throws Exception;
	public int selectCount() throws Exception;
	
	public int delete() throws Exception;
	
	public int updateCurrentMoney(int currentMoney);
}
