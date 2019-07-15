package kh.spring.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.MessageDAO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int selectMsgYetReadCount(String id) {
		return sst.selectOne("MessageDAO.selectMsgYetReadCount", id);
	}

}
