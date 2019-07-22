package kh.spring.dto;

import java.security.Timestamp;
import java.sql.Date;

public class TrainingDTO {
	private int seq;
	private String title;
	private String contents;
	private String image;
	private String writer;
	private Date writeDate;
	private String ip;
	
	public TrainingDTO() {
		super();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public TrainingDTO(int seq, String title, String contents, String image, String writer, Date writeDate, String ip) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.image = image;
		this.writer = writer;
		this.writeDate = writeDate;
		this.ip = ip;
	}
	
	
}
