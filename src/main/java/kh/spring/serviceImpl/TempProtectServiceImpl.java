package kh.spring.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TempProtectDAO;
import kh.spring.dto.TempProtectDTO;
import kh.spring.service.TempProtectService;

@Service
public class TempProtectServiceImpl implements TempProtectService{
	@Autowired
	private TempProtectDAO tpdao;

	public int deleteTempProtect(TempProtectDTO dto) {
		int result = tpdao.deleteTempProtect(dto);
		return result;
	}


	public int modifyTempProtect(TempProtectDTO dto) {
		int result = tpdao.modifyTempProtect(dto);
		return result;
	}


	public TempProtectDTO readOneTempProtect(int seq) {
		return tpdao.readOneTempProtect(seq);
	}


	public int writeTempProtect(TempProtectDTO dto) {
		int result = tpdao.writeTempProtect(dto);
		return result;
	}


	public List<TempProtectDTO> selectAllTempProtect(int currentPage) {
		List<TempProtectDTO> list = tpdao.selectAllTempProtect(currentPage);
		return list;
	}


	public Map<String, Integer> getNaviForTempProtect(int currentPage) {
		return tpdao.getNaviForTempProtect(currentPage);
	}

	@Override
	public int tempProtectContentsSize() {
		int result = tpdao.tempProtectContentsSize();
		return result;
	}
}
