package kh.spring.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface DonationService
{
	public Object addNewDonation
		(HttpServletRequest request,MultipartFile image1, MultipartFile image2, MultipartFile image3, MultipartFile left, MultipartFile right) 
		throws Exception;
	
	public Object selectRecentDTO() throws Exception;
	public Object selectDTOByRowNumber(String page) throws Exception;
	
	public Object updateDonation
		(HttpServletRequest request,MultipartFile image1, MultipartFile image2, MultipartFile image3, MultipartFile left, MultipartFile right) 
		throws Exception;
	
//	public Object changeImage(MultipartFile left, MultipartFile right) throws Exception;
	
}
