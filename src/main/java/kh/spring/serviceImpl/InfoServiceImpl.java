package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.Configeration;
import kh.spring.dao.InfoDAO;
import kh.spring.dto.TrainingDTO;
import kh.spring.service.InfoService;

@Service("Service")
public class InfoServiceImpl implements InfoService{
	@Autowired
	InfoDAO  dao;
	
	@Autowired
	private Configeration cgf;

	@Override
	public int Infoinsert(TrainingDTO tdto)throws Exception {
	
		return dao.insertInfo(tdto);
	}
	@Override
	public List<TrainingDTO> selectAll(int currentPage)throws Exception {
		
		int end=currentPage*cgf.recordCountPerPage;
		int start= end-(cgf.recordCountPerPage-1);
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
}
