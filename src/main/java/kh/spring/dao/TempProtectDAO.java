package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.TempProtectDTO;

public interface TempProtectDAO {
	public int uploadTempProtect(TempProtectDTO dto);
	public List<TempProtectDTO> selectAllTempProtect(int currentPage);
	public TempProtectDTO selectOneTempProtect(int seq);
	public int deleteTempProtect(int seq);
	public int modifyTempProtect(TempProtectDTO dto);
	public int tempProtectContentsSize();
	public Map<String, Integer> getNaviForTempProtect(int currentPage);
	public int updateWithdrawalBywriter (String id);//writer 가 탈퇴했을때
}
