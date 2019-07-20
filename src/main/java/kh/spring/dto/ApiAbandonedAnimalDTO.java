package kh.spring.dto;

import java.util.Date;

public class ApiAbandonedAnimalDTO {
	private int seq;
	private Date noticeEdt;			// ���� ������
	private String popfile;			// ���� �̹���
	private String processState;	// �Ծ� ����
	private String sexCd;
	private String neuterYn;		// �߼�ȭ ����
	private String specialMark;		// Ư¡
	private String careNm;			// ��ȣ�� �̸�
	private String careTel;			// ��ȣ�� ��ȭ��ȣ
	private String careAddr;		// ��ȣ ���
	private String orgNm;			// ���� ���
	private String chargeNm;		// �����
	private String officetel;		// ����� ����ó
	private String noticeComment;	// Ư�̻���
	private String desertionNo;		// ���� ��ȣ
	private String filename;		// ����� �̹���
	private Date happenDt;			// ������
	private String happenPlace;		// �߰� ���
	private String kindCd;			// ǰ��
	private String colorCd;			
	private String age;
	private String weight;
	private String noticeNo;		// ���� ��ȣ
	private Date noticeSdt;			// ���� ������
	
	public ApiAbandonedAnimalDTO() {}
	public ApiAbandonedAnimalDTO(int seq, Date noticeEdt, String popfile, String processState, String sexCd,
			String neuterYn, String specialMark, String careNm, String careTel, String careAddr, String orgNm,
			String chargeNm, String officetel, String noticeComment, String desertionNo, String filename,
			Date happenDt, String happenPlace, String kindCd, String colorCd, String age, String weight, String noticeNo,
			Date noticeSdt) {
		this.seq = seq;
		this.noticeEdt = noticeEdt;
		this.popfile = popfile;
		this.processState = processState;
		this.sexCd = sexCd;
		this.neuterYn = neuterYn;
		this.specialMark = specialMark;
		this.careNm = careNm;
		this.careTel = careTel;
		this.careAddr = careAddr;
		this.orgNm = orgNm;
		this.chargeNm = chargeNm;
		this.officetel = officetel;
		this.noticeComment = noticeComment;
		this.desertionNo = desertionNo;
		this.filename = filename;
		this.happenDt = happenDt;
		this.happenPlace = happenPlace;
		this.kindCd = kindCd;
		this.colorCd = colorCd;
		this.age = age;
		this.weight = weight;
		this.noticeNo = noticeNo;
		this.noticeSdt = noticeSdt;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Date getNoticeEdt() {
		return noticeEdt;
	}
	public void setNoticeEdt(Date noticeEdt) {
		this.noticeEdt = noticeEdt;
	}
	public String getPopfile() {
		return popfile;
	}
	public void setPopfile(String popfile) {
		this.popfile = popfile;
	}
	public String getProcessState() {
		return processState;
	}
	public void setProcessState(String processState) {
		this.processState = processState;
	}
	public String getSexCd() {
		return sexCd;
	}
	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}
	public String getNeuterYn() {
		return neuterYn;
	}
	public void setNeuterYn(String neuterYn) {
		this.neuterYn = neuterYn;
	}
	public String getSpecialMark() {
		return specialMark;
	}
	public void setSpecialMark(String specialMark) {
		this.specialMark = specialMark;
	}
	public String getCareNm() {
		return careNm;
	}
	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}
	public String getCareTel() {
		return careTel;
	}
	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}
	public String getCareAddr() {
		return careAddr;
	}
	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}
	public String getOrgNm() {
		return orgNm;
	}
	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}
	public String getChargeNm() {
		return chargeNm;
	}
	public void setChargeNm(String chargeNm) {
		this.chargeNm = chargeNm;
	}
	public String getOfficetel() {
		return officetel;
	}
	public void setOfficetel(String officetel) {
		this.officetel = officetel;
	}
	public String getNoticeComment() {
		return noticeComment;
	}
	public void setNoticeComment(String noticeComment) {
		this.noticeComment = noticeComment;
	}
	public String getDesertionNo() {
		return desertionNo;
	}
	public void setDesertionNo(String desertionNo) {
		this.desertionNo = desertionNo;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getHappenDt() {
		return happenDt;
	}
	public void setHappenDt(Date happenDt) {
		this.happenDt = happenDt;
	}
	public String getHappenPlace() {
		return happenPlace;
	}
	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}
	public String getKindCd() {
		return kindCd;
	}
	public void setKindCd(String kindCd) {
		this.kindCd = kindCd;
	}
	public String getColorCd() {
		return colorCd;
	}
	public void setColorCd(String colorCd) {
		this.colorCd = colorCd;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public Date getNoticeSdt() {
		return noticeSdt;
	}
	public void setNoticeSdt(Date noticeSdt) {
		this.noticeSdt = noticeSdt;
	}
}
