package kh.spring.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.daoImpl.DonationDAOImpl;
import kh.spring.dto.DonationDTO;
import kh.spring.service.DonationService;

@Service
public class DonationServiceImpl implements DonationService
{

	private static final Logger logger = LoggerFactory.getLogger(DonationServiceImpl.class);
	
	@Autowired
	HttpSession session;
	@Autowired
	DonationDAOImpl donationDAO;
	
	@Transactional("txManager")
	@Override
	public Object addNewDonation
	(HttpServletRequest request,MultipartFile image1, MultipartFile image2, MultipartFile image3) 
		throws Exception
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String explanation = request.getParameter("explanation");
		int goalmoney = Integer.parseInt(request.getParameter("goalmoney"));
		java.sql.Date startdate = new java.sql.Date(sdf.parse(request.getParameter("startdate")).getTime());
		java.sql.Date enddate = new java.sql.Date(sdf.parse(request.getParameter("enddate")).getTime());
		
		
		
		String resourcePath = session.getServletContext().getRealPath("/resources");
		
		File folder = new File(resourcePath + "/donation");
		
		if(!(folder.exists()))
		{
			folder.mkdirs();
		}
		
//		logger.info("resource path : {}", resourcePath);
		
		long currTime = System.currentTimeMillis();
		String filePath1 = resourcePath + "/donation/"+ currTime +".jpg";
		image1.transferTo(new File(filePath1));
		String insertPath1 = "resources/donation/"+ currTime +".jpg";
		
		Thread.sleep(10);
		
		currTime = System.currentTimeMillis();
		String filePath2 = resourcePath + "/donation/"+ currTime +".jpg";
		image2.transferTo(new File(filePath2));
		String insertPath2 = "resources/donation/"+ currTime +".jpg";
		
		Thread.sleep(10);
		
		currTime = System.currentTimeMillis();
		String filePath3 = resourcePath + "/donation/"+ currTime +".jpg";
		image3.transferTo(new File(filePath3));
		String insertPath3 = "resources/donation/"+ currTime +".jpg";
		
		logger.info("name : {}", name);
		logger.info("title : {}", title);
		logger.info("explanation : {}", explanation);
		logger.info("insertPath1 : {}", insertPath1);
		logger.info("insertPath2 : {}", insertPath2);
		logger.info("insertPath3 : {}", insertPath3);
		logger.info("goalmoney : {}", goalmoney);
		logger.info("startdate : {}", startdate);
		logger.info("enddate : {}", enddate);
		
		DonationDTO dto = new DonationDTO();
		
		dto.setName(name);
		dto.setTitle(title);
		dto.setExplanation(explanation);
		dto.setImage1(insertPath1);
		dto.setImage2(insertPath2);
		dto.setImage3(insertPath3);
		dto.setGoalmoney(goalmoney);
		dto.setStartdate(startdate);
		dto.setEnddate(enddate);
		
		int deleteResult = donationDAO.delete();
		
		if(1 <= deleteResult)
		{
			int insertResult = donationDAO.insert(dto);
			
			logger.info("insertResult : {}", insertResult);
		}
		
		return "redirect: admin-donation";
	}

	@Override
	public Object selectDTO() throws Exception
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/donation/donation");
		mav.addObject("dto", donationDAO.selectDTO());
		
		return mav;
	}
	
	
	
}
