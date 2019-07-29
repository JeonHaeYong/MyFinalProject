package kh.spring.dao;

import java.util.List;
import java.util.Map;

import kh.spring.dto.ItemDTO;

public interface ItemDAO {
	public int deleteItem(String[] seqs);
	public int updateWithdrawalSeller(String id);
	public ItemDTO readOneItem(int seq);
	public int insertItem(ItemDTO dto);
	public int modifyItem(ItemDTO dto);
	public List<ItemDTO> selectItemPerPage(int start, int end);
	public List<ItemDTO> selectItemPerPageByCategory(String category, int start, int end);
	public List<ItemDTO> selectItemPerPageWithoutSoldout(int start, int end);
	public List<ItemDTO> selectItemPerPageByCategoryWithoutSoldout(String category, int start, int end);
	public List<ItemDTO> selectItemByOrderNum(String orderNumber);
	public int updateSoldOut(int seq);
	public int itemContentsSize();
	public int itemContentsSizeByCategory(String category);
	public int itemContentsSizeWithoutSoldout();
	public int itemContentsSizeByCategoryWithoutSoldout(String category);
	public Map<String, Integer> getNaviforItem(int currentPage, int recordTotalCount);
	
	public List<ItemDTO> selectForAdmin(int start, int end) throws Exception;
	public int selectCountForAdmin() throws Exception;
	public int updatePermissionBySeq(int seq) throws Exception;
	public int deleteItemBySeq(int seq) throws Exception;
}
