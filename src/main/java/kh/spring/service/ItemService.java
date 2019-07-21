package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;

public interface ItemService {
	public int uploadItem(ItemDTO dto);
	public List<ItemDTO> selectItemPerPage(int currentPage);
	public List<ItemDTO> selectItemPerPageByCategory(int currentPage, String category);
	public ItemDTO readOneItem(int seq);
	public int deleteItem(ItemDTO dto);
	public int modifyItem(ItemDTO dto);
	public int itemContentsSize();
	public int itemContentsSizeByCategory(String category);
	public Map<String, Integer> getNaviforItem(int currentPage, String category);
	
	public Object insertDummy() throws Exception;
	public String selectForAdmin(String page) throws Exception;
	public String permissionItems(String items) throws Exception;
}
