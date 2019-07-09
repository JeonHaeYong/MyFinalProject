package kh.spring.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.LostBoardDAO;
import kh.spring.dto.LostBoardDTO;
import kh.spring.service.LostBoardService;

@Service
public class LostBoardServiceImpl implements LostBoardService {
	
	@Autowired
	private LostBoardDAO lbdao;
	
	public int deleteLostBoard(int seq) {
		int result = lbdao.deleteLostBoard(seq);
		return result;
	}
	
	public int modifyLostBoard(LostBoardDTO dto) {
		int result = lbdao.modifyLostBoard(dto);
		return result;
	}
	
	public LostBoardDTO readOneLostBoard(int seq) {
		
			LostBoardDTO dto = lbdao.readOneLostBoard(seq);
			return dto;
	}
	
	public int insertLostBoard(LostBoardDTO dto) {
		int result = lbdao.insertLostBoard(dto);
		return result;
	}
	
	public List<LostBoardDTO> selectLostBoardPerPage(int currentPage) {
		Map<String, Integer> navi = lbdao.getNaviForLostBoard(currentPage);
		return lbdao.selectLostBoardPerPage(navi.get("fromIndex"), navi.get("toIndex"));
	}
	
	public Map<String,Integer> getNaviForLostBoard(int currentPage) {
		return lbdao.getNaviForLostBoard(currentPage);
	}

}
