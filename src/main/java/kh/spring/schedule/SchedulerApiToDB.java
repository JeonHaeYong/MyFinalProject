package kh.spring.schedule;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kh.spring.daoImpl.ApiAbandonedAnimalDAOImpl;
import kh.spring.dto.ApiAbandonedAnimalDTO;
import kh.spring.serviceImpl.ApiAbandonedAnimalServiceImpl;

@Component
public class SchedulerApiToDB {
	@Autowired
	ApiAbandonedAnimalDAOImpl dao;
	@Autowired
	ApiAbandonedAnimalServiceImpl service;

	public String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	static final int RECORDPERPAGE = 99999999;

	// 초 분 시 일 월 요일
	@Transactional("txManager")

	@Scheduled(cron="01 0 00 * * *")

	public void updateApi() throws Exception {
		System.out.println("updateApi 시작");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		dao.deleteAll();	// 기존 DB 데이터 모두 지우기
		dao.dropSeq();
		
		dao.createSeq();
		String upkind = "";	//축종코드 생략 불가하므로
		
		for(int k =1; k<= 3 ; k++)
		{
			if(k == 1)
			{
				upkind = "417000";	// 개
			}
			else if(k == 2)
			{
				upkind = "422400";	// 고양이
			}
			else if(k == 3)
			{
				upkind = "429900";	// 기타동물
			}
			
			for(int j = 1;j<=10;j++)
			{
				String pageNo = "1"; // 페이지 번호
				String numOfRows = "" + RECORDPERPAGE; // 페이지당 보여줄 개수

				String bgnde = "20190101"; // 유기날짜 (검색 시작일)
				String endde = sdf.format(System.currentTimeMillis());// 유기날짜 (검색 종료일)			
				
				String kind = ""; // 품종코드(생략 가능)
				String upr_cd = ""; // 시도코드(생략 가능)
				String org_cd = ""; // 시군구코드(생략 가능)
				String care_reg_no = ""; // 보호소번호(생략 가능)
				String state = ""; // 상태(생략 가능) 상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect
				String neuter_yn = ""; // 중성화여부(생략 가능) Y : 예 N : 아니오

				StringBuilder urlBuilder = new StringBuilder(
						"http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"); /* URL */

				urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=%2FOJA5gHJdT6t0KZmOpbyNhC2WS1lBxjCoHXCOhnl%2Bvm2ofo6vfAAXWNXSQWj8Qe8te1N1StsAIAaZavSubNVgA%3D%3D"); /*
				 * Service
				 * Key
				 */
				// +
				// "=rHMA7CAFSaUwQaOP5Esp1Gq%2FP7JT8%2FSTQ%2FZlZ3RsnhHp5pt8%2BW6UP%2B1aer5MrfjbxRC%2FIjbH%2F%2F00HtyCfePVOg%3D%3D");
				// /*Service Key*/

				urlBuilder.append("&" + URLEncoder.encode("bgnde", "UTF-8") + "=" + URLEncoder.encode(bgnde, "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("endde", "UTF-8") + "=" + URLEncoder.encode(endde, "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("upkind", "UTF-8") + "=" + URLEncoder.encode(upkind, "UTF-8"));
//				urlBuilder.append("&" + URLEncoder.encode("kind", "UTF-8") + "=" + URLEncoder.encode(kind, "UTF-8"));
//				urlBuilder.append("&" + URLEncoder.encode("upr_cd", "UTF-8") + "=" + URLEncoder.encode(upr_cd, "UTF-8"));
//				urlBuilder.append("&" + URLEncoder.encode("org_cd", "UTF-8") + "=" + URLEncoder.encode(org_cd, "UTF-8"));
//				urlBuilder.append(
//						"&" + URLEncoder.encode("care_reg_no", "UTF-8") + "=" + URLEncoder.encode(care_reg_no, "UTF-8"));
//				urlBuilder.append("&" + URLEncoder.encode("state", "UTF-8") + "=" + URLEncoder.encode(state, "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"));
//				urlBuilder.append("&" + URLEncoder.encode("neuter_yn", "UTF-8") + "=" + URLEncoder.encode(neuter_yn, "UTF-8"));

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(urlBuilder.toString());

				NodeList nList = doc.getElementsByTagName("item");

				NodeList answer = doc.getElementsByTagName("header");
				System.out.println(getTagValue("resultMsg", (Element) answer.item(0)));

				boolean serviceCheck = getTagValue("resultMsg", (Element) answer.item(0)).equals("NORMAL SERVICE.");

				if ((nList.getLength() != 0) && serviceCheck) {
					
					for (int i = 0; i < nList.getLength(); i++) {
						Node nNode = nList.item(i);
						if (nNode.getNodeType() == Node.ELEMENT_NODE) {
							Element eElement = (Element) nNode;
							
							String processState = getTagValue("processState", eElement); // 상태
							if(processState.substring(0,2).equals("종료")) {
								continue;
							}
							
							String noticeEdt = getTagValue("noticeEdt", eElement); // 공고종료일
							String popfile = getTagValue("popfile", eElement); // Image
							
							String sexCd = getTagValue("sexCd", eElement); // 성별
							String neuterYn = getTagValue("neuterYn", eElement); // 중성화여부
							String specialMark = getTagValue("specialMark", eElement); // 특징
							String careNm = getTagValue("careNm", eElement); // 보호소이름
							String careTel = getTagValue("careTel", eElement); // 보호소전화번호
							String careAddr = getTagValue("careAddr", eElement); // 보호장소
							String orgNm = getTagValue("orgNm", eElement); // 관할기관

							String chargeNm = "없음"; // 담당자
							try {
								chargeNm = getTagValue("chargeNm", eElement);
							} catch (java.lang.NullPointerException e) {

							}

							String officetel = "없음"; // 담당자
							try {
								officetel = getTagValue("officeTel", eElement); // 담당자연락처
							} catch (java.lang.NullPointerException e) {

							}

							String noticeComment = "없음"; // 특이사항
							try {
								noticeComment = getTagValue("noticeComment", eElement);
							} catch (java.lang.NullPointerException e) {

							}

							String filename = "없음"; // thumbnail image 작은 사진
							try {
								filename = getTagValue("filename", eElement); // 작은 사진
							} catch (java.lang.NullPointerException e) {

							}

							String desertionNo = getTagValue("desertionNo", eElement); // 유기번호
							String happenDt = getTagValue("happenDt", eElement); // 접수일
							String happenPlace = getTagValue("happenPlace", eElement); // 발견장소
							String kindCd = getTagValue("kindCd", eElement); // 품종
							String colorCd = getTagValue("colorCd", eElement); // 색상
							String age = getTagValue("age", eElement); // 나이
							String weight = getTagValue("weight", eElement); // 체중
							String noticeNo = getTagValue("noticeNo", eElement); // 공고번호
							String noticeSdt = getTagValue("noticeSdt", eElement); // 공고시작일

							// numOfRows = getTagValue("numOfRows", eElement); //한 페이지결과수
							// pageNo = getTagValue("pageNo", eElement); //페이지 번호
							// String totalCount = getTagValue("totalCount", eElement); //전체 결과 수
							// String resultCode = getTagValue("resultCode", eElement); //결과코드
							// String resultMsg = getTagValue("resultMsg", eElement); //결과메세지

							// if(checkFlag)
							// {
							// resultCode = getTagValue("resultCode", eElement);
							// resultMsg = getTagValue("resultMsg", eElement);
							// checkFlag = false;
							// }

							// System.out.println("페이지결과수 : " + numOfRows);
							// System.out.println("페이지 번호 : " + pageNo);
							// System.out.println("전체 결과 수 : " + totalCount);
							// System.out.println("결과코드 : " + resultCode);
							// System.out.println("결과메세지 : " + resultMsg);
							ApiAbandonedAnimalDTO dto = new ApiAbandonedAnimalDTO();

							// noticeEdt = noticeEdt.substring(2, 4) + "/" +
							// noticeEdt.substring(4,6)+"/"+noticeEdt.substring(6, 8);
							// happenDt = happenDt.substring(2, 4) + "/" +
							// happenDt.substring(4,6)+"/"+happenDt.substring(6, 8);
							// noticeSdt = noticeSdt.substring(2, 4) + "/" +
							// noticeSdt.substring(4,6)+"/"+noticeSdt.substring(6, 8);
							//
							// System.out.println(noticeEdt);
							// System.out.println(happenDt);
							// System.out.println(noticeSdt);

							SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
							Date dateNoticeEdt = (Date) transFormat.parse(noticeEdt);

							Date dateHappenDt = (Date) transFormat.parse(happenDt);
							Date dateNoticeSdt = (Date) transFormat.parse(noticeSdt);
					
							dto.setNoticeEdt(dateNoticeEdt);
							dto.setPopfile(popfile);
							dto.setProcessState(processState);
							dto.setSexCd(sexCd);
							dto.setNeuterYn(neuterYn);
							dto.setSpecialMark(specialMark);
							dto.setCareNm(careNm);
							dto.setCareTel(careTel);
							dto.setCareAddr(careAddr);
							dto.setOrgNm(orgNm);
							dto.setChargeNm(chargeNm);
							dto.setOfficetel(officetel);
							dto.setNoticeComment(noticeComment);
							dto.setDesertionNo(desertionNo);
							dto.setFilename(filename);
							dto.setHappenDt(dateHappenDt);
							dto.setHappenPlace(happenPlace);
							dto.setKindCd(kindCd);
							dto.setColorCd(colorCd);
							dto.setAge(age);
							dto.setWeight(weight);
							dto.setNoticeNo(noticeNo);
							dto.setNoticeSdt(dateNoticeSdt);

					

							dao.insertApi(dto);

							
						} // if end
					} // for end
					
					break;
				} else if ((nList.getLength() == 0) && serviceCheck) {
					System.out.println("NO RESULT");

				} else {
					System.out.println("RETRY");

					Thread.sleep(1000);

					continue;
				}

			}
			
		}	// 축종코드 3개 for문
		System.out.println("DB의 기존 Api 정보 지우고, 업데이트된 정보 가져와서 넣기 완료");

	}

}



