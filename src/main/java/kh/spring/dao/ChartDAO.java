package kh.spring.dao;

import java.util.List;

import kh.spring.dto.ACSDTO;

public interface ChartDAO
{
	public int insertRandomRecord(int time, int count, int pay) throws Exception;
	
	public int selectCountTodayRecord() throws Exception;
	public int insertTodayRecord() throws Exception;
	public int visitCountPlus() throws Exception;
	
	public int getTodayVisitCount() throws Exception;
	public int getRecentSevenVisitCount() throws Exception;
	public int getRecentThirtyVisitCount() throws Exception;
	public int getTotalVisitCount() throws Exception;
	
	public int getMonthVisitCount(int month) throws Exception;
	public int getMonthPayAmount(int month) throws Exception;
	public List<String> getMonthVisitTime(int month) throws Exception;
	
	public int updateTodayPayAmount(int money) throws Exception;
	
	public List<ACSDTO> selectACSDTO() throws Exception;
}
