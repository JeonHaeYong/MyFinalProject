package kh.spring.dto;

public class AnimalHospitalDTO {
	private int seq;
	private String siGun;
	private String title;
	private String address;
	private String tel;
	private int rown;
	
	public AnimalHospitalDTO() {
		super();
	}
	public AnimalHospitalDTO(int seq, String siGun, String title, String address, String tel, int rown) {
		super();
		this.seq = seq;
		this.siGun = siGun;
		this.title = title;
		this.address = address;
		this.tel = tel;
		this.rown = rown;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSiGun() {
		return siGun;
	}
	public void setSiGun(String siGun) {
		this.siGun = siGun;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getRown() {
		return rown;
	}
	public void setRown(int rown) {
		this.rown = rown;
	}
}
