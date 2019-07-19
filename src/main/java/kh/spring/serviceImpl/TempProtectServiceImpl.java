package kh.spring.serviceImpl;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.dao.TempProtectDAO;
import kh.spring.dto.TempProtectDTO;
import kh.spring.fin.HomeController;
import kh.spring.service.TempProtectService;

@Service
public class TempProtectServiceImpl implements TempProtectService{
	@Autowired
	private TempProtectDAO tpdao;

	public int deleteTempProtect(TempProtectDTO dto) {
		int result = tpdao.deleteTempProtect(dto);
		return result;
	}


	public int modifyTempProtect(TempProtectDTO dto) {
		int result = tpdao.modifyTempProtect(dto);
		return result;
	}


	public TempProtectDTO readOneTempProtect(int seq) {
		return tpdao.readOneTempProtect(seq);
	}


	public int writeTempProtect(TempProtectDTO dto) {
		int result = tpdao.writeTempProtect(dto);
		return result;
	}


	public List<TempProtectDTO> selectAllTempProtect(int currentPage) {
		List<TempProtectDTO> list = tpdao.selectAllTempProtect(currentPage);
		return list;
	}


	public Map<String, Integer> getNaviForTempProtect(int currentPage) {
		return tpdao.getNaviForTempProtect(currentPage);
	}

	@Override
	public int tempProtectContentsSize() {
		int result = tpdao.tempProtectContentsSize();
		return result;
	}
	
	public String getTagValue(String tag, Element eElement)
	{
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node)nlList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	public String ShelterAJAX(String sidoCd, String sigunguCd) throws Exception
	{
		
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
