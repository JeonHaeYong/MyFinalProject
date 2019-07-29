package kh.spring.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dao.DisappearReportDAO;
import kh.spring.dto.DisappearReportDTO;

@Repository
public class DisappearReportDAOImpl implements DisappearReportDAO{
	// 한 페이지에 몇 개의 글이 보이게 할 것인지
	public static int recordCountPerPage = 9;
	// 한 페이지에 네비게이터가 총 몇 개가 보이게 할 것인지
	public static int naviCountPerPage = 10;
	@Autowired
	private SqlSessionTemplate sst; 
	
	@Override
	public int insert(DisappearReportDTO drdto) {
		if(drdto.getNeuter() == null) { //중성화 안했을 경우
			drdto.setNeuter("X");
		}
		if(drdto.getEt()==null) { // 기타 사항 없을경우
			drdto.setEt("");
		}
		String disappearArea = this.replaceAll(drdto.getDisappearArea());
		String furColor = this.replaceAll(drdto.getFurColor());
		String feature = this.replaceAll(drdto.getFeature());
		String et = this.replaceAll(drdto.getEt());
		drdto.setDisappearArea(disappearArea);
		drdto.setFurColor(furColor);
		drdto.setFeature(feature);
		drdto.setEt(et);
		return sst.insert("DisappearReportDAO.insert", drdto);
	}
	@Override
	public int recordAllCount() {
		return sst.selectOne("DisappearReportDAO.recordAllCount");
	}
	@Override
	public List<DisappearReportDTO> selectPerPage(int currentPage){
		Map<String, Integer> hs = new HashMap<>();
		int end = currentPage * recordCountPerPage;
		int start = end - 8;
		hs.put("start", start);
		hs.put("end", end);
		return sst.selectList("DisappearReportDAO.selectPerPage", hs);
	}
	@Override
	public String getNavi(int currentPage) {
		int recordTotalCount = this.recordAllCount();
		// 가지고 있는 게시글의 수에 맞는 페이지의 개수를 구함.
				int pageTotalCount = recordTotalCount / recordCountPerPage;//전체페이지수 
				if(recordTotalCount % recordCountPerPage > 0) {
					pageTotalCount = recordTotalCount / recordCountPerPage + 1;
				}else if(recordTotalCount % recordCountPerPage == 0) {
					pageTotalCount = recordTotalCount / recordCountPerPage;
				}
				// 현재 페이지 오류 검출 및 정정
				if(currentPage < 1) {
					currentPage = 1;
				}else if(currentPage > pageTotalCount) {
					currentPage = pageTotalCount;
				}
				// 네비게이터 시작과 끝
				int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage + 1;
				int endNavi = startNavi + (naviCountPerPage - 1);
				// 네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.
				if(endNavi > pageTotalCount) {
					endNavi = pageTotalCount;
				}
				boolean needPrev = true;	// 1이면 true, -1이면 false
				boolean needNext = true;

				if(startNavi == 1) {
					needPrev = false;
				}
				if(endNavi == pageTotalCount) {
					needNext = false;
				}
				StringBuilder sb = new StringBuilder();
				if(needPrev) {
					//sb.append("<a class='prev' href='toDisappearList?currentPage=" + (startNavi - 1) + "'> ◀  </a>");
					sb.append("<input type='button' currentPage='"+(startNavi - 1)+"' value='이전' class='prev navi-btn'>");
				}
				for(int i = startNavi; i <= endNavi; i++) {
					//sb.append("<a class='pageNum' href='toDisappearList?currentPage=" + i + "'> " + i + "</a>");
					sb.append("<input type='button' currentPage='"+i+"' class='pageNum navi-btn' value='"+i+"'>");

				}
				if(needNext) {
					//sb.append("<a class='next' href='toDisappearList?currentPage=" + (endNavi + 1) + "'> ▶ </a>");
					sb.append("<input type='button' currentPage='"+(startNavi + 1)+"' value='다음' class='next navi-btn'>");
				}
				return sb.toString();
	}
	@Override
	public DisappearReportDTO toReportContent(int seq) {
		return sst.selectOne("DisappearReportDAO.ReportContent", seq);
	}

	@Override
	public int update(DisappearReportDTO drdto) {
		System.out.println("수정!!");
		System.out.println(drdto.getImage1() +":"+ drdto.getImage2()+":"+drdto.getImage3());
		if(drdto.getNeuter() == null) {
			drdto.setNeuter("X");
		}
		if(drdto.getEt()==null) {
			drdto.setEt("");
		}
		//System.out.println(drdto.getDisDate()+drdto.getAreaList()+drdto.getDisappearArea() +drdto.getTel()+drdto.getGender()+drdto.getNeuter()+drdto.getAge()+ drdto.getFurColor() + drdto.getFeature()+drdto.getEt());
//		String disappearArea = this.replaceAll(drdto.getDisappearArea());
//		String furColor = this.replaceAll(drdto.getFurColor());
//		String feature = this.replaceAll(drdto.getFeature());
//		String et = this.replaceAll(drdto.getEt());
//		drdto.setDisappearArea(disappearArea);
//		drdto.setFurColor(furColor);
//		drdto.setFeature(feature);
//		drdto.setEt(et);
		System.out.println(drdto.getSeq());
		int result = 0;
		try {
			result =	sst.update("DisappearReportDAO.update",drdto);
		}catch(Exception e) {e.printStackTrace();}
				System.out.println(result);
		return result;
	}
	@Override
	public int delete(int seq) {
		return sst.delete("DisappearReportDAO.delete",seq);
	}
	@Override
	public String replaceAll(String text) {
	      String reText = text;
	      reText = reText.replaceAll("<script", "");
	      reText = reText.replaceAll("< script", "");
	      reText = reText.replaceAll("script>", "");
	      reText = reText.replaceAll("srcipt >", "");
	      reText = reText.replaceAll("\"\\)\\;", "");
	      reText = reText.replaceAll(">alert", "");
	      reText = reText.replaceAll("\\(\"", "");
	      reText = reText.replaceAll("\\</", "");
	      return reText;
	   }
	
}
