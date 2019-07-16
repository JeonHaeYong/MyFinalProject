package kh.spring.dto;

import java.sql.Date;

public class NoticeDTO
{
	private int seq;
	private String title;
	private String contents;
	private Date write_time;
	
	public NoticeDTO()
	{
		super();
	}
	public NoticeDTO(String title, String contents)
	{
		super();
		this.title = title;
		this.contents = contents;
	}
	public NoticeDTO(int seq, String title, String contents, Date write_time)
	{
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.write_time = write_time;
	}
	
	public int getSeq()
	{
		return seq;
	}
	
	public void setSeq(int seq)
	{
		this.seq = seq;
	}
	
	public String getTitle()
	{
		return title;
	}
	
	public void setTitle(String title)
	{
		this.title = title;
	}
	
	public String getContents()
	{
		return contents;
	}
	
	public void setContents(String contents)
	{
		this.contents = contents;
	}
	
	public Date getWrite_time()
	{
		return write_time;
	}
	
	public void setWrite_time(Date write_time)
	{
		this.write_time = write_time;
	}
	
	
}
