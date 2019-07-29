package kh.spring.fin;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.dto.ApiAbandonedAnimalDTO;
import kh.spring.dto.ReviewDTO;
import kh.spring.loginapi.NaverLoginBO;
import kh.spring.service.ApiAbandonedAnimalService;
import kh.spring.service.ReviewService;

@Controller
public class HomeController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private HttpSession session;
	@Autowired
	private ApiAbandonedAnimalService apiService;
	@Autowired
	private ReviewService rservice;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(HttpServletRequest request) {
		//네이버로 로그인하기 위한 url이 필요한데 모든 페이지에서 네이버 로그인이 가능하도록 구현하려면 session에 네이버 url를 담아줘야하므로 여기에 url작업
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		session.setAttribute("url", naverAuthUrl);
		
		List<ApiAbandonedAnimalDTO> list = apiService.selectForMain();
		request.setAttribute("list", list);
		//재회후기뽑아오기
		int reviewCount = rservice.getReviewCount();
		if(reviewCount>=3) {//리뷰글 3개이상일때만 가져오기
			Set<Integer> rSet = new HashSet<>();
			while(rSet.size()<4) {// 랜덤으로 4개
				int rand = (int)(Math.random()*reviewCount+1);
				rSet.add(rand);
				System.out.println("random숫자->"+rand);
			}
			System.out.println("set"+rSet.toString());
			List<ReviewDTO> reList = rservice.selectRandomReview(rSet);
			request.setAttribute("reList", reList);
		}
		return "index";
	}
	@RequestMapping("popUp.home")
	public String popUp(HttpServletRequest request) {
		return "popup";
	}


}
