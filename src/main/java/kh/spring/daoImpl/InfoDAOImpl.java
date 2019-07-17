package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.InfoDAO;
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
	
}
