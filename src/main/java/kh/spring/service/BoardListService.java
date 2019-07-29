package kh.spring.service;

import java.util.List;

import kh.spring.dto.BoardListDTO;

public interface BoardListService {
	public List<BoardListDTO> selectAllBoardList(String id , int currentPage );
	public int getBoardCount(String id); //해당id의 총 글쓴 갯수
	public int[] getRecordPerPageStartEnd(int currentPage);//현재페이지에 대해 start , end
	public List<String> getNaviForBoardList(String id, int currentPage);//현재페이지에 대해 게시글목록 navi
}
