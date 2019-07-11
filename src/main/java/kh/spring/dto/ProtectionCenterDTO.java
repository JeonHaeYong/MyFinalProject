package kh.spring.dto;

public class ProtectionCenterDTO {
	private int seq;
	private String center;
	private String tel;
	private String address;
	private String workday;
	private String weekday;
	public ProtectionCenterDTO() {
		super();
	}
	public ProtectionCenterDTO(int seq, String center, String tel, String address, String workday, String weekday) {
		super();
		this.seq = seq;
		this.center = center;
		this.tel = tel;
		this.address = address;
		this.workday = workday;
		this.weekday = weekday;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getWorkday() {
		return workday;
	}
	public void setWorkday(String workday) {
		this.workday = workday;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
}
