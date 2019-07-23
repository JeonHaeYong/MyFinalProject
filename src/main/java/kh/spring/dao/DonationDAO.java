package kh.spring.dao;

import kh.spring.dto.DonationDTO;

public interface DonationDAO
{
	public int insert(DonationDTO dto) throws Exception;
	
	public DonationDTO selectDTO();
	
	public int delete() throws Exception;
	
	public int updateCurrentMoney(int currentMoney);
}
