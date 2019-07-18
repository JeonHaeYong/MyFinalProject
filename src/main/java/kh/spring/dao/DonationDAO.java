package kh.spring.dao;

import kh.spring.dto.DonationDTO;

public interface DonationDAO
{
	public int insert(DonationDTO dto) throws Exception;
	
	public DonationDTO selectDTO() throws Exception;
	
	public int delete() throws Exception;
}
