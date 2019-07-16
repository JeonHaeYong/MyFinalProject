package kh.spring.dto;

public class CartDTO {
	private int seq;
	private int item_seq;
	private String id;
	
	public CartDTO() {
		super();
	}
	public CartDTO(int seq, int item_seq, String id) {
		super();
		this.seq = seq;
		this.item_seq = item_seq;
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getItem_seq() {
		return item_seq;
	}
	public void setItem_seq(int item_seq) {
		this.item_seq = item_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
