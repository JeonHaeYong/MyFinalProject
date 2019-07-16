package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.MessageDAO;
import kh.spring.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int selectMsgYetReadCount(String id) {
		return sst.selectOne("MessageDAO.selectMsgYetReadCount", id);
	}

	@Override
	public int insertMsg(MessageDTO dto) {
		return sst.insert("MessageDAO.insertMsg",dto);
	}

	@Override
	public List<MessageDTO> selectAllMsgByCurrentPage(String type , String id, int start, int end) {
		Map<String,String> map = new HashMap<>();
		map.put(type , id);
		map.put("start", start+"");
		map.put("end", end+"");
		return sst.selectList("MessageDAO.selectAllMsgByCurrentPage", map);
	}

	@Override
	public int updateReadOkToYes(String seq) {
		return sst.update("MessageDAO.updateReadOkToYes",seq);
	}
	@Override
	public int getMsgAllCount(String type, String id) {
		Map<String,String> map = new HashMap<>();
		map.put(type , id);
		return sst.selectOne("MessageDAO.getMsgAllCount",map);
	}


}
