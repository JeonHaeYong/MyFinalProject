package kh.spring.insertDataldto;

public class SeoulDTO {
	private String permission_no;
	private String post;
	private String xcode;
	private String total_employ;
	private String permission_dt;
	private String tel; // 전화번
	private String state;
	private String addr; // 도로명주소
	private String lsind_type;
	private String id;
	private String ycode;
	private String re_open_dt;
	private String addr_old; // 지번주소
	private String suspension_end_dt;
	private String area;
	private String sfrmprd_type;
	private String stop_dt;
	private String suspension_start_dt;
	private String detail_stat_nm;
	private String nm; // 가게이름
	public SeoulDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SeoulDTO(String permission_no, String post, String xcode, String total_employ, String permission_dt,
			String tel, String state, String addr, String lsind_type, String id, String ycode, String re_open_dt,
			String addr_old, String suspension_end_dt, String area, String sfrmprd_type, String stop_dt,
			String suspension_start_dt, String detail_stat_nm, String nm) {
		super();
		this.permission_no = permission_no;
		this.post = post;
		this.xcode = xcode;
		this.total_employ = total_employ;
		this.permission_dt = permission_dt;
		this.tel = tel;
		this.state = state;
		this.addr = addr;
		this.lsind_type = lsind_type;
		this.id = id;
		this.ycode = ycode;
		this.re_open_dt = re_open_dt;
		this.addr_old = addr_old;
		this.suspension_end_dt = suspension_end_dt;
		this.area = area;
		this.sfrmprd_type = sfrmprd_type;
		this.stop_dt = stop_dt;
		this.suspension_start_dt = suspension_start_dt;
		this.detail_stat_nm = detail_stat_nm;
		this.nm = nm;
	}
	public String getPermission_no() {
		return permission_no;
	}
	public void setPermission_no(String permission_no) {
		this.permission_no = permission_no;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getXcode() {
		return xcode;
	}
	public void setXcode(String xcode) {
		this.xcode = xcode;
	}
	public String getTotal_employ() {
		return total_employ;
	}
	public void setTotal_employ(String total_employ) {
		this.total_employ = total_employ;
	}
	public String getPermission_dt() {
		return permission_dt;
	}
	public void setPermission_dt(String permission_dt) {
		this.permission_dt = permission_dt;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getLsind_type() {
		return lsind_type;
	}
	public void setLsind_type(String lsind_type) {
		this.lsind_type = lsind_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYcode() {
		return ycode;
	}
	public void setYcode(String ycode) {
		this.ycode = ycode;
	}
	public String getRe_open_dt() {
		return re_open_dt;
	}
	public void setRe_open_dt(String re_open_dt) {
		this.re_open_dt = re_open_dt;
	}
	public String getAddr_old() {
		return addr_old;
	}
	public void setAddr_old(String addr_old) {
		this.addr_old = addr_old;
	}
	public String getSuspension_end_dt() {
		return suspension_end_dt;
	}
	public void setSuspension_end_dt(String suspension_end_dt) {
		this.suspension_end_dt = suspension_end_dt;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSfrmprd_type() {
		return sfrmprd_type;
	}
	public void setSfrmprd_type(String sfrmprd_type) {
		this.sfrmprd_type = sfrmprd_type;
	}
	public String getStop_dt() {
		return stop_dt;
	}
	public void setStop_dt(String stop_dt) {
		this.stop_dt = stop_dt;
	}
	public String getSuspension_start_dt() {
		return suspension_start_dt;
	}
	public void setSuspension_start_dt(String suspension_start_dt) {
		this.suspension_start_dt = suspension_start_dt;
	}
	public String getDetail_stat_nm() {
		return detail_stat_nm;
	}
	public void setDetail_stat_nm(String detail_stat_nm) {
		this.detail_stat_nm = detail_stat_nm;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
}
