package kh.spring.dto;


public class ACSDTO
{
	private String area;
	private int num;
	
	public ACSDTO()
	{
		super();
	}
	public ACSDTO(String area, int num)
	{
		super();
		this.area = area;
		this.num = num;
	}
	
	public String getArea()
	{
		return area;
	}
	
	public void setArea(String area)
	{
		this.area = area;
	}
	
	public int getNum()
	{
		return num;
	}
	
	public void setNum(int num)
	{
		this.num = num;
	}
	
	
	
	
}
