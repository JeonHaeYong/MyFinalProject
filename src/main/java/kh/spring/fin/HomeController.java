package kh.spring.fin;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import kh.spring.dto.ApiAbandonedAnimalDTO;
import kh.spring.serviceImpl.ApiAbandonedAnimalServiceImpl;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping(value ="board", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
		
		return "board";
	}
	
	@RequestMapping("toAbandoned")
	public String abandoned() {
		return "abandoned";
	}
	
	

}
