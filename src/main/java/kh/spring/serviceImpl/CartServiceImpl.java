package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CartDAO;
import kh.spring.dto.CartDTO;
import kh.spring.dto.ItemDTO;
import kh.spring.service.CartService;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cdao;
	
	/**
	 * 장바구니 담기 메서드
	 * @param CartDTO
	 * @return -1 : 장바구니에 이미 있을 때
	 * @return -2 : 장바구니가 꽉 찼을 때(10개)
	 * @return 1 : 장바구니 담기 성공했을 때
	 */
	@Override
	public int insertCartService(CartDTO dto) {
		if(cdao.isExist(dto) > 0) {
			return -1;
		}else if(cdao.getCartCount(dto.getId()) > 9){
			return -2;
		}else {
			return cdao.insertCart(dto);
		}
	}
	
	@Override
	public List<ItemDTO> selectCartPerPage(String id){
		return cdao.selectCartPerPage(id);
	}

	@Override
	public int deleteCartService(String[] seqs) {
		return cdao.deleteCart(seqs);
	}

	@Override
	public int getCartCount(String id) {
		return cdao.getCartCount(id);
	}
}
