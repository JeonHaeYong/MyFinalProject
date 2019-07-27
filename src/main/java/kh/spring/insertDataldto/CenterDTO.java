package kh.spring.insertDataldto;

public class CenterDTO {
	private String pageNo;
	private String numOfRows;
	private String type;
	private String animalCnterNm; // 보호센터 이름
	private String institutionNm;
	private String animalCnterType;
	private String rescueAnimal; // 구조대상 동물
	private String rdnmadr; // 도로명주소
	private String lnmadr; 	// 지번주소
	private String hardness;
	private String animalCnterAppnDate;
	private String weekdayOperOpenHhmm;	//평일 운영 시작시간
	private String weekdayOperColseHhmm;//평일 운영 종료시간	 
	private String weekdayLttotBeginHhmm;
	private String weekdayLttotEndHhmm;
	private String wkendOperOpenHhmm;//주말 운영 시작시간
	private String wkendOperCloseHhmm;//주말운영종료시간
	private String wkendLttotOpenHhmm;
	private String wkendLttotCloseHhmm;
	private String rstde;
	private String vtrinrnCo;
	private String asstnCo;
	private String officeRoomCo;
	private String brdRoomCo;
	private String islRoomCo;
	private String feedRoomCo;
	private String rescueVhcleCo;	
	private String phoneNumber;	//전화번호
	private String referenceDate;	
	private String insttCode;
	private String insttNm;
	public CenterDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CenterDTO(String pageNo, String numOfRows, String type, String animalCnterNm, String institutionNm,
			String animalCnterType, String rescueAnimal, String rdnmadr, String lnmadr, String hardness,
			String animalCnterAppnDate, String weekdayOperOpenHhmm, String weekdayOperColseHhmm,
			String weekdayLttotBeginHhmm, String weekdayLttotEndHhmm, String wkendOperOpenHhmm,
			String wkendOperCloseHhmm, String wkendLttotOpenHhmm, String wkendLttotCloseHhmm, String rstde,
			String vtrinrnCo, String asstnCo, String officeRoomCo, String brdRoomCo, String islRoomCo,
			String feedRoomCo, String rescueVhcleCo, String phoneNumber, String referenceDate, String insttCode,
			String insttNm) {
		super();
		this.pageNo = pageNo;
		this.numOfRows = numOfRows;
		this.type = type;
		this.animalCnterNm = animalCnterNm;
		this.institutionNm = institutionNm;
		this.animalCnterType = animalCnterType;
		this.rescueAnimal = rescueAnimal;
		this.rdnmadr = rdnmadr;
		this.lnmadr = lnmadr;
		this.hardness = hardness;
		this.animalCnterAppnDate = animalCnterAppnDate;
		this.weekdayOperOpenHhmm = weekdayOperOpenHhmm;
		this.weekdayOperColseHhmm = weekdayOperColseHhmm;
		this.weekdayLttotBeginHhmm = weekdayLttotBeginHhmm;
		this.weekdayLttotEndHhmm = weekdayLttotEndHhmm;
		this.wkendOperOpenHhmm = wkendOperOpenHhmm;
		this.wkendOperCloseHhmm = wkendOperCloseHhmm;
		this.wkendLttotOpenHhmm = wkendLttotOpenHhmm;
		this.wkendLttotCloseHhmm = wkendLttotCloseHhmm;
		this.rstde = rstde;
		this.vtrinrnCo = vtrinrnCo;
		this.asstnCo = asstnCo;
		this.officeRoomCo = officeRoomCo;
		this.brdRoomCo = brdRoomCo;
		this.islRoomCo = islRoomCo;
		this.feedRoomCo = feedRoomCo;
		this.rescueVhcleCo = rescueVhcleCo;
		this.phoneNumber = phoneNumber;
		this.referenceDate = referenceDate;
		this.insttCode = insttCode;
		this.insttNm = insttNm;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAnimalCnterNm() {
		return animalCnterNm;
	}
	public void setAnimalCnterNm(String animalCnterNm) {
		this.animalCnterNm = animalCnterNm;
	}
	public String getInstitutionNm() {
		return institutionNm;
	}
	public void setInstitutionNm(String institutionNm) {
		this.institutionNm = institutionNm;
	}
	public String getAnimalCnterType() {
		return animalCnterType;
	}
	public void setAnimalCnterType(String animalCnterType) {
		this.animalCnterType = animalCnterType;
	}
	public String getRescueAnimal() {
		return rescueAnimal;
	}
	public void setRescueAnimal(String rescueAnimal) {
		this.rescueAnimal = rescueAnimal;
	}
	public String getRdnmadr() {
		return rdnmadr;
	}
	public void setRdnmadr(String rdnmadr) {
		this.rdnmadr = rdnmadr;
	}
	public String getLnmadr() {
		return lnmadr;
	}
	public void setLnmadr(String lnmadr) {
		this.lnmadr = lnmadr;
	}
	public String getHardness() {
		return hardness;
	}
	public void setHardness(String hardness) {
		this.hardness = hardness;
	}
	public String getAnimalCnterAppnDate() {
		return animalCnterAppnDate;
	}
	public void setAnimalCnterAppnDate(String animalCnterAppnDate) {
		this.animalCnterAppnDate = animalCnterAppnDate;
	}
	public String getWeekdayOperOpenHhmm() {
		return weekdayOperOpenHhmm;
	}
	public void setWeekdayOperOpenHhmm(String weekdayOperOpenHhmm) {
		this.weekdayOperOpenHhmm = weekdayOperOpenHhmm;
	}
	public String getWeekdayOperColseHhmm() {
		return weekdayOperColseHhmm;
	}
	public void setWeekdayOperColseHhmm(String weekdayOperColseHhmm) {
		this.weekdayOperColseHhmm = weekdayOperColseHhmm;
	}
	public String getWeekdayLttotBeginHhmm() {
		return weekdayLttotBeginHhmm;
	}
	public void setWeekdayLttotBeginHhmm(String weekdayLttotBeginHhmm) {
		this.weekdayLttotBeginHhmm = weekdayLttotBeginHhmm;
	}
	public String getWeekdayLttotEndHhmm() {
		return weekdayLttotEndHhmm;
	}
	public void setWeekdayLttotEndHhmm(String weekdayLttotEndHhmm) {
		this.weekdayLttotEndHhmm = weekdayLttotEndHhmm;
	}
	public String getWkendOperOpenHhmm() {
		return wkendOperOpenHhmm;
	}
	public void setWkendOperOpenHhmm(String wkendOperOpenHhmm) {
		this.wkendOperOpenHhmm = wkendOperOpenHhmm;
	}
	public String getWkendOperCloseHhmm() {
		return wkendOperCloseHhmm;
	}
	public void setWkendOperCloseHhmm(String wkendOperCloseHhmm) {
		this.wkendOperCloseHhmm = wkendOperCloseHhmm;
	}
	public String getWkendLttotOpenHhmm() {
		return wkendLttotOpenHhmm;
	}
	public void setWkendLttotOpenHhmm(String wkendLttotOpenHhmm) {
		this.wkendLttotOpenHhmm = wkendLttotOpenHhmm;
	}
	public String getWkendLttotCloseHhmm() {
		return wkendLttotCloseHhmm;
	}
	public void setWkendLttotCloseHhmm(String wkendLttotCloseHhmm) {
		this.wkendLttotCloseHhmm = wkendLttotCloseHhmm;
	}
	public String getRstde() {
		return rstde;
	}
	public void setRstde(String rstde) {
		this.rstde = rstde;
	}
	public String getVtrinrnCo() {
		return vtrinrnCo;
	}
	public void setVtrinrnCo(String vtrinrnCo) {
		this.vtrinrnCo = vtrinrnCo;
	}
	public String getAsstnCo() {
		return asstnCo;
	}
	public void setAsstnCo(String asstnCo) {
		this.asstnCo = asstnCo;
	}
	public String getOfficeRoomCo() {
		return officeRoomCo;
	}
	public void setOfficeRoomCo(String officeRoomCo) {
		this.officeRoomCo = officeRoomCo;
	}
	public String getBrdRoomCo() {
		return brdRoomCo;
	}
	public void setBrdRoomCo(String brdRoomCo) {
		this.brdRoomCo = brdRoomCo;
	}
	public String getIslRoomCo() {
		return islRoomCo;
	}
	public void setIslRoomCo(String islRoomCo) {
		this.islRoomCo = islRoomCo;
	}
	public String getFeedRoomCo() {
		return feedRoomCo;
	}
	public void setFeedRoomCo(String feedRoomCo) {
		this.feedRoomCo = feedRoomCo;
	}
	public String getRescueVhcleCo() {
		return rescueVhcleCo;
	}
	public void setRescueVhcleCo(String rescueVhcleCo) {
		this.rescueVhcleCo = rescueVhcleCo;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getReferenceDate() {
		return referenceDate;
	}
	public void setReferenceDate(String referenceDate) {
		this.referenceDate = referenceDate;
	}
	public String getInsttCode() {
		return insttCode;
	}
	public void setInsttCode(String insttCode) {
		this.insttCode = insttCode;
	}
	public String getInsttNm() {
		return insttNm;
	}
	public void setInsttNm(String insttNm) {
		this.insttNm = insttNm;
	}
}
