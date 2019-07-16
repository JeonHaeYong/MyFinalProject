package kh.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CartDAO;
import kh.spring.dao.MessageDAO;
import kh.spring.dao.PaymentDAO;
import kh.spring.dto.ItemDTO;
import kh.spring.dto.ItemDTOList;
import kh.spring.dto.PaymentDTO;
import kh.spring.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO pdao;
	
	@Autowired
	private CartDAO cdao;
	
	@Autowired
	private MessageDAO mdao;
	
	public List<ItemDTO> selectItemForPaymentService(String[] items) {
		return pdao.selectItemForPayment(items);
	}
	
	public int paymentComplete(PaymentDTO dto, ItemDTOList list) {
//		pdao.insertPayment(dto);
//		cdao.deleteCart(seqs);
		String msg = "";
		for(ItemDTO idto : list.getList()) {
			PaymentDTO pdto = dto;
			pdto.setItem_seq(idto.getSeq());
			pdto.setItem_name(idto.getName());
			pdto.setSeller(idto.getSeller());
			msg = pdto.getItem_name() + " 상품이 결제 완료되었습니다.\n"
					+ "< 구매자 정보 >\n"
					+ "ID: " + pdto.getBuyer() + "\n"
					+ "EMAIL: " + pdto.getEmail() + "\n"
					+ "NAME: " + pdto.getName() + "\n"
					+ "ADDRESS: " + pdto.getZipcode() + "\n\t"
					+ pdto.getAddress1() + "\n\t" + pdto.getAddress2();
			System.out.println(msg);
			
		}
		
//		MessageDTO mdto1 = new MessageDTO(0, "admin", dto.getBuyer(), msg, null, null, dto.getBuyer(), 0);
//		mdao.insertMsg(mdto1);
//		MessageDTO mdto2 = new MessageDTO(0, "admin", dto.getBuyer(), msg, null, null, "admin", mdao.selectSeqCurrVal());
//		mdao.insertMsg(mdto2);
		return 0;
	}
}