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
			List<TrainingDTO> list=	sst.selectList("InfoDAO.selectall",map);
				return sst.selectList("InfoDAO.selectall",map);
	}
	@Override
	public TrainingDTO detail_info(int seq)throws Exception{
		
		return sst.selectOne("InfoDAO.selectdetail", seq);
	}
	@Override 
	public int update_info(TrainingDTO dto)throws Exception{
		
	return sst.update("InfoDAO.updateinfo",dto);
	}
	@Override
	public int boardselCount()throws Exception{
		return sst.selectOne("InfoDAO.bordcount");
	}
	
	public int deleteinfo(int seq)throws Exception{
		
		return sst.delete("InfoDAO.delinfo", seq);
	}
}
