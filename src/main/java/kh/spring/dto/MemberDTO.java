package kh.spring.dto;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String email;
	private String birthDay;
	private String gender;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private int type;
	private int point;
	
	public MemberDTO() {}
	public MemberDTO(String id, String password, String name, String email, String birthDay, String gender,
			String phone, String zipcode, String address1, String address2, int type, int point) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.birthDay = birthDay;
		this.gender = gender;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.type = type;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setMemberAuthKey(String memberAuthKey) {
		
		
	}
	
}
