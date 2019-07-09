package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;

public interface ItemDAO {
	public int deleteItem(ItemDTO dto);
	public ItemDTO readOneItem(int seq);
	public int uploadItem(ItemDTO dto);
	public int modifyItem(ItemDTO dto);
	public List<ItemDTO> selectAllItem(int currentPage);
	public int itemContentsSize();
	public Map<String, Integer> getNaviforItem(int currentPage);
}
