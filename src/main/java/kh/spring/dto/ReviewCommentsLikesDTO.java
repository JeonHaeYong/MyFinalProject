package kh.spring.dto;

public class ReviewCommentsLikesDTO {
	private int seq;
	private int r_comments_seq; 
    private String id;
    
	public ReviewCommentsLikesDTO() {
		super();
	}

	public ReviewCommentsLikesDTO(int seq, int r_comments_seq, String id) {
		super();
		this.seq = seq;
		this.r_comments_seq = r_comments_seq;
		this.id = id;
	}
    
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getR_comments_seq() {
		return r_comments_seq;
	}

	public void setR_comments_seq(int r_comments_seq) {
		this.r_comments_seq = r_comments_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
