package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.InfoDAO;
import kh.spring.dto.ItemDTO;
import kh.spring.dto.TrainingDTO;
@Repository
public class InfoDAOImpl implements InfoDAO{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insertInfo(TrainingDTO dto) throws Exception
	{
		return sst.insert("InfoDAO.insertinfo", dto);
	}
	
	@Override
	public List<TrainingDTO> selectall(int start,int end)throws Exception{
		 Map<String, String> map = new HashMap<String, String>();
		
			map.put( "start",  String.valueOf(start) );
			map.put( "end", String.valueOf( end) );
		return sst.selectList("InfoDAO.selectall",map);
	}
	
}
