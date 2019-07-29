package kh.spring.dao;

import java.util.List;

import kh.spring.dto.BoardListDTO;

public interface BoardListDAO {
	public List<BoardListDTO> selectAllBoardList(String id , int start, int end );
	public int getBoardCount(String id);
}
