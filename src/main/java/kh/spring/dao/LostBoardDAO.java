package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.LostBoardDTO;

public interface LostBoardDAO {
	public int insertLostBoard(LostBoardDTO dto);
	public int deleteLostBoard(int seq);
	public int modifyLostBoard(LostBoardDTO dto);
	public LostBoardDTO readOneLostBoard(int seq);
	public List<LostBoardDTO> selectLostBoardPerPage(int start, int end);
	public int lostBoardContentsSize();
	public Map<String, Integer> getNaviForLostBoard(int currentPage);
}
