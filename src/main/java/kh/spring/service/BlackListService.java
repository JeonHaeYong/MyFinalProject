package kh.spring.service;

import kh.spring.dto.BlackListDTO;

public interface BlackListService
{
	public void insert(BlackListDTO dto) throws Exception;
	public BlackListDTO selectById(BlackListDTO dto) throws Exception;
	public int selectCountById(BlackListDTO dto) throws Exception;
	public String delete(BlackListDTO dto) throws Exception;
	
	public String searchMember(String id, String page) throws Exception;
	public String blackMember(String id, String reason) throws Exception;
	
	public String insertRandomMembers() throws Exception;
	
	public Object selectMembersInBlackList(String id, String page) throws Exception;
}
