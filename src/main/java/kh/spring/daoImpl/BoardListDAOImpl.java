package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.BoardListDAO;
import kh.spring.dto.BoardListDTO;

@Repository
public class BoardListDAOImpl implements BoardListDAO{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<BoardListDTO> selectAllBoardList(String id, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		return sst.selectList("BoardListDAO.selectAllBoardList",map);
	}

	@Override
	public int getBoardCount(String id) {
		return sst.selectOne("BoardListDAO.getBoardCount",id);
	}

}
