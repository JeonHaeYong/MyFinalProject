package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.TempProtectDTO;

public interface TempProtectDAO {
	public int writeTempProtect(TempProtectDTO dto);
	public List<TempProtectDTO> selectAllTempProtect(int currentPage);
	public TempProtectDTO readOneTempProtect(int seq);
	public int deleteTempProtect(TempProtectDTO dto);
	public int modifyTempProtect(TempProtectDTO dto);
	public int tempProtectContentsSize();
	public Map<String, Integer> getNaviForTempProtect(int currentPage);
}
