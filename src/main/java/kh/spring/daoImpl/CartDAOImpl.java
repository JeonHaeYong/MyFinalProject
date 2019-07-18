package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.CartDAO;
import kh.spring.dto.CartDTO;
import kh.spring.dto.ItemDTO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertCart(CartDTO dto) {
		return sst.insert("CartDAO.addCart", dto);
	}
	
	@Override
	public int isExist(CartDTO dto) {
		return sst.selectOne("CartDAO.isExist", dto);
	}

	@Override
	public List<ItemDTO> selectCartPerPage(String id) {
		return sst.selectList("CartDAO.selectCartPerPage", id);
	}

	@Override
	public int getCartCount(String id) {
		return sst.selectOne("CartDAO.getCartCount", id);
	}

	@Override
	public int deleteCart(int item_seq, String id) {
		Map<String, String> param = new HashMap<>();
		param.put("item_seq", item_seq+"");
		param.put("id", id);
		return sst.delete("CartDAO.deleteCart", param);
	}
	
}
