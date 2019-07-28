package kh.spring.daoImpl;

import kh.spring.dao.ChartDAO;
import kh.spring.dto.ACSDTO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAOImpl implements ChartDAO
{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int insertRandomRecord(int time, int count, int pay) throws Exception
	{
		return sst.insert("ChartDAO.insertRandomRecord", new Object[] {time, count, pay});
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
	public List<String> getMonthVisitTime(int month) throws Exception
	{
		return sst.selectList("ChartDAO.getMonthVisitTime", month);
	}

	@Override
	public int getMonthPayAmount(int month) throws Exception
	{
		return sst.selectOne("ChartDAO.getMonthPayAmount", month);
	}

	@Override
	public int updateTodayPayAmount(int money) throws Exception
	{
		return sst.update("ChartDAO.updateTodayPayAmount", money);
	}

	@Override
	public List<ACSDTO> selectACSDTO() throws Exception
	{
		return sst.selectList("ChartDAO.selectACSDTO");
	}

	
	
}
