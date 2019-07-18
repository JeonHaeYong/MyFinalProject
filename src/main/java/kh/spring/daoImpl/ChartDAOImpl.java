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
	public int insertRandomRecord(int time, int count) throws Exception
	{
		return sst.insert("ChartDAO.insertRandomRecord", new Object[] {time, count});
	}
	
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
	public int getRecentSevenVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getRecentSevenVisitCount");
	}

	@Override
	public int getRecentThirtyVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getRecentThirtyVisitCount");
	}

	@Override
	public int getTotalVisitCount() throws Exception
	{
		return sst.selectOne("ChartDAO.getTotalVisitCount");
	}

	//month 1은 현재월 2는 전달 3은 2달전
	@Override
	public int getMonthVisitCount(int month) throws Exception
	{
		return sst.selectOne("ChartDAO.getMonthVisitCount", month);
	}
	@Override
	public String getMonthVisitTime(int month) throws Exception
	{
		return sst.selectOne("ChartDAO.getMonthVisitTime", month);
	}

	
	
}
