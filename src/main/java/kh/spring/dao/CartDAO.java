package kh.spring.dao;

import java.util.List;

import kh.spring.dto.CartDTO;
import kh.spring.dto.ItemDTO;

public interface CartDAO {
	public int insertCart(CartDTO dto);
	public int isExist(CartDTO dto);
	public List<ItemDTO> selectCartPerPage(String id);
	public int getCartCount(String id);
	public int deleteCart(int item_seq, String id);
}
