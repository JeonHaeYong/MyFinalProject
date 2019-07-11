package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertMember(MemberDTO dto) {
		return sst.insert("MemberDAO.insertMember", dto);
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
		param.put("password", password);
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
}
