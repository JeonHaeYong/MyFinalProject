
package kh.spring.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class TempProtectDTO {
	private int seq;
	private String title;
	private String writer;
	private Date lostDate;
	private String siDo;
	private String siGunGu;
	private String place;
	private String type;
	private String sex;
	private String color;
	private String age;
	private String feat;
	private String imagePath;
	private String email;
	private String phone;
	private Timestamp writeTime;
	
	public TempProtectDTO() {}
	public TempProtectDTO(int seq, String title, String writer, Date lostDate, String siDo, String siGunGu,
			String place, String type, String sex, String color, String age, String feat, String imagePath,
			String email, String phone, Timestamp writeTime) {
		super();
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.lostDate = lostDate;
		this.siDo = siDo;
		this.siGunGu = siGunGu;
		this.place = place;
		this.type = type;
		this.sex = sex;
		this.color = color;
		this.age = age;
		this.feat = feat;
		this.imagePath = imagePath;
		this.email = email;
		this.phone = phone;
		this.writeTime = writeTime;
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
	public Date getLostDate() {
		return lostDate;
	}
	public void setLostDate(Date lostDate) {
		this.lostDate = lostDate;
	}
	public String getSiDo() {
		return siDo;
	}
	public void setSiDo(String siDo) {
		this.siDo = siDo;
	}
	public String getSiGunGu() {
		return siGunGu;
	}
	public void setSiGunGu(String siGunGu) {
		this.siGunGu = siGunGu;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getFeat() {
		return feat;
	}
	public void setFeat(String feat) {
		this.feat = feat;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(Timestamp writeTime) {
		this.writeTime = writeTime;
	}	
}
