package kh.spring.dto;

import java.sql.Date;

public class NoticeDTO
{
	private int seq;
	private String title;
	private String contents;
	private Date write_time;
	private int view_count;
	
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
	public NoticeDTO(int seq, String title, String contents, Date write_time, int view_count)
	{
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.write_time = write_time;
		this.view_count = view_count;
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
	
	public int getView_count()
	{
		return view_count;
	}
	
	public void setView_count(int view_count)
	{
		this.view_count = view_count;
	}
	
	
}
