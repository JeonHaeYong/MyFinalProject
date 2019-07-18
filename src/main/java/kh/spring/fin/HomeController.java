package kh.spring.fin;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.loginapi.NaverLoginBO;

@Controller
public class HomeController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private HttpSession session;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home() {
		//네이버로 로그인하기 위한 url이 필요한데 모든 페이지에서 네이버 로그인이 가능하도록 구현하려면 session에 네이버 url를 담아줘야하므로 여기에 url작업
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		session.setAttribute("url", naverAuthUrl);
		return "index";
	}

}
