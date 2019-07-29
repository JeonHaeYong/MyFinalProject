package kh.spring.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dao.MemberDAO;
import kh.spring.dao.NoticeDAO;
import kh.spring.dto.NoticeDTO;
import kh.spring.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService
{
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	HttpSession session;
	@Autowired
	NoticeDAO noticeDAO;
	@Autowired
	MemberDAO memberDAO;
	
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
	public Object noticeListPage() throws Exception
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/notice_view");
		String id = (String)session.getAttribute("id");
		
		if((id != null) && (memberDAO.selectOneMember(id).getType() == 4))
		{
			mav.addObject("admin", "Y");
		}
		
		return mav;
	}
	
	@Override
	public String selectForPage(String page) throws Exception
	{
		
		int currentPage = Integer.parseInt(page);
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordTotalCount = noticeDAO.selectCountAll();
		int pageTotalCount;
		boolean needPrev = true;
		boolean needNext = true;
		
		int pageStart = currentPage * recordCountPerPage - recordCountPerPage + 1;
		int pageEnd = currentPage * recordCountPerPage;
		
		List<NoticeDTO> list = noticeDAO.selectForPage(pageStart, pageEnd);
		
		JsonObject outerjo = new JsonObject();
		JsonArray ja = new JsonArray();
		
		for(int i = 1 ; i <= list.size() ; i++)
		{
			JsonObject jo = new JsonObject();
			int seq = list.get(i-1).getSeq();
			String title = list.get(i-1).getTitle();
			String writeTime = list.get(i-1).getWrite_time().toString();
			int viewCount = list.get(i-1).getView_count();
			
			jo.addProperty("seq", seq);
			jo.addProperty("title", title);
			jo.addProperty("write_time", writeTime);
			jo.addProperty("view_count", viewCount);
			ja.add(jo);
		}
		outerjo.add("array", ja);
		
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
		
		outerjo.addProperty("size", list.size());
		outerjo.addProperty("currentPage", currentPage);
		outerjo.addProperty("needPrev", needPrev);
		outerjo.addProperty("needNext", needNext);
		outerjo.addProperty("startNavi", startNavi);
		outerjo.addProperty("endNavi", endNavi);
		
		return new Gson().toJson(outerjo);
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

	@Override
	public Object NoticeDetailPage(NoticeDTO dto) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		int viewCountResult = noticeDAO.viewCountPlus(dto);
		
		if(viewCountResult == 1)
		{
			NoticeDTO resultDTO = noticeDAO.selectDTO(dto);
			
			logger.info("제목 : {}", resultDTO.getTitle());
			logger.info("내용 : {}", resultDTO.getContents());
			logger.info("시간 : {}", resultDTO.getWrite_time());
			logger.info("조회 : {}", resultDTO.getView_count());
			
			String id = (String)session.getAttribute("id");
			logger.info("조회 시도한 아이디 : {}", id);
			
			int type = 9;
			if(id != null)
			{
				type = memberDAO.selectOneMember(id).getType();
				logger.info("조회 시도한 사람의 등급 : {}", type);
			}
			
			mav.addObject("type", type);
			mav.addObject("dto", resultDTO);
			
			mav.setViewName("/notice/notice_detail");
		}
		else
		{
			mav.setViewName("error");
		}
		
		return mav;
	}

	@Override
	public Object NoticeUpdatePage(NoticeDTO dto) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		NoticeDTO resultDTO = noticeDAO.selectDTO(dto);
			
		logger.info("제목 : {}", resultDTO.getTitle());
		logger.info("내용 : {}", resultDTO.getContents());
		logger.info("시간 : {}", resultDTO.getWrite_time());
		logger.info("조회 : {}", resultDTO.getView_count());
			
		mav.addObject("dto", resultDTO);
		mav.setViewName("/notice/notice_write");
		
		return mav;
	}

	@Transactional("txManager")
	@Override
	public Object NoticeUpdateDo(NoticeDTO dto) throws Exception
	{
		int titleResult = noticeDAO.updateTitleBySeq(dto);
		int contentsResult = noticeDAO.updateContentsBySeq(dto);
		int writeTimeResult = noticeDAO.updateWriteTimeBySeq(dto);
		
		String result = "";
		
		if(((titleResult == 1) && (contentsResult == 1)) && (writeTimeResult == 1))
		{
			result = "redirect: notice-detail-page?seq="+dto.getSeq();
		}
		else
		{
			result = "error";
		}
		
		return result;
	}

	@Override
	public String NoticeDeleteDo(NoticeDTO dto) throws Exception
	{
		String result = "error";
		
		int deleteResult = noticeDAO.deleteBySeq(dto);
		
		if(deleteResult == 1)
		{
			result = "redirect: notice-view-page";
		}
		
		return result;
	}

	
}
