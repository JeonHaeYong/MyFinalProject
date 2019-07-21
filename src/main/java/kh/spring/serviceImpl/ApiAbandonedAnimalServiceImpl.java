package kh.spring.serviceImpl;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dao.ApiAbandonedAnimalDAO;
import kh.spring.dto.ApiAbandonedAnimalDTO;
import kh.spring.service.ApiAbandonedAnimalService;

@Service
public class ApiAbandonedAnimalServiceImpl implements ApiAbandonedAnimalService{
	@Autowired
	private ApiAbandonedAnimalDAO dao;

	public ApiAbandonedAnimalDTO selectOneApiAbandonedAnimal(int seq){
		ApiAbandonedAnimalDTO dto = dao.selectOneApiAbandonedAnimal(seq);
		if(dto.getSexCd().replace(" ", "").equals("M")) {
			dto.setSexCd("수컷");
		}else if(dto.getSexCd().replace(" ", "").equals("F")) {
			dto.setSexCd("암컷");
		}else {
			dto.setSexCd("미상");
		}
	
		return dto;
	}

	public int deleteAll() {
		int result = dao.deleteAll();
		return result;
	}
	
	@Override

	public List<ApiAbandonedAnimalDTO> selectAll(int currentPage) {
		
		String from = "2019-01-01";
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd");
		String to = sdf.format (System.currentTimeMillis());
	
		Date dateFrom = null;
		Date dateTo = null;
		try {
			dateFrom = (Date) sdf.parse(from);
			dateTo = (Date) sdf.parse(to);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int recordCountPerPage = 12;
		int endNum = currentPage *recordCountPerPage;
		int startNum = endNum - (recordCountPerPage-1);
		
		String processState="보호중";

		List<ApiAbandonedAnimalDTO> list = dao.selectAll(currentPage,
				startNum, endNum, dateFrom, dateTo, processState);
		
		for(ApiAbandonedAnimalDTO dto : list) {
			
			if(dto.getSexCd().replace(" ", "").equals("M")) {
				dto.setSexCd("수컷");
			}else if(dto.getSexCd().replace(" ", "").equals("F")) {
				dto.setSexCd("암컷");
			}else {
				dto.setSexCd("미상");
			}
			
		}
		
		return list;
	}

	public Map<String, Integer> getNaviforApiAbandonedAnimal(int currentPage) {
		Map<String, Integer> pageNavi = dao.getNaviForApiAbandonedAnimal(currentPage);
		return pageNavi;
	}

	@Override
	public List<ApiAbandonedAnimalDTO> selectByCondition(int currentPage,String from,
			String to, String species, String speciesKind, String sido, String sigungu, String shelter, String processState) {
		if(shelter == null || shelter.equals("")) {
			shelter = "%";
		}
		if(species == null || species.equals("")) {
			species = "%";
		}
		if(speciesKind == null || speciesKind.equals("")) {
			speciesKind = "%";
		}
		if(sido == null || sido.equals("")) {
			sido = "%";
		}
		if(sigungu == null || sigungu.equals("")) {
			sigungu = "%";
		}
		if(processState.equals("전체")) {
			processState = "%";
		}
	
		System.out.println("보호소"+shelter);
		System.out.println("축종"+species);
		System.out.println("품종"+speciesKind);
		System.out.println("시도"+sido);
		System.out.println("시군구"+sigungu);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dateFrom = null;
		Date dateTo = null;
		try {
			dateFrom = (Date) transFormat.parse(from);
			dateTo = (Date) transFormat.parse(to);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		System.out.println("현재페이지"+currentPage);
		int recordCountPerPage = 12;
		int endNum = currentPage *recordCountPerPage;
		int startNum = endNum - (recordCountPerPage-1);
		System.out.println("startNum"+startNum);
		System.out.println("endNum"+endNum);
		
		List<ApiAbandonedAnimalDTO> list = dao.selectByCondition(currentPage,
				startNum, endNum, dateFrom, dateTo, species, speciesKind, sido, sigungu, shelter, processState);
		
		for(ApiAbandonedAnimalDTO dto : list) {
			
			if(dto.getSexCd().replace(" ", "").equals("M")) {
				dto.setSexCd("수컷");
			}else if(dto.getSexCd().replace(" ", "").equals("F")) {
				dto.setSexCd("암컷");
			}else {
				dto.setSexCd("미상");
			}
			
		}
		return list;
	}


	@Override
	public int apiAbandonedAnimalContentsSize() {
		int result = dao.apiAbandonedAnimalContentsSize();
		return result;
	}
	
	public String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	public String shelterAjax(String sidoCd, String sigunguCd) throws SAXException, IOException, ParserConfigurationException, InterruptedException {
		JsonArray ja = null;
		for(int z = 1 ; z <= 10 ; z++)
		{
//			System.out.println(sidoCd);
//			System.out.println(sigunguCd);
			
			StringBuilder urlBuilder = new StringBuilder
				("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/shelter");
			
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") 
//			+ "=kXUdalA6v1x81lW37mHqSc9mIC19x9%2Bm89AJlD8C3RCs7Y0jxUcaLO4a4%2FB5rwlVoxYVCLZowXqeTFt%2F4KJ2vA%3D%3D"); // Service Key
//			+ "=jXaJNghTzJVoMzPIaoJjQNXPCh739%2B%2B86Ux%2BDKM2tmV6w3rP6AmFj3OSiH%2FxWGLNHSS3rp%2FO%2B9vfxhjYD7nqYA%3D%3D"); // Service Key
//			+ "=peJkA4f1rW8QhcgT9GjivDZntWYWWHL0mxAyIdr1eZxPmNacZXWaUUcXM2OA3wvMkW1zv%2FYkFe8KuAfN34%2BfgA%3D%3D"); // Service Key
			+ "=%2FOJA5gHJdT6t0KZmOpbyNhC2WS1lBxjCoHXCOhnl%2Bvm2ofo6vfAAXWNXSQWj8Qe8te1N1StsAIAaZavSubNVgA%3D%3D"); // Service Key
//			+ "=rHMA7CAFSaUwQaOP5Esp1Gq%2FP7JT8%2FSTQ%2FZlZ3RsnhHp5pt8%2BW6UP%2B1aer5MrfjbxRC%2FIjbH%2F%2F00HtyCfePVOg%3D%3D"); // Service Key
			urlBuilder.append("&" + URLEncoder.encode("upr_cd", "UTF-8") 
			+ "=" + URLEncoder.encode(sidoCd, "UTF-8")); //시도코드(입력 시 데이터 O, 미입력 시 데이터 X)
//			+ "=" + sidoCd);
			urlBuilder.append("&" + URLEncoder.encode("org_cd", "UTF-8") 
			+ "=" + URLEncoder.encode(sigunguCd, "UTF-8")); //시군구코드(입력 시 데이터 O, 미입력 시 데이터 X)
//			+ "=" + sigunguCd);
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(urlBuilder.toString());
			
//			System.out.println(urlBuilder.toString());
			
			NodeList answer = doc.getElementsByTagName("header");
//			System.out.println();
			if(getTagValue("resultMsg", (Element)answer.item(0)).equals("NORMAL SERVICE."))
			{
				
//				System.out.println(doc.toString());
				
				NodeList nList = doc.getElementsByTagName("item");
				
//				System.out.println(nList.getLength());
				
				ja = new JsonArray();
				
				if(nList.getLength() != 0)
				{
					for(int i = 0 ; i < nList.getLength() ; i++ )
					{
						Node nNode = nList.item(i);
						if(nNode.getNodeType() == Node.ELEMENT_NODE)
						{
							Element eElement = (Element)nNode;
							
							String careRegNo = getTagValue("careRegNo", eElement);			//uprCd
							String careNm = getTagValue("careNm", eElement);			//kindCd
							
							
//							System.out.println();
//							System.out.println();
//							System.out.println("######################");
//							
//							System.out.println("careRegNo : " + careRegNo);
//							System.out.println("careNm : " + careNm);
							
							JsonObject jo = new JsonObject();
							
							jo.addProperty("careRegNo", careRegNo);
							jo.addProperty("careNm", careNm);
							ja.add(jo);
							
							
						} // for end
					} // if end
					System.out.println(ja.toString());
					
					return new Gson().toJson(ja);
				}
				else
				{
//					System.out.println("1초-a");
					Thread.sleep(1000);
					continue;
				}
			}
			else
			{
				System.out.println(getTagValue("resultMsg", (Element)answer.item(0)));
				Thread.sleep(1000);
				continue;
			}
		}
		
		return "error";
	}

}	

