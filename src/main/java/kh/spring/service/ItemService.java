package kh.spring.service;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;

public interface ItemService {
	public int uploadItem(ItemDTO dto);
	public List<ItemDTO> selectItemPerPage(int currentPage);
	public List<ItemDTO> selectItemPerPageByCategory(int currentPage, String category);
	public List<ItemDTO> selectItemPerPageWithoutSoldout(int currentPage);
	public List<ItemDTO> selectItemPerPageByCategoryWithoutSoldout(int currentPage, String category);
	public ItemDTO readOneItem(int seq);
	public int deleteItem(String[] seqs);
	public int itemContentsSize();
	public int itemContentsSizeByCategory(String category);
	public int itemContentsSizeWithoutSoldout();
	public int itemContentsSizeByCategoryWithoutSoldout(String category);
	public Map<String, Integer> getNaviforItem(int currentPage, String category, String soldout);
	
	public Object insertDummy() throws Exception;
	public String selectForAdmin(String page) throws Exception;
	public String permissionItems(String items) throws Exception;
	public String rejectItems(String items) throws Exception;
}
