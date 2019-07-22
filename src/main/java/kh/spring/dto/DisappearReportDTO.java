package kh.spring.dto;

import java.sql.Date;

public class DisappearReportDTO {
	private int seq;
	private Date disDate;
	private String areaList;
	private String disappearArea;
	private String tel;
	private String kind;
	private String gender;
	private String neuter;
	private String age;
	private String furColor;
	private String feature;
	private String et;
	private String image;
	private String writer;
	private String writeDate;
	private String ip;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Date getDisDate() {
		return disDate;
	}
	public void setDisDate(Date disDate) {
		this.disDate = disDate;
	}
	public String getAreaList() {
		return areaList;
	}
	public void setAreaList(String areaList) {
		this.areaList = areaList;
	}
	public String getDisappearArea() {
		return disappearArea;
	}
	public void setDisappearArea(String disappearArea) {
		this.disappearArea = disappearArea;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNeuter() {
		return neuter;
	}
	public void setNeuter(String neuter) {
		this.neuter = neuter;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getFurColor() {
		return furColor;
	}
	public void setFurColor(String furColor) {
		this.furColor = furColor;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getEt() {
		return et;
	}
	public void setEt(String et) {
		this.et = et;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public DisappearReportDTO(int seq, Date disDate, String areaList, String disappearArea, String tel,
			String kind, String gender, String neuter, String age, String furColor, String feature, String et,
			String image, String writer, String writeDate, String ip) {
		super();
		this.seq = seq;
		this.disDate = disDate;
		this.areaList = areaList;
		this.disappearArea = disappearArea;
		this.tel = tel;
		this.kind = kind;
		this.gender = gender;
		this.neuter = neuter;
		this.age = age;
		this.furColor = furColor;
		this.feature = feature;
		this.et = et;
		this.image = image;
		this.writer = writer;
		this.writeDate = writeDate;
		this.ip = ip;
	}
	public DisappearReportDTO() {
		super();
	}
	
	
	

}
