package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDAO mdao;
	
	@Override
	public int insertMemberService(MemberDTO dto) {
		return mdao.insertMember(dto);
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

}