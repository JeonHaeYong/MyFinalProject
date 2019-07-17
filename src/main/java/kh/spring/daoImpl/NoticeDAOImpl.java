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

	@Override
	public int selectCountAll() throws Exception
	{
		return sst.selectOne("NoticeDAO.selectCountAll");
	}

	@Override
	public NoticeDTO selectDTO(NoticeDTO dto) throws Exception
	{
		return sst.selectOne("NoticeDAO.selectDTO", dto);
	}

	@Override
	public int viewCountPlus(NoticeDTO dto) throws Exception
	{
		return sst.update("NoticeDAO.viewCountPlus", dto);
	}

	@Override
	public int updateTitleBySeq(NoticeDTO dto) throws Exception
	{
		return sst.update("NoticeDAO.updateTitleBySeq", dto);
	}

	@Override
	public int updateContentsBySeq(NoticeDTO dto) throws Exception
	{
		return sst.update("NoticeDAO.updateContentsBySeq", dto);
	}

	@Override
	public int updateWriteTimeBySeq(NoticeDTO dto) throws Exception
	{
		return sst.update("NoticeDAO.updateWriteTimeBySeq", dto);
	}

	@Override
	public int deleteBySeq(NoticeDTO dto) throws Exception
	{
		return sst.delete("NoticeDAO.deleteBySeq", dto);
	}
	
}
