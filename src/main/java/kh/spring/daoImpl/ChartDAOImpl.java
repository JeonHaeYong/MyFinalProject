package kh.spring.daoImpl;

import kh.spring.dao.ChartDAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAOImpl implements ChartDAO
{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int selectCountTodayRecord() throws Exception
	{
		return sst.selectOne("ChartDAO.selectCountTodayRecord");
	}

	@Override
	public int insertTodayRecord() throws Exception
	{
		return sst.insert("ChartDAO.insertTodayRecord");
	}

	@Override
	public int visitCountPlus() throws Exception
	{
		return sst.update("ChartDAO.visitCountPlus");
	}

	
	@Override
	public int getTodayVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getTodayVisitCount");
	}

	@Override
	public int getWeekVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getWeekVisitCount");
	}

	@Override
	public int getMonthVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getMonthVisitCount");
	}

	@Override
	public int getTotalVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getTotalVisitCount");
	}

	
	
	
	
	
}
