package kh.spring.daoImpl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private HttpSession session;
	@Override
	public int insertMember(MemberDTO dto) {
		dto.setPassword(this.testSHA256(dto.getPassword()));
		
		return  sst.insert("MemberDAO.insertMember", dto);
	}
//네이버 회원가입
	@Override
	public int insertNaverJoin(MemberDTO dto) {
		long time = System.currentTimeMillis(); //현재시간값으로 비밀번호 임의로 설정 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String str = dayTime.format(new Date(time));
		dto.setPassword(this.testSHA256(str));
		return  sst.insert("MemberDAO.insertNaverJoin", dto);
	}
	
	@Override
	public List<MemberDTO> selectByLikeId(String id, int pageStart, int pageEnd)
	{
		return sst.selectList("MemberDAO.selectByLikeId", new Object[] {"%"+id+"%", pageStart, pageEnd});
	}
	@Override
	public int selectCountByLikeId(String id) throws Exception
	{
		return sst.selectOne("MemberDAO.selectCountByLikeId","%"+id+"%");
	}
	//관리자 페이지에서 조회용
	@Override
	public List<MemberDTO> selectRankFiveByPoint(int start, int end) throws Exception
	{
		return sst.selectList("MemberDAO.selectRankFiveByPoint", new Object[] {start, end});
	}
	@Override
	public int selectCountRankFiveByPoint() throws Exception
	{
		return sst.selectOne("MemberDAO.selectCountRankFiveByPoint");
	}
	@Override
	public int selectCount() throws Exception
	{
		return sst.selectOne("MemberDAO.selectCount");
	}
	@Override
	public int updatePointRandom(HashMap<String, Integer> param) throws Exception
	{
		return sst.update("MemberDAO.updatePointRandom", param);
	}
	
	@Override
	public List<MemberDTO> selectAllMembers() {
		return sst.selectList("MemberDAO.selectAllMembers");
	}

	@Override
	public int isLoginOk(String id, String password) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("password", this.testSHA256(password));
		return sst.selectOne("MemberDAO.isLoginOk", param);
	}

	@Override
	public int idDuplCheck(String id) {
		return sst.selectOne("MemberDAO.idDuplCheck", id);
	}
	
	@Override
	public int doublemail(String email) {
	System.out.println(email);
		return sst.selectOne("MemberDAO.doublemail", email);
	}
	
	@Override
	public MemberDTO selectOneMember(String id) {
		return sst.selectOne("MemberDAO.selectOneMember", id);
	}

	@Override
	public int modifyMember(MemberDTO dto) {
		return sst.update("MemberDAO.modifyMember", dto);
	}

	@Override
	public int deleteMember(String id) {
		return sst.delete("MemberDAO.deleteMember", id);
	}
	@Override
	public int updatePw(String id, String pw) {
		Map<String,String> hs = new HashMap<>();
		String password = this.testSHA256(pw);
		hs.put("id", id);
		hs.put("pw", password);
		return sst.update("MemberDAO.updatePw",hs);
	}

	@Override
	public String testSHA256(String str){
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}
	//퀴즈에서 씀!!
	@Override
	public List<MemberDTO> memberPoint() {
		return sst.selectList("MemberDAO.memberPoint");
	}
	
//아이디 찾기 
	@Override
	public String findID(String name,String birthday) {
		Map<String,String>map=new HashMap<>();
		map.put("birthday",birthday);
		map.put("name", name);
		return sst.selectOne("MemberDAO.idFind",map);
	}
	//로그인id 의 member정보 null은 미설정으로 나오도록 하기.
	@Override
	public MemberDTO selectOneMemberDTO_useMyPageAdvice(String id) {
		return sst.selectOne("MemberDAO.selectOneMemberDTO_useMyPageAdvice",id);
	}
	
	//mypage에서 정보수정시, 입력한 정보에 맞게 update해주기.
	@Override
	public int updateMemberInfoByMyPage(MemberDTO dto) {
		return sst.update("MemberDAO.updateMemberInfoByMyPage",dto);
	}
	@Override
	public int updateImagePath(MemberDTO dto) {
		return sst.update("MemberDAO.updateImagePath",dto);
	}

	
}
