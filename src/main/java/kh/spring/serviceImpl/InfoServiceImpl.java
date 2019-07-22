package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kh.spring.dao.InfoDAO;
import kh.spring.dto.TrainingDTO;
import kh.spring.service.InfoService;

@Service("Service")
public class InfoServiceImpl implements InfoService{
	@Autowired
	InfoDAO  dao;
	
	public static int recordCountPerPage_num=9;

	@Override
	public int Infoinsert(TrainingDTO tdto)throws Exception {
	
		return dao.insertInfo(tdto);
	}
	@Override
	public List<TrainingDTO> selectAll(int currentPage)throws Exception {
		
		int end=currentPage*recordCountPerPage_num;
		int start= end-(recordCountPerPage_num-1);
		return dao.selectall(start,end);
	}
	@Override
	public TrainingDTO detail_info(int seq)throws Exception{
		
		return dao.detail_info(seq);
	}
	
	@Override
	public int update_info(TrainingDTO dto)throws Exception{
		
		return dao.update_info(dto);
	}
	@Override
	public String getNavi(int currentPage)throws Exception {
		int recordTotalCount = this.boardselcount(); 
		int recordCountPerPage =recordCountPerPage_num;
		int naviCountPerPage=2;
		int pageTotalCount=0;
		if(recordTotalCount % recordCountPerPage>0)
		{
			pageTotalCount=recordTotalCount/recordCountPerPage +1;	
		}
		else {
			pageTotalCount=recordTotalCount/recordCountPerPage;
		}
		if(currentPage<1)
		{
			currentPage=1;
		}
		else if(currentPage>pageTotalCount)
		{
			currentPage=pageTotalCount;
		}
		int startNavi=((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi=startNavi+(naviCountPerPage-1);
		if(endNavi>pageTotalCount)
		{
			endNavi=pageTotalCount;
		}

		boolean needPrev=true;
		boolean needNext=true;
		if(startNavi==1) {
			needPrev=false;
		}
		if(endNavi==pageTotalCount)
		{
			needNext=false;	
		}

		StringBuilder sb=new StringBuilder();
		if(needPrev)
		{sb.append("<a href='information_t?currentPage="+(startNavi-1)+"'>"+"<이전"+" "+"</a>");
		}
		for(int i=startNavi;i<=endNavi;i++)
		{
			sb.append("<a href='information_t?currentPage="+i+"'>"+i+" "+"</a>");
		}
		if(needNext)
		{sb.append("<a href='information_t?currentPage="+(endNavi+1)+"'>"+"다음>"+" "+"</a>");
		}
		return sb.toString();

	}
	@Override
	public int boardselcount()throws Exception{
		
		return dao.boardselCount();
	}
}
