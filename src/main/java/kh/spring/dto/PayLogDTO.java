
package kh.spring.dto;

import java.sql.Timestamp;

public class PayLogDTO
{
	
	private int seq;
	private String buyer;
	private String name;
	private int price;
	private String seller;
	private Timestamp time;
	
	public PayLogDTO()
	{
		super();
	}
	public PayLogDTO(int seq, String buyer, String name, int price, String seller, Timestamp time)
	{
		super();
		this.seq = seq;
		this.buyer = buyer;
		this.name = name;
		this.price = price;
		this.seller = seller;
		this.time = time;
	}
	
	public int getSeq()
	{
		return seq;
	}
	
	public void setSeq(int seq)
	{
		this.seq = seq;
	}
	
	public String getBuyer()
	{
		return buyer;
	}
	
	public void setBuyer(String buyer)
	{
		this.buyer = buyer;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public int getPrice()
	{
		return price;
	}
	
	public void setPrice(int price)
	{
		this.price = price;
	}
	
	public String getSeller()
	{
		return seller;
	}
	
	public void setSeller(String seller)
	{
		this.seller = seller;
	}
	
	public Timestamp getTime()
	{
		return time;
	}
	
	public void setTime(Timestamp time)
	{
		this.time = time;
	}
	
	
	
}
