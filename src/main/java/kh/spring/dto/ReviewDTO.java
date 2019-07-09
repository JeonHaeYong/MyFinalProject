package kh.spring.dto;

import java.sql.Timestamp;

public class ReviewDTO {
	private int seq;
	private String title;
	private String writer;
	private String image_path1;
	private String image_path2;
	private String image_path3;
	private String contents;
	private Timestamp write_date;
	private int view_count;
	private int likes;
	private String type;	// 재회후기 or 분양후기
	
	public ReviewDTO() {}

	public ReviewDTO(int seq, String title, String writer, String image_path1, String image_path2, String image_path3,
			String contents, Timestamp write_date, int view_count, int likes, String type) {
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.image_path1 = image_path1;
		this.image_path2 = image_path2;
		this.image_path3 = image_path3;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
		this.likes = likes;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getImage_path1() {
		return image_path1;
	}

	public void setImage_path1(String image_path1) {
		this.image_path1 = image_path1;
	}

	public String getImage_path2() {
		return image_path2;
	}

	public void setImage_path2(String image_path2) {
		this.image_path2 = image_path2;
	}

	public String getImage_path3() {
		return image_path3;
	}

	public void setImage_path3(String image_path3) {
		this.image_path3 = image_path3;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
