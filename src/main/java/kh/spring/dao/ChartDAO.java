package kh.spring.dao;

import java.sql.Connection;

public interface ChartDAO
{
	public Connection getConnection() throws Exception;
	public int selectCountTodayRecord() throws Exception;
	public int insertTodayRecord() throws Exception;
	public int visitCountPlus() throws Exception;
	
	public int getTodayVisitCount() throws Exception;
	public int getWeekVisitCount() throws Exception;
	public int getMonthVisitCount() throws Exception;
	public int getTotalVisitCount() throws Exception;
	
}
