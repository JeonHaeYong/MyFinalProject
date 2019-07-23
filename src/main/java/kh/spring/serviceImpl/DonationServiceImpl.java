package kh.spring.serviceImpl;

import java.io.File;
import java.sql.Date;
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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
	(HttpServletRequest request,MultipartFile image1, MultipartFile image2, MultipartFile image3, MultipartFile left, MultipartFile right) 
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
		
		String insertPath1 = "없음";
		String insertPath2 = "없음";
		String insertPath3 = "없음";
		String leftInsertPath = "없음";
		String rightInsertPath = "없음";
		
//		logger.info("resource path : {}", resourcePath);
		@SuppressWarnings("unused")
		long currTime = 0;
		
		if(image1.getSize() != 0)
		{
			currTime = System.currentTimeMillis();
			String filePath1 = resourcePath + "/donation/"+currTime+"-donation1.jpg";
			image1.transferTo(new File(filePath1));
			insertPath1 = "resources/donation/"+currTime+"-donation1.jpg";
		}
		
		Thread.sleep(10);
		
		if(image2.getSize() != 0)
		{
			currTime = System.currentTimeMillis();
			String filePath2 = resourcePath + "/donation/"+currTime+"-donation2.jpg";
			image2.transferTo(new File(filePath2));
			insertPath2 = "resources/donation/"+currTime+"-donation2.jpg";
		}
		
		Thread.sleep(10);
		
		if(image3.getSize() != 0)
		{
			currTime = System.currentTimeMillis();
			String filePath3 = resourcePath + "/donation/"+currTime+"-donation3.jpg";
			image3.transferTo(new File(filePath3));
			insertPath3 = "resources/donation/"+currTime+"-donation3.jpg";
		}
		
		Thread.sleep(10);
		
		if(left.getSize() != 0)
		{
			currTime = System.currentTimeMillis();
			String leftfilePath = resourcePath + "/donation/"+currTime+"-left.jpg";
			left.transferTo(new File(leftfilePath));
			leftInsertPath = "resources/donation/"+currTime+"-left.jpg";
		}
		
		Thread.sleep(10);
		
		if(right.getSize() != 0)
		{
			currTime = System.currentTimeMillis();
			String rightfilePath = resourcePath + "/donation/"+currTime+"-right.jpg";
			right.transferTo(new File(rightfilePath));
			rightInsertPath = "resources/donation/"+currTime+"-right.jpg";
		}
		
		logger.info("name : {}", name);
		logger.info("title : {}", title);
		logger.info("explanation : {}", explanation);
		logger.info("insertPath1 : {}", insertPath1);
		logger.info("insertPath2 : {}", insertPath2);
		logger.info("insertPath3 : {}", insertPath3);
		logger.info("leftInsertPath : {}", leftInsertPath);
		logger.info("rightInsertPath : {}", rightInsertPath);
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
		dto.setLeft(leftInsertPath);
		dto.setRight(rightInsertPath);
		dto.setGoalmoney(goalmoney);
		dto.setStartdate(startdate);
		dto.setEnddate(enddate);
		
//		int deleteResult = donationDAO.delete();
//		logger.info("삭제한 데이터 수 : {}", deleteResult);
		
		int insertResult = donationDAO.insert(dto);
		logger.info("insertResult : {}", insertResult);
		
		return "redirect: admin-donation";
	}

	@Override
	public Object selectRecentDTO() throws Exception
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/donation/donation");
		mav.addObject("dto", donationDAO.selectRecentDTO());
		
		return mav;
	}

	@Override
	public Object selectDTOByRowNumber(String page) throws Exception
	{
		DonationDTO dto = donationDAO.selectDTOByRowNumber(page);
		
		logger.info("페이지: {}", page);
		
		if((page == null) || (page.equals("")))
		{
			page = "1";
		}
		int currentPage = Integer.parseInt(page);
		int recordCountPerPage = 1;
		int naviCountPerPage = 5;
		
		int pageTotalCount = 0;
		int recordTotalCount = donationDAO.selectCount();
				
		boolean needPrev = true;
		boolean needNext = true;
		
		JsonObject outerjo = new JsonObject();
		
		int seq = dto.getSeq();
		String name = dto.getName();
		String title = dto.getTitle();
		String explanation = dto.getExplanation();
		String image1 = dto.getImage1();
		String image2 = dto.getImage2();
		String image3 = dto.getImage3();
		String left = dto.getLeft();
		String right = dto.getRight();
		int goalmoney = dto.getGoalmoney();
		int currentmoney = dto.getCurrentmoney();
		Date startdate = dto.getStartdate();
		Date enddate = dto.getEnddate();
			
		outerjo.addProperty("seq", seq);
		outerjo.addProperty("name", name);
		outerjo.addProperty("title", title);
		outerjo.addProperty("explanation", explanation);
		outerjo.addProperty("image1", image1);
		outerjo.addProperty("image2", image2);
		outerjo.addProperty("image3", image3);
		outerjo.addProperty("left", left);
		outerjo.addProperty("right", right);
		outerjo.addProperty("goalmoney", goalmoney);
		outerjo.addProperty("currentmoney", currentmoney);
		outerjo.addProperty("startdate", startdate.toString());
		outerjo.addProperty("enddate", enddate.toString());
			
		
		
		if( recordTotalCount % recordCountPerPage == 0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}

		if(currentPage < 1)
		{
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount)
		{
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		if(startNavi == 1)
		{
			needPrev = false;
		}
		if(endNavi == pageTotalCount)
		{
			needNext = false;
		}
		
		outerjo.addProperty("currentPage", currentPage);
		outerjo.addProperty("needPrev", needPrev);
		outerjo.addProperty("needNext", needNext);
		outerjo.addProperty("startNavi", startNavi);
		outerjo.addProperty("endNavi", endNavi);
		
		
		
		return new Gson().toJson(outerjo);
		
	}

//	@Override
//	public Object changeImage(MultipartFile left, MultipartFile right) throws Exception
//	{
//		String resourcePath = session.getServletContext().getRealPath("/resources");
//		
//		File folder = new File(resourcePath + "/donation");
//		
//		if(!(folder.exists()))
//		{
//			folder.mkdirs();
//		}
//		
//		
//		if(left.getSize() != 0)
//		{
//			String filePath = resourcePath + "/donation/left.jpg";
//			left.transferTo(new File(filePath));
//		}
//		if(right.getSize() != 0)
//		{
//			String filePath = resourcePath + "/donation/right.jpg";
//			right.transferTo(new File(filePath));
//		}
//		
//		return "redirect: admin-donation";
//	}

	
	
	
}
