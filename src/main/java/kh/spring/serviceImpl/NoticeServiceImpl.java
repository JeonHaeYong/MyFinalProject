package kh.spring.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.daoImpl.NoticeDAOImpl;
import kh.spring.dto.NoticeDTO;
import kh.spring.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService
{
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	NoticeDAOImpl noticeDAO;
	
	@Override
	public String insert(NoticeDTO dto) throws Exception
	{
		int insertResult = noticeDAO.insert(dto);
		
		if(insertResult == 1)
		{
			return "redirect: notice-view-page";
		}
		else
		{
			return "error";
		}
	}
	
	@Override
	public String selectForPage() throws Exception
	{
		return null;
	}
	
	@Override
	public String insertDummy() throws Exception
	{
		int insertResult = 0;
		String alphabet = "abcdefghijklmnopqrstuvwxyz";
		String title = "";
		String contents = "";
		int index = 0;
		
		for(int i = 1 ; i <= 300 ; i++)
		{
			for(int j = 1 ; j <= 5 ; j++)
			{
				index = (int) ( Math.random() * 26 );
				title = title + alphabet.charAt(index);
			}
			
			for(int j = 1 ; j <= 20 ; j++)
			{
				index = (int) ( Math.random() * 26 );
				contents = contents + alphabet.charAt(index);
			}
			
			insertResult = noticeDAO.insert(new NoticeDTO(title,"<p>"+contents+"</p>"));
			
			title = "";
			contents = "";
			
			if(!(insertResult == 1))
			{
				i = i - 1;
			}
		}
		logger.info("데이터 삽입 완료");
		return "redirect: notice-view-page";
	}

	
}
