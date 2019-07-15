package kh.spring.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.PaymentDAO;
import kh.spring.dto.ItemDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<ItemDTO> selectItemForPayment(String itemStr) {
		return sst.selectList("ItemDAO.selectItemForPayment", itemStr);
	}
}
