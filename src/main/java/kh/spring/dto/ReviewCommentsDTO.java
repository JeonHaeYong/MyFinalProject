package kh.spring.dto;

import java.sql.Timestamp;

public class ReviewCommentsDTO {
	private int seq;				// 댓글 번호
	private int review_seq;			// 해당 글 번호
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int likes;				// 좋아요
	private int dislike;			// 싫어요
	
	public ReviewCommentsDTO() {}
	public ReviewCommentsDTO(int seq, int review_seq, String writer, String contents, Timestamp write_date, int likes,
			int dislike) {
		this.seq = seq;
		this.review_seq = review_seq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.likes = likes;
		this.dislike = dislike;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getDislike() {
		return dislike;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
}
