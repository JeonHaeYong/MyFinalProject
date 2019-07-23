package kh.spring.service;


public interface ChartService
{
	public String getVisitCount() throws Exception;
	public String insertRandomRecord() throws Exception;
	public int updateTodayPayAmount(int money) throws Exception;
}
