package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;

public interface ItemDAO {
	public int deleteItem(ItemDTO dto);
	public ItemDTO readOneItem(int seq);
	public int insertItem(ItemDTO dto);
	public int modifyItem(ItemDTO dto);
	public List<ItemDTO> selectItemPerPage(int start, int end);
	public List<ItemDTO> selectItemPerPageByCategory(String category, int start, int end);
	public List<ItemDTO> selectItemByOrderNum(String orderNumber);
	public int updateSoldOut(int seq);
	public int itemContentsSize();
	public int itemContentsSizeByCategory(String category);
	public Map<String, Integer> getNaviforItem(int currentPage, int recordTotalCount);
}
