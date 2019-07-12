package kh.spring.daoImpl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
		int result = sst.insert("MemberDAO.insertMember", dto);
		System.out.println(result);
		return result;
	}

	@Override
	public List<MemberDTO> selectByLikeId(String id)
	{
		return sst.selectList("MemberDAO.selectByLikeId", "%"+id+"%");
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

}
