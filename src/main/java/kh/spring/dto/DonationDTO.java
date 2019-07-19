
package kh.spring.dto;

import java.sql.Date;

public class DonationDTO
{
	
	private int seq;
	private String name;
	private String title;
	private String explanation;
	private String image1;
	private String image2;
	private String image3;
	private int goalmoney;
	private int currentmoney;
	private Date startdate;
	private Date enddate;
	
	public DonationDTO()
	{
		super();
	}
	public DonationDTO(int seq, String name, String title, String explanation, String image1, String image2, String image3, int goalmoney, int currentmoney, Date startdate, Date enddate)
	{
		super();
		this.seq = seq;
		this.name = name;
		this.title = title;
		this.explanation = explanation;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.goalmoney = goalmoney;
		this.currentmoney = currentmoney;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	
	public int getSeq()
	{
		return seq;
	}
	
	public void setSeq(int seq)
	{
		this.seq = seq;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getTitle()
	{
		return title;
	}
	
	public void setTitle(String title)
	{
		this.title = title;
	}
	
	public String getExplanation()
	{
		return explanation;
	}
	
	public void setExplanation(String explanation)
	{
		this.explanation = explanation;
	}
	
	public String getImage1()
	{
		return image1;
	}
	
	public void setImage1(String image1)
	{
		this.image1 = image1;
	}
	
	public String getImage2()
	{
		return image2;
	}
	
	public void setImage2(String image2)
	{
		this.image2 = image2;
	}
	
	public String getImage3()
	{
		return image3;
	}
	
	public void setImage3(String image3)
	{
		this.image3 = image3;
	}
	
	public int getGoalmoney()
	{
		return goalmoney;
	}
	
	public void setGoalmoney(int goalmoney)
	{
		this.goalmoney = goalmoney;
	}
	
	public int getCurrentmoney()
	{
		return currentmoney;
	}
	
	public void setCurrentmoney(int currentmoney)
	{
		this.currentmoney = currentmoney;
	}
	
	public Date getStartdate()
	{
		return startdate;
	}
	
	public void setStartdate(Date startdate)
	{
		this.startdate = startdate;
	}
	
	public Date getEnddate()
	{
		return enddate;
	}
	
	public void setEnddate(Date enddate)
	{
		this.enddate = enddate;
	}
	
	
}
