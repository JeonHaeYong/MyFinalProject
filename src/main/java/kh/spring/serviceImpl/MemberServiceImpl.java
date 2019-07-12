package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kh.spring.dao.MemberDAO;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mdao;
	

	
	@Override
	public int insertMemberService(MemberDTO dto) {
		dto.setType(1);//일반회원인 경우 type =1
		int result = mdao.insertMember(dto);	
		return result;
	}

	@Override
	public List<MemberDTO> selectAllMembersService() {
		return mdao.selectAllMembers();
	}

	@Override
	public int isLoginOkService(String id, String password) {
		return mdao.isLoginOk(id, password);
	}

	@Override
	public int idDuplCheckService(String id) {
		return mdao.idDuplCheck(id);
	}

	@Override
	public MemberDTO selectOneMemberService(String id) {
		return mdao.selectOneMember(id);
	}

	@Override
	public int modifyMemberService(MemberDTO dto) {
		return mdao.modifyMember(dto);
	}

	@Override
	public int deleteMemberService(String id) {
		return mdao.deleteMember(id);
	}

	@Override
	public List<MemberDTO> selectByLikeId(String id)
	{
		return mdao.selectByLikeId(id);
	}

	//퀴즈에서 씀
	@Override
	public List<MemberDTO> memberPointService() {
		return mdao.memberPoint();
	}

}
