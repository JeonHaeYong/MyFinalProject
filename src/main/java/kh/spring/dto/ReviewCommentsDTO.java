package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReviewCommentsDTO {
	private int seq;				// ��� ��ȣ
	private int review_seq;			// �ش� �� ��ȣ
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int likes;				// ���ƿ�
	private int dislike;			// �Ⱦ��
	
	private String likeOk; //조회하는 사람이 좋아요 했는지..
	
	private String formed_date; //시간이용해, 얼마전에 작성했는지... 띄워주기.
	
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
		if(write_date!=null) {
			this.formed_date = this.getFormedTime();
		}
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
	
	public String getFormed_date() {
		return this.getFormedTime();
	}
	
	public String getLikeOk() {
		return likeOk;
	}
	public void setLikeOk(String likeOk) {
		this.likeOk = likeOk;
	}
	/**
	 * 게시글 작성 시간 세밀하게 표시하기
	 * @return
	 */
	public String getFormedTime() {
		long currentTime = System.currentTimeMillis();
		long writeTime = this.write_date.getTime();
		
		if(currentTime - writeTime <= (1000*60)) { //초단위
			long time = currentTime - writeTime;
			return time/1000 + " 초 전";
		}else if(currentTime - writeTime < (1000* 60 * 60)) { //분단위
			long time = currentTime - writeTime;
			return time/1000/60 + " 분 전";
		}else if(currentTime - writeTime < (1000* 60 * 60* 24)) { //시간 단위
			long time = currentTime - writeTime;
			return time/1000/60/60+ " 시간 전";
		}else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm"); //24시간 이상되면
			return sdf.format(writeTime);
		}
	}
}
