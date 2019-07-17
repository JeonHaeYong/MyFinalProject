package kh.spring.fin;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.NoticeDTO;
import kh.spring.serviceImpl.NoticeServiceImpl;

@Controller
public class NoticeController
{
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeServiceImpl noticeService;
	
	@RequestMapping(value = "notice-view-page", method = RequestMethod.GET)
	public String noticeListPage()
	{
		return "/notice/notice_view";
	}
	@ResponseBody
	@RequestMapping(value = "notice-view-do", produces="application/json;charset=utf-8")
	public String getNotice(String page)
	{
		String result = "";
		
		try
		{
			result = noticeService.selectForPage(page);
//			logger.info("JSON DATA: {}", result);
			logger.info("공지사항 조회 시도");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "notice-write-page", method = RequestMethod.GET)
	public String noticeWritePage()
	{
		return "/notice/notice_write";
	}
	@ResponseBody
	@RequestMapping(value = "notice-write-image", method = RequestMethod.POST)
	public String noticeWriteImage(HttpServletRequest request, MultipartFile image)
	{
		String id = (String)request.getSession().getAttribute("id");
		System.out.println(id);
		String resourcePath = request.getSession().getServletContext().getRealPath("/resources");
		System.out.println(resourcePath);
		long currTime = System.currentTimeMillis();
		String imagePath = "/resources/" + id + "/" + currTime + "_board_image.png";
		
		File folder = new File(resourcePath + "/" + id);
		
		if(!(folder.exists()))
		{
			folder.mkdirs();
		}
		
		try 
		{
			image.transferTo(new File(resourcePath + "/" + id + "/" + currTime + "_board_image.png"));
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return imagePath;
	}
	@RequestMapping(value = "notice-write-do", method = RequestMethod.POST)
	public String noticeWriteDo(NoticeDTO dto)
	{
		logger.info("제목 : {} , 내용: {}", dto.getTitle(), dto.getContents());
		String result = "error";
		
		try
		{
			result = noticeService.insert(dto);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	@RequestMapping(value = "notice-write-random", method = RequestMethod.GET)
	public String noticeWriteDummy()
	{
		logger.info("게시글 데이터 삽입 시도");
		
		String result = "error";
		
		try
		{
			result = noticeService.insertDummy();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "notice-detail-page")
	public Object noticeDetailPage(NoticeDTO dto)
	{
		Object result = "error";
		
		try
		{
			result = noticeService.NoticeDetailPage(dto);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
}
