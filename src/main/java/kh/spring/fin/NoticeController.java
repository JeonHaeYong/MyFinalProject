package kh.spring.fin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "notice-write-page", method = RequestMethod.GET)
	public String noticeWritePage()
	{
		return "/notice/notice_write";
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
	
}
