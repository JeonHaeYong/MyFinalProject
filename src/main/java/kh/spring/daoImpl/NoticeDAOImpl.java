package kh.spring.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.NoticeDAO;
import kh.spring.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO
{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insert(NoticeDTO dto) throws Exception
	{
		return sst.insert("NoticeDAO.insert", dto);
	}

	@Override
	public List<NoticeDTO> selectForPage(int pageStart, int pageEnd) throws Exception
	{
		return sst.selectList("NoticeDAO.selectForPage", new Object[] {pageStart, pageEnd});
	}
	
}
