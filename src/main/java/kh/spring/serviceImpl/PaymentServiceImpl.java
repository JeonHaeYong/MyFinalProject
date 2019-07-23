package kh.spring.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.CartDAO;
import kh.spring.dao.DonationDAO;
import kh.spring.dao.DonationPaymentDAO;
import kh.spring.dao.ItemDAO;
import kh.spring.dao.MessageDAO;
import kh.spring.dao.PaymentDAO;
import kh.spring.dto.DonationPaymentDTO;
import kh.spring.dto.ItemDTO;
import kh.spring.dto.ItemDTOList;
import kh.spring.dto.MessageDTO;
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
	
	@Autowired
	private ItemDAO idao;
	
	@Autowired
	private DonationDAO ddao;
	
	@Autowired(required=true)
	private DonationPaymentDAO dpdao;
	
	public List<ItemDTO> selectItemForPaymentService(String[] items) {
		return pdao.selectItemForPayment(items);
	}
	
	@Transactional("txManager")
	public List<ItemDTO> paymentComplete(PaymentDTO dto, ItemDTOList list) {
		System.out.println("구매 서비스 실행");
		String msg = "";
		String[] cartSeqs = new String[list.getList().size()];
		int i = 0;
		for(ItemDTO idto : list.getList()) {
			PaymentDTO pdto = dto;
			pdto.setItem_seq(idto.getSeq());
			pdto.setItem_name(idto.getName());
			pdto.setSeller(idto.getSeller());
			msg = "\"" + pdto.getItem_name() + "\" 상품이 결제 완료되었습니다.\n구매자에게 무료나눔 물품을 전달해주세요.\n\n"
					+ "< 구매자 정보 >\n"
					+ "ID: " + pdto.getBuyer() + "\n"
					+ "EMAIL: " + pdto.getEmail() + "\n"
					+ "PHONE: " + pdto.getPhone() + "\n"
					+ "NAME: " + pdto.getName() + "\n"
					+ "ADDRESS: " + pdto.getZipcode() + "\n\t"
					+ pdto.getAddress1() + "\n\t" + pdto.getAddress2();
			pdao.insertPayment(pdto);
			cartSeqs[i++] = idto.getCart_seq()+"";
			MessageDTO mdto1 = new MessageDTO(0, "admin", pdto.getSeller(), msg, null, null, pdto.getSeller(), 0);
			mdao.insertMsg(mdto1);
			MessageDTO mdto2 = new MessageDTO(0, "admin", pdto.getSeller(), msg, null, null, "admin", mdao.selectSeqCurrVal());
			mdao.insertMsg(mdto2);
			idao.updateSoldOut(pdto.getItem_seq());
			
			int price = Integer.parseInt(idto.getPrice().replace(" ", "").replace(",", ""));
			DonationPaymentDTO dpdto = new DonationPaymentDTO(0, pdto.getSeller(), pdto.getItem_name(), ddao.selectDTO().getName(), price, null, "무료나눔");
			dpdao.insertDonationPayment(dpdto);
			ddao.updateCurrentMoney(price);
		}
		cdao.deleteCart(cartSeqs);
		
		return idao.selectItemByOrderNum(dto.getOrderNumber());
	}
	
	public List<ItemDTO> selectItemByOrderNum(String orderNumber){
		return idao.selectItemByOrderNum(orderNumber);
	}
	
	public List<PaymentDTO> selectPaymentPerPageForBuyList(String id, int currentPage) {
		Map<String, Integer> navi = pdao.getNaviForBuyList(currentPage, pdao.getPaymentTotalCountById(id));
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("start", navi.get("fromIndex")+"");
		param.put("end", navi.get("toIndex")+"");
		return pdao.selectPaymentPerPageForBuyList(param);
	}
	
	public Map<String, Integer> getNaviForBuyList(String id, int currentPage) {
		return pdao.getNaviForBuyList(currentPage, pdao.getPaymentTotalCountById(id));
	}
}