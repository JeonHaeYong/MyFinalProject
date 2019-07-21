package kh.spring.dto;

import java.sql.Date;

public class BlackListDTO
{
    private int seq;
    private String id;
    private String reason;
    private Date black_date;
	
    public BlackListDTO()
	{
		super();
	}
	public BlackListDTO(String id)
	{
		super();
		this.id = id;
	}
	public BlackListDTO(String id, String reason)
	{
		super();
		this.id = id;
		this.reason = reason;
	}
	public BlackListDTO(int seq, String id, String reason, Date black_date)
	{
		super();
		this.seq = seq;
		this.id = id;
		this.reason = reason;
		this.black_date = black_date;
	}
	
	public int getSeq()
	{
		return seq;
	}
	
	public void setSeq(int seq)
	{
		this.seq = seq;
	}
	
	public String getId()
	{
		return id;
	}
	
	public void setId(String id)
	{
		this.id = id;
	}
	
	public String getReason()
	{
		return reason;
	}
	
	public void setReason(String reason)
	{
		this.reason = reason;
	}
	
	public Date getBlack_date()
	{
		return black_date;
	}
	
	public void setBlack_date(Date black_date)
	{
		this.black_date = black_date;
	}
    
	
    
}
