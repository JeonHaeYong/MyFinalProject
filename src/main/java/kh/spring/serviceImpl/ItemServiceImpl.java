package kh.spring.serviceImpl;

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
	
	
	public int deleteItem(ItemDTO dto){
		int result = itemDao.deleteItem(dto);
		return result;
	}
	
	
	public int modifyItem(ItemDTO dto){
		int result = itemDao.modifyItem(dto);
		return result;
	}
		
	public ItemDTO readOneItem(int seq){
			ItemDTO dto = itemDao.readOneItem(seq);
			return dto;
	}
	
	public List<ItemDTO> selectAllItem(int currentPage){
		List<ItemDTO> list = itemDao.selectAllItem(currentPage);
		return list;
	}
	
	
	public Map<String, Integer> getNaviforItem(int currentPage){
		Map<String, Integer> pageNavi = itemDao.getNaviforItem(currentPage);
		return pageNavi;
	}

	@Override
	public int uploadItem(ItemDTO dto){
		return itemDao.uploadItem(dto);
	}

	@Override
	public int itemContentsSize(){
		int result = itemDao.itemContentsSize();
		return result;
	}
}
