package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.LostBoardDTO;

public interface LostBoardService {
	public int deleteLostBoard(int seq);
	public int modifyLostBoard(LostBoardDTO dto);
	public LostBoardDTO readOneLostBoard(int seq);
	public int insertLostBoard(LostBoardDTO dto);
	public List<LostBoardDTO> selectLostBoardPerPage(int currentPage);
	public Map<String,Integer> getNaviForLostBoard(int currentPage);
}
