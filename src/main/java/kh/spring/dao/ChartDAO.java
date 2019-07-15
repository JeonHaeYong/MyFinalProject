package kh.spring.dao;

public interface ChartDAO
{
	public int insertRandomRecord(int time, int count) throws Exception;
	
	public int selectCountTodayRecord() throws Exception;
	public int insertTodayRecord() throws Exception;
	public int visitCountPlus() throws Exception;
	
	public int getTodayVisitCount() throws Exception;
	public int getRecentSevenVisitCount() throws Exception;
	public int getRecentThirtyVisitCount() throws Exception;
	public int getTotalVisitCount() throws Exception;
	
	public int getMonthVisitCount(int month) throws Exception;
	public String getMonthVisitTime(int month) throws Exception;
}
