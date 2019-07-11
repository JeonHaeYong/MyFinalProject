package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;

public interface ItemService {
	public int uploadItem(ItemDTO dto);
	public List<ItemDTO> selectItemPerPage(int currentPage);
	public ItemDTO readOneItem(int seq);
	public int deleteItem(ItemDTO dto);
	public int modifyItem(ItemDTO dto);
	public int itemContentsSize();
	public Map<String, Integer> getNaviforItem(int currentPage);
}
