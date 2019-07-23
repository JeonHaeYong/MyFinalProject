package kh.spring.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.DonationDAO;
import kh.spring.dao.DonationPaymentDAO;
import kh.spring.dto.DonationPaymentDTO;
import kh.spring.service.DonationPaymentService;

@Service
public class DonationPaymentServiceImpl implements DonationPaymentService {

	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 10;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 5;

	@Autowired
	private DonationPaymentDAO dpdao;

	@Autowired
	private DonationDAO ddao;

	@Override
	@Transactional("txManager")
	public int insertDonationPaymentService(DonationPaymentDTO dto) throws Exception {
		dto.setDonation_name(ddao.selectRecentDTO().getName());
		ddao.updateCurrentMoney(dto.getDonation());
		return dpdao.insertDonationPayment(dto);
	}

	@Override
	public List<DonationPaymentDTO> selectDonationPaymentById(String id, int currentPage) {
		Map<String, Integer> navi = this.getNaviForDonationPayment(currentPage, dpdao.getDonationPaymentTotalCountById(id));
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("start", navi.get("fromIndex")+"");
		param.put("end", navi.get("toIndex")+"");
		return dpdao.selectDonationPaymentById(param);
	}
	
	@Override
	public int getDonationPaymentTotalCountById(String id) {
		return dpdao.getDonationPaymentTotalCountById(id);
	}

	@Override
	public Map<String, Integer> getNaviForDonationPayment(int currentPage, int recordTotalCount) {

		//		int recordTotalCount = this.itemContentsSize();
		// 가지고 있는 게시글의 수에 맞는 페이지의 개수를 구함.
		int pageTotalCount = recordTotalCount / recordCountPerPage;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount++;
		}
		// 현재 페이지 오류 검출 및 정정
		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		// 네비게이터 시작과 끝
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		// 네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		int needPrev = 1;	// 1이면 true, -1이면 false
		int needNext = 1;

		if(startNavi == 1) {
			needPrev = -1;
		}
		if(endNavi == pageTotalCount) {
			needNext = -1;
		}

		int fromIndex = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int toIndex = currentPage*recordCountPerPage;

		if(toIndex > recordTotalCount) {
			toIndex = recordTotalCount;
		}

		Map<String, Integer> pageNavi = new HashMap<>();
		pageNavi.put("currentPage", currentPage);
		pageNavi.put("recordTotalCount", recordTotalCount);
		pageNavi.put("recordCountPerPage", recordCountPerPage);
		pageNavi.put("naviCountPerPage", naviCountPerPage);
		pageNavi.put("pageTotalCount", pageTotalCount);
		pageNavi.put("startNavi", startNavi);
		pageNavi.put("endNavi", endNavi);
		pageNavi.put("needPrev", needPrev);
		pageNavi.put("needNext", needNext);
		pageNavi.put("fromIndex", fromIndex);
		pageNavi.put("toIndex", toIndex);

		return pageNavi;
	}

}
