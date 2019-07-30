package kh.spring.dao;

import java.util.HashMap;
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
	public List<MemberDTO> selectByLikeId(String id, int pageStart, int pageEnd);
	public int selectCountByLikeId(String id) throws Exception;
	public List<MemberDTO> memberPoint();//퀴즈에서 씀
	public int insertNaverJoin(MemberDTO dto); //네이버 로그인 시 자동가입으로 사용
	public String findID(String name, String birthday);
	public int updatePw(String id, String pw);
	public MemberDTO selectOneMemberDTO_useMyPageAdvice(String id);
	public int updateMemberInfoByMyPage(MemberDTO dto);
	public int updateImagePath(MemberDTO dto);
	
	public List<MemberDTO> selectRankFiveByPoint(int start, int end) throws Exception;	//관리자 페이지에서 최고점수 5등까지 조회
	public int selectCountRankFiveByPoint() throws Exception;				//관리자 페이지에서 최고점수 5등까지 조회 몇명인지
	public int selectCount() throws Exception;
	public int updatePointRandom(HashMap<String, Integer> param) throws Exception;
	public int doublemail(String email);
	public List<String> selectAllType4();//관리자 id 뽑아오기
}
