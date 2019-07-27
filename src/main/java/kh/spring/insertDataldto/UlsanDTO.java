package kh.spring.insertDataldto;

public class UlsanDTO {
	private String title;
	private String entId;
	private String address;
	private String gugun;
	private String tel;
	private String appDate;
	public UlsanDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UlsanDTO(String title, String entId, String address, String gugun, String tel, String appDate) {
		super();
		this.title = title;
		this.entId = entId;
		this.address = address;
		this.gugun = gugun;
		this.tel = tel;
		this.appDate = appDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEntId() {
		return entId;
	}
	public void setEntId(String entId) {
		this.entId = entId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAppDate() {
		return appDate;
	}
	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}
}
