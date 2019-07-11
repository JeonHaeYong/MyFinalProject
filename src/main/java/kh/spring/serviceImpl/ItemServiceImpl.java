package kh.spring.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ItemDAO;
import kh.spring.dto.ItemDTO;
import kh.spring.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDAO itemDao;

	@Override
	public int uploadItem(ItemDTO dto) {
		return itemDao.insertItem(dto);
	}

	@Override
	public List<ItemDTO> selectItemPerPage(int currentPage) {
		Map<String, Integer> navi = itemDao.getNaviforItem(currentPage, itemDao.itemContentsSize());
		return itemDao.selectItemPerPage(navi.get("fromIndex"), navi.get("toIndex"));
	}

	@Override
	public List<ItemDTO> selectItemPerPageByCategory(int currentPage, String category) {
		Map<String, Integer> navi = itemDao.getNaviforItem(currentPage, itemDao.itemContentsSize());
		return itemDao.selectItemPerPageByCategory(category, navi.get("fromIndex"), navi.get("toIndex"));
	}

	@Override
	public ItemDTO readOneItem(int seq) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ItemDTO dto = itemDao.readOneItem(seq);
		dto.setFomredDate(sdf.format(dto.getWrite_date()));
		return dto;
	}

	@Override
	public int deleteItem(ItemDTO dto) {
		return itemDao.deleteItem(dto);
	}

	@Override
	public int modifyItem(ItemDTO dto) {
		return itemDao.modifyItem(dto);
	}

	@Override
	public int itemContentsSize() {
		return itemDao.itemContentsSize();
	}
	
	@Override
	public int itemContentsSizeByCategory(String category) {
		return itemDao.itemContentsSizeByCategory(category);
	}
	
	@Override
	public Map<String, Integer> getNaviforItem(int currentPage, String category) {
		if(category.equals("all")) {
			return itemDao.getNaviforItem(currentPage, itemDao.itemContentsSize());
		}else {
			return itemDao.getNaviforItem(currentPage, itemDao.itemContentsSizeByCategory(category));
		}
	}



}
