package kh.spring.dao;

import java.util.List;

import kh.spring.dto.MemberDTO;

public interface MemberDAO {
	public int insertMember(MemberDTO dto);
	public List<MemberDTO> selectAllMembers();
	public int isLoginOk(String id, String password);
	public int idDuplCheck(String id);
	public MemberDTO selectOneMember(String id);
	public int modifyMember(MemberDTO dto);
	public int deleteMember(String id);
	public String testSHA256(String str);
	public List<MemberDTO> selectByLikeId(String id);
	public List<MemberDTO> memberPoint();//퀴즈에서 씀
	
}
