package kh.spring.daoImpl;

import java.util.List;

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
	public int deleteCart(String[] seqs) {
		return sst.delete("CartDAO.deleteCart", seqs);
	}
	
	@Override
	public int deleteCartByItemSeq(String[] itemSeqs) {
		return sst.delete("CartDAO.deleteCartByItemSeq", itemSeqs);
	}
	
}
