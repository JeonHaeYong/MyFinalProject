package kh.spring.dao;


public interface ChartDAO
{
	public int getTodayVisitCount() throws Exception;
	public int getWeekVisitCount() throws Exception;
	public int getMonthVisitCount() throws Exception;
	public int getTotalVisitCount() throws Exception;
	public int visitCountPlus() throws Exception;
}
