package kh.spring.dto;

import java.sql.Date;

public class InfomaitionDTO {
	private int seq;
	private String type;
	private String title;
	private String contents;
	private String image;
	private String writer;
	private Date writeDate;
	private int rank;
	public InfomaitionDTO(int seq, String type, String title, String contents, String image, String writer,
			Date writeDate, int rank) {
		super();
		this.seq = seq;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.image = image;
		this.writer = writer;
		this.writeDate = writeDate;
		this.rank = rank;
	}
	public InfomaitionDTO() {
		super();
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
	
	
}
