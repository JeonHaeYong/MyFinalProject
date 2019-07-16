package kh.spring.service;

import java.util.List;

import kh.spring.dto.MemberDTO;

public interface MemberService {
	public int insertMemberService(MemberDTO dto);
	public List<MemberDTO> selectAllMembersService();
	public int isLoginOkService(String id, String password); 
	public int idDuplCheckService(String id);
	public MemberDTO selectOneMemberService(String id);
	public int modifyMemberService(MemberDTO dto);
	public int deleteMemberService(String id);
	public List<MemberDTO> selectByLikeId(String id);
	public List<MemberDTO> memberPointService();//퀴즈에서 씀
	public boolean create(String email);
	public int insertNaverJoin(MemberDTO dto);
}
