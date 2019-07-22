package kh.spring.fin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.ReviewDTO;
import kh.spring.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ReviewService rservice;

	@RequestMapping("toReviewList")
	public String toReviewList(HttpServletRequest request , String currentPage) {
		if(currentPage==null) {
			currentPage = "1";
		}
		//list넘기기
		List<ReviewDTO> reviewList = rservice.selectAllReviewByCurrentpage(currentPage);
		request.setAttribute("reviewList", reviewList);
		//navi넘기기
		List<String> navi = rservice.getNaviForReviewList(Integer.parseInt(currentPage));
		request.setAttribute("navi", navi);
		request.setAttribute("currentPage", currentPage);
		return "review/meet_reviewList";
	}
	@RequestMapping("toWriteReview")
	public String toWriteReview_loginCheck(HttpServletRequest request) {
		return "review/writeReviewForm";
	}
	
	//후기작성insert
	@RequestMapping("insertReview")
	public String insertReview_loginCheck(HttpServletRequest request,ReviewDTO dto, MultipartFile image) {
		String realPath = session.getServletContext().getRealPath("/");
		String resourcePath = realPath + "resources/images/review";//review폴더
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today= sdf.format(System.currentTimeMillis());
		String savePath = resourcePath+"/"+today;
		System.out.println("파일저장할 위치 -> " + savePath);
		File uploadPath = new File(savePath);
		System.out.println(image.getName()+":"+image.getOriginalFilename());
		if(!uploadPath.exists()) {	//해당하는 이름의 폴더가 없다면
			uploadPath.mkdir();	//폴더를 만들어줘라. mkdir() : makeDirectory
		}
		String fileName = null;
		try {
			fileName = System.currentTimeMillis()+image.getOriginalFilename();
			image.transferTo(new File(savePath+"/"+fileName));
			dto.setImage_path1(today+"/"+fileName);
			int result = rservice.insertReviewService(dto);
			System.out.println("후기작성이 "+ result+"개 입력 완료되었습니다");
		} catch (Exception e) {
			e.printStackTrace();
		}
		///----
		return "redirect:toReviewList";
	}
	
	@RequestMapping("toReviewDetail")
	public String toReviewDetail(HttpServletRequest request,int seq, String currentPage) {
		System.out.println(seq);
		ReviewDTO dto = rservice.selectReviewBySeq(seq);
		request.setAttribute("reviewDTO", dto);
		request.setAttribute("currentPage", currentPage);
		return "review/review_detail";
	}
}
