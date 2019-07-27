package kh.spring.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class BaseExceptionResolver implements HandlerExceptionResolver{
	private String view = null;
	public void setView(String view){
		this.view = view;
	}

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse arg1, Object arg2, Exception e) {
		// 최대업로드사이즈 초과 체크
//		System.out.println("클래스->"+e.getClass().toString());
		if( e instanceof MaxUploadSizeExceededException || e instanceof SizeLimitExceededException) {
			long maxFileSizeMB = (((MaxUploadSizeExceededException)e).getMaxUploadSize() / 1024 / 1024);
			String errorMsg = "첨부파일 사이즈는 " + maxFileSizeMB + "M 를 초과할 수 없습니다.";
			System.out.println(errorMsg);
			request.setAttribute("errorMsg",errorMsg);
		}
		return new ModelAndView(view);
	}

}
