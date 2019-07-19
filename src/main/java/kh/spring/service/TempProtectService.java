package kh.spring.service;

import java.util.List;
import java.util.Map;

import org.w3c.dom.Element;

import kh.spring.dto.TempProtectDTO;

public interface TempProtectService {
	public int writeTempProtect(TempProtectDTO dto);
	public List<TempProtectDTO> selectAllTempProtect(int currentPage);
	public TempProtectDTO readOneTempProtect(int seq);
	public int deleteTempProtect(TempProtectDTO dto);
	public int modifyTempProtect(TempProtectDTO dto);
	public int tempProtectContentsSize();
	public Map<String, Integer> getNaviForTempProtect(int currentPage);
	public String getTagValue(String tag, Element eElement) throws Exception;
	public String ShelterAJAX(String sidoCd, String sigunguCd) throws Exception;
}
