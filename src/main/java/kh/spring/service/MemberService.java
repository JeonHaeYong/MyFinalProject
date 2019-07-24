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
	public List<MemberDTO> selectByLikeId(String id, String page);
	public int selectCountByLikeId(String id) throws Exception;
	public List<MemberDTO> memberPointService();//퀴즈에서 씀
	public boolean create(String email);
	public boolean newPw(String email);
	public int insertNaverJoin(MemberDTO dto);
	public String FindId(String idname, String birthday); //이름으로 아이디 찾기 
	public boolean FindIdbyemail(String email, String id);//이메일로 아이디 보내기
	public int updatePwService(String id, String pw);
	public MemberDTO selectOneMemberDTO_useMyPageAdvice(String id);//myPage 이동시에 info보내주기.->nvl(null가능컬럼, (미설정))
	public int updateMemberInfoByMyPage(MemberDTO dto);//mypage에서 정보수정하기.
	public int updateImagePath(MemberDTO dto);
	
	public Object selectRankFiveByPoint(String page) throws Exception;	//관리자 페이지에서 최고점수 5등까지 조회
	public Object updateRandomPoint() throws Exception;
}
