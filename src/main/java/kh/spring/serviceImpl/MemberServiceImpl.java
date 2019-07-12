package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kh.spring.dao.MemberDAO;
import kh.spring.daoImpl.BlackListDAOImpl;
import kh.spring.dto.BlackListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mdao;
	@Autowired
	private BlackListDAOImpl bdao;

	
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
	public int isLoginOkService(String id, String password){
		try
		{
			if(bdao.selectCountById(new BlackListDTO(id)) == 1)
			{
				return 0;
			}
			else
			{
				return mdao.isLoginOk(id, password);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
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

}
