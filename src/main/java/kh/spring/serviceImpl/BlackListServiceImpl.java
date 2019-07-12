package kh.spring.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.daoImpl.BlackListDAOImpl;
import kh.spring.dto.BlackListDTO;
import kh.spring.fin.AdminController;
import kh.spring.service.BlackListService;

@Service
public class BlackListServiceImpl implements BlackListService
{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	BlackListDAOImpl blacklistDAO;
	
	@Override
	public void insert(BlackListDTO dto) throws Exception
	{
		if(dto.getReason() == null)
		{
			dto.setReason("없음");
		}
		
		if(blacklistDAO.selectCountById(dto) != 1)
		{
			blacklistDAO.insert(dto);
		}
		else
		{
			logger.warn("블랙리스트에 이미 존재하는 아이디 : {}", dto.getId());
		}
		
	}
	
	public BlackListDTO selectById(BlackListDTO dto) throws Exception
	{
		return blacklistDAO.selectById(dto);
	}
	
	@Override
	public void delete(BlackListDTO dto) throws Exception
	{
		if((dto.getId() != null) && (blacklistDAO.selectCountById(dto) != 0))
		{
			blacklistDAO.deleteById(dto);
		}
		else
		{
			logger.warn("블랙리스트에 존재하지 않는 아이디 : {}", dto.getId());
		}
	}

	
}
