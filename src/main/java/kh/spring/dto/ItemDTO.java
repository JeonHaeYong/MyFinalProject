package kh.spring.dto;

import java.sql.Timestamp;

public class ItemDTO {
	private int seq;			// ��ǰ ��ȣ
	private String name;		// ��ǰ �̸�
	private String contents;	// ��ǰ ����
	private String price;
	private String seller;
	private Timestamp write_date;		// �����
	private String permission;	// ������ �㰡 ����
	private String imagePath1;
	private String imagePath2;
	private String imagePath3;
	private String fomredDate;
	private String category;
	
	public ItemDTO() {}

	public ItemDTO(int seq, String name, String contents, String price, String seller, Timestamp write_date,
			String permission, String imagePath1, String imagePath2, String imagePath3, String fomredDate,
			String category) {
		super();
		this.seq = seq;
		this.name = name;
		this.contents = contents;
		this.price = price;
		this.seller = seller;
		this.write_date = write_date;
		this.permission = permission;
		this.imagePath1 = imagePath1;
		this.imagePath2 = imagePath2;
		this.imagePath3 = imagePath3;
		this.fomredDate = fomredDate;
		this.category = category;
	}
	public ItemDTO(int seq, String name, String contents, String price, String seller, Timestamp write_date,
			String permission, String imagePath1, String imagePath2, String imagePath3, String category) {
		super();
		this.seq = seq;
		this.name = name;
		this.contents = contents;
		this.price = price;
		this.seller = seller;
		this.write_date = write_date;
		this.permission = permission;
		this.imagePath1 = imagePath1;
		this.imagePath2 = imagePath2;
		this.imagePath3 = imagePath3;
		this.category = category;
	}
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getImagePath1() {
		return imagePath1;
	}

	public void setImagePath1(String imagePath1) {
		this.imagePath1 = imagePath1;
	}

	public String getImagePath2() {
		return imagePath2;
	}

	public void setImagePath2(String imagePath2) {
		this.imagePath2 = imagePath2;
	}

	public String getImagePath3() {
		return imagePath3;
	}

	public void setImagePath3(String imagePath3) {
		this.imagePath3 = imagePath3;
	}

	public String getFomredDate() {
		return fomredDate;
	}

	public void setFomredDate(String fomredDate) {
		this.fomredDate = fomredDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}
