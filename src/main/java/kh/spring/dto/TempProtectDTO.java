
package kh.spring.dto;


import java.sql.Timestamp;
import java.util.Date;

public class TempProtectDTO {
	private int seq;
	private String title;
	private Date findDate;
	private String sido;
	private String sigungu;
	private String place;
	private String type;
	private String sex;
	private String color;
	private String feat;
	private String imagePath;
	private String phone;
	private String writer;
	private Timestamp writeTime;
	public TempProtectDTO() {
		super();
	}
	public TempProtectDTO(int seq, String title, Date findDate, String sido, String sigungu, String place, String type,
			String sex, String color, String feat, String imagePath, String phone, String writer, Timestamp writeTime) {
		super();
		this.seq = seq;
		this.title = title;
		this.findDate = findDate;
		this.sido = sido;
		this.sigungu = sigungu;
		this.place = place;
		this.type = type;
		this.sex = sex;
		this.color = color;
		this.feat = feat;
		this.imagePath = imagePath;
		this.phone = phone;
		this.writer = writer;
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
	public Date getFindDate() {
		return findDate;
	}
	public void setFindDate(Date findDate) {
		this.findDate = findDate;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(Timestamp writeTime) {
		this.writeTime = writeTime;
	}

	


}
