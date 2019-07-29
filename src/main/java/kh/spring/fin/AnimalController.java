package kh.spring.fin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.spring.dto.AnimalHospitalDTO;
import kh.spring.dto.ProtectionCenterDTO;
import kh.spring.insertDataldto.CenterDTO;
import kh.spring.insertDataldto.GyeonggiDTO;
import kh.spring.insertDataldto.SeoulDTO;
import kh.spring.insertDataldto.SeoulHospital;
import kh.spring.insertDataldto.UlsanDTO;
import kh.spring.insertDataldto.UlsanHospital;
import kh.spring.service.AnimalHospitalService;
import kh.spring.service.ProtectionCenterService;

@Controller
public class AnimalController {
	@Autowired
	HttpSession session;
	@Autowired
	AnimalHospitalService ahs;
	@Autowired
	ProtectionCenterService pcs;
	static String json;
	@RequestMapping("toHospital")
	public String toHospital(HttpServletRequest request) {// 동물병원 조회
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<AnimalHospitalDTO> list = null;
		String navi = null;
		try {
			list = ahs.selectAniHospitalPerPageService(currentPage);
			navi = ahs.getNaviForAniHospitalService(currentPage, null);//검색아님 option = null
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "animal/hospital";
	}

	@RequestMapping("searchToHospital")
	public String searchHospital(HttpServletRequest request) {
		String option = request.getParameter("option");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<AnimalHospitalDTO> list = new ArrayList<>();
		String navi = null;
		try {
			list = ahs.searchAniHospitalPerPageService(currentPage, option);
			navi = ahs.getNaviForAniHospitalService(currentPage, option);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "animal/hospital";
	}
	@RequestMapping("toCenter")
	public String toCenter(HttpServletRequest request) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		List<ProtectionCenterDTO> list = null;
		String navi = null;
		try {
			navi = pcs.getNaviForCenterService(currentPage, null);
			list = pcs.selectCenterPerPageService(currentPage);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return "animal/protectionCenter";
	}
	@RequestMapping("searchToCenter")
	public String searchToCenter(HttpServletRequest request) {
		String option = request.getParameter("option");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		session.setAttribute("currentPage", currentPage);
		System.out.println(option + "현재페이지" + currentPage);
		List<ProtectionCenterDTO> list = null;
		String navi = null;
		try {
			navi = pcs.getNaviForCenterService(currentPage, option);
			list = pcs.searchCenterPerPageService(currentPage, option);
		}catch(Exception e) {e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("navi", navi);
		return"animal/protectionCenter";
	}
	//--데이터삽입----------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping("seoulHospitalData")
	public String inputHospitalData() {
		System.out.println("서울~~~");
		Gson g = new Gson();
		JsonParser jp = new JsonParser();

		SeoulHospital hp = new SeoulHospital();
		String info = hp.getHospital(); 
		JsonObject sRoot = jp.parse(info).getAsJsonObject();
		JsonArray array = sRoot.get("DATA").getAsJsonArray();
		for(int i = 0; i < array.size(); i++) {
			SeoulDTO sdto = g.fromJson(array.get(i), SeoulDTO.class);
			try {
				Thread.sleep(100);
			}catch(Exception e) {e.printStackTrace();};

			int id = Integer.parseInt(sdto.getId());
			System.out.println(id);
			if(sdto.getState().equals("운영중")) {
				try {
					ahs.seoulHospitalService(sdto);
				}catch(Exception e) {
					e.printStackTrace();
					return "0";
				}
			}
		}
		return "1";
	}
	@ResponseBody
	@RequestMapping("gyeonggiHospitalData")
	public String gyeonggiHospitalData() {
		System.out.println("경기~~");
		Gson g = new Gson();
		JsonParser jp = new JsonParser();

					String address = "https://openapi.gg.go.kr/Animalhosptl?KEY=226fb5b860bd4d349bada1d7d8a82bff&Type=json&pIndex=1&pSize=1";

					BufferedReader br;
					URL url;
					HttpURLConnection conn;
					String protocol = "GET";
					try {
						url = new URL(address);
						conn = (HttpURLConnection)url.openConnection();
						conn.setRequestMethod(protocol);
						br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
						json = br.readLine();
					}catch(Exception e) {
						e.printStackTrace();
					}
					JsonObject gRoot = jp.parse(json).getAsJsonObject();
					JsonArray animal = gRoot.get("Animalhosptl").getAsJsonArray();
					JsonObject first = animal.get(0).getAsJsonObject();
					JsonArray head1 = first.get("head").getAsJsonArray();
					JsonObject count = head1.get(0).getAsJsonObject();
					int total_count = Integer.parseInt(count.get("list_total_count").getAsString());
					
					int pageNum = 0;
					if(total_count%1000 == 0) {
						pageNum = total_count/1000;
					}else if (total_count%1000 != 0) {
						pageNum = (total_count/1000)+1;
					}
					
					for(int j = 1; j <= pageNum; j++) {
						String address2 = "https://openapi.gg.go.kr/Animalhosptl?KEY=226fb5b860bd4d349bada1d7d8a82bff&Type=json&pIndex="+j+"&pSize=1000";//3페이지까지
						
						try {
							url = new URL(address2);
							conn = (HttpURLConnection)url.openConnection();
							conn.setRequestMethod(protocol);
							br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
							json = br.readLine();
						}catch(Exception e) {
							e.printStackTrace();
						}
					JsonObject gRoot2 = jp.parse(json).getAsJsonObject();
					JsonArray animal2 = gRoot2.get("Animalhosptl").getAsJsonArray();
					JsonObject row = animal2.get(1).getAsJsonObject();
					JsonArray ggInfo = row.get("row").getAsJsonArray();
					int gCount = 0;

					for(int i = 0; i < ggInfo.size(); i ++) {
						GyeonggiDTO gdto = g.fromJson(ggInfo.get(i), GyeonggiDTO.class);

						if(gdto.getBSN_STATE_NM().equals("정상")) {
							Pattern p = Pattern.compile("동물병원");
							Matcher m = p.matcher(gdto.getBIZPLC_NM());

							if(m.find()) {
								System.out.println(gCount++);
								System.out.println(gdto.getBIZPLC_NM());

								try {
									ahs.gyeonggiHospitalService(gdto);
									Thread.sleep(100);
								}catch(Exception e) {
									e.printStackTrace();
									return "0";
								}
							}else {continue;}
						}else {continue;}
					}
					}
				System.out.println("끝");
				return "1";
	}
	@ResponseBody
	@RequestMapping("ulsanHospitalData")
	public String ulsanHospitalData() {
		Gson g = new Gson();
		JsonParser jp = new JsonParser();
		UlsanHospital us = new UlsanHospital();
		String usInfo = us.ulsan;
		JsonObject uRoot = jp.parse(usInfo).getAsJsonObject();
		JsonArray records = uRoot.get("records").getAsJsonArray();
		int uCount = 0;
		for(int i = 0; i < records.size(); i++) {
			UlsanDTO udto = g.fromJson(records.get(i), UlsanDTO.class);
			try {
				System.out.println(udto.getEntId() +" : "+ uCount++);
				ahs.ulsanHospitalService(udto);
				Thread.sleep(100);
			}catch(Exception e) {
				e.printStackTrace();
				return "0";
			}
		}
		return "1";
	}
	@ResponseBody
	@RequestMapping("insertCenterData")
	public String insertCenterData() {

		String key ="daClz41uTyPYm%2BuHXvoYArzIFgS4ZRRO%2BGz8PW1JPQQ1FyO%2BfxwypxzeO%2Blg1E7LLg0VuRKAtze9DUDagO%2BPnA%3D%3D";
		String address = "http://api.data.go.kr/openapi/animalprtccnter-std?serviceKey="+key+"&pageNo=1&numOfRows=1&type=json";//2페이지까지

		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";
		try {
		url = new URL(address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		json = br.readLine();
		}catch(Exception e) {e.printStackTrace();}
		JsonParser jp = new JsonParser();
		JsonObject root = jp.parse(json).getAsJsonObject();
		JsonObject response = root.get("response").getAsJsonObject();
		JsonObject body = response.get("body").getAsJsonObject();
		int totalCount = Integer.parseInt(body.get("totalCount").getAsString());
		System.out.println(totalCount);
		int pageNum = 0;
		if(totalCount%1000 ==0) {
			pageNum = totalCount/1000;
		}else if(totalCount%1000!=0) {
			pageNum = (totalCount/1000)+1;
		}
		for(int j = 1; j <= pageNum; j++) {
			String address2 = "http://api.data.go.kr/openapi/animalprtccnter-std?serviceKey="+key+"&pageNo="+j+"&numOfRows=1000&type=json";//2페이지까지
			try {
				url = new URL(address2);
				conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod(protocol);
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				json = br.readLine();
				}catch(Exception e) {e.printStackTrace();}
			JsonObject root2 = jp.parse(json).getAsJsonObject();
			JsonObject response2 = root2.get("response").getAsJsonObject();
			JsonObject body2 = response2.get("body").getAsJsonObject();
			JsonArray items = body2.get("items").getAsJsonArray();
			int count = 0;
			System.out.println(items.size());
			
			for(int i = 0; i < items.size(); i++) {
				System.out.println(++count);
				Gson g = new Gson();
				CenterDTO cdto = g.fromJson(items.get(i), CenterDTO.class);
				System.out.println(cdto.getAnimalCnterNm());
				try {
					pcs.insertDataService(cdto);
					Thread.sleep(200);
				}catch(Exception e) {
					e.printStackTrace();
					return "0";
				}
			}
		}		
		System.out.println("끝~!");
		return "1";
	}
	@ResponseBody
	@RequestMapping("deleteHospitalData")
	public String deleteHospitalData(HttpServletRequest request) {
		String area = request.getParameter("area");
		System.out.println(area);
		try {
		if(area.equals("seoul")) {
			ahs.deleteHospitalData("서울");
		}else if(area.equals("gyeonggi")) {
			ahs.deleteHospitalData("경기");
		}else if(area.equals("ulsan")) {
			ahs.deleteHospitalData("울산");
		}


		System.out.println("끝~!");

		}catch(Exception e) {
			e.printStackTrace();
			return "0";
			}
		return "1";
	}
	@ResponseBody
	@RequestMapping("deleteCenterData")
	public String deleteCenterData() {
		try {
		pcs.deleteCenterData();
		}catch(Exception e) {
			e.printStackTrace();
			return "0";
		}

		return "1";
	}
	
}