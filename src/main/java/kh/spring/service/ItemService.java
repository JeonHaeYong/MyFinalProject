package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;

public interface ItemService {
	public int uploadItem(ItemDTO dto) throws Exception;
	public List<ItemDTO> selectAllItem(int currentPage) throws Exception;
	public ItemDTO readOneItem(int seq) throws Exception;
	public int deleteItem(ItemDTO dto) throws Exception;
	public int modifyItem(ItemDTO dto) throws Exception;
	public int itemContentsSize() throws Exception;
	public Map<String, Integer> getNaviforItem(int currentPage) throws Exception;
}
