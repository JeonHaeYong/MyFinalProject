package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardListDTO {//마이페이지 게시판목록띄워주기
	private int seq;
	private String title;
	private Timestamp write_date;
	private String type;
	
	private String formed_date;
	
	public BoardListDTO() {
		super();
	}
	public BoardListDTO(int seq, String title, Timestamp write_date, String type) {
		super();
		this.seq = seq;
		this.title = title;
		this.write_date = write_date;
		this.type = type;
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
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getFormed_date() {
		long writeTime = this.write_date.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(writeTime);
	}
	
	
}
