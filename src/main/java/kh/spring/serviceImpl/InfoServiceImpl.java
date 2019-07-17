package kh.spring.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.InfoDAO;
import kh.spring.dto.TrainingDTO;
import kh.spring.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService{
	@Autowired
	InfoDAO  dao;


	@Override
	public int Infoinsert(TrainingDTO dto)throws Exception {
		return dao.insertInfo(dto);
	}

}
