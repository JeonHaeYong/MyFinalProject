package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kh.spring.dao.InfoDAO;
import kh.spring.dto.InfomaitionDTO;
import kh.spring.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService{
	@Autowired
	private InfoDAO  dao;
	
	public static int recordCountPerPage_num=9;
//글등록
	@Override
	public int Infoinsert(InfomaitionDTO tdto)throws Exception {
	
		return dao.insertInfo(tdto);
	}
	
	
	@Override
	public List<InfomaitionDTO> selectAll(int currentPage)throws Exception {
		
		int end=currentPage*recordCountPerPage_num;
		int start= end-(recordCountPerPage_num-1);
		return dao.selectall(start,end);
	}
	
	@Override
	public List<InfomaitionDTO> selectAll_training(int currentPage)throws Exception {
		
		int end=currentPage*recordCountPerPage_num;
		int start= end-(recordCountPerPage_num-1);
		return dao.selectalltraining(start,end);
	}
	
	
	
	
	
	@Override
	public InfomaitionDTO detail_info(int seq)throws Exception{
		 InfomaitionDTO dto=dao.detail_info(seq);
	System.out.println(dto.getWriter()+dto.getSeq()+dto.getWriteDate());
		 return dao.detail_info(seq);
	}
	
	@Override
	public int update_info(InfomaitionDTO dto)throws Exception{
		
		return dao.update_info(dto);
	}
	
	
	
	@Override
	public String getNavi_training(int currentPage)throws Exception {
		int recordTotalCount = this.boardselcount_training(); 
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
		{sb.append("<button type='button' value="+(startNavi-1)+" class='t_navi btn'>"+"<이전"+" "+"</button>");
		}
		for(int i=startNavi;i<=endNavi;i++)
		{
			sb.append("<button type='button' value="+i+" class='t_navi btn'>"+i+" "+"</button>");
		}
		if(needNext)
		{sb.append("<button type='button' value="+(endNavi+1)+" class='t_navi btn'>"+"다음>"+" "+"</button>");
		}
		return sb.toString();

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
		{sb.append("<button type='button' value="+(startNavi-1)+" class='infonavi btn'>"+"<이전"+" "+"</button>");
		}
		for(int i=startNavi;i<=endNavi;i++)
		{
			sb.append("<button type='button' value="+i+" class='infonavi btn'>"+i+" "+"</button>");
		}
		if(needNext)
		{sb.append("<button type='button' value="+(endNavi+1)+" class='infonavi btn'>"+"다음>"+" "+"</button>");
		}
		return sb.toString();

	}
	@Override
	public int boardselcount()throws Exception{
		
		return dao.boardselCount();
	}
	@Override
	public int boardselcount_training()throws Exception{
		
		return dao.boardselCount_training();
	}
	@Override
	public int deleteinfo(int seq) throws Exception {
	
		return dao.deleteinfo(seq);
	}
}
