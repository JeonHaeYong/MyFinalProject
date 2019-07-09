package kh.spring.fin;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	@RequestMapping("index2")
	public String index2(Locale locale, Model model) {
		
		return "index2";
	}
	@RequestMapping(value ="board", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
		
		return "board";
	}
	@RequestMapping(value ="test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		return "test";
	}
	
}
