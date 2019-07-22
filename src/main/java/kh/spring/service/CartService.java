package kh.spring.service;

import java.util.List;

import kh.spring.dto.CartDTO;
import kh.spring.dto.ItemDTO;

public interface CartService {
	public int insertCartService(CartDTO dto);
	public List<ItemDTO> selectCartPerPage(String id);
	public int deleteCartService(String[] seqs);
	public int getCartCount(String id);
}
