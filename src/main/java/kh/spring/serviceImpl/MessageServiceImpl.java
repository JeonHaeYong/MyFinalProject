package kh.spring.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MessageDAO;
import kh.spring.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDAO dao;
	
	@Override
	public int selectMsgYetReadCount(String id) {
		return dao.selectMsgYetReadCount(id);
	}
	
}
