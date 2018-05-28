package main.web;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import calendar.service.CalendarService;

@Controller
public class MainController {
			
	@RequestMapping("main.do")
	public String main(ModelMap model) throws Exception {
		
	
		return "mainTest";
	}
	
	@RequestMapping("modalLogin.do")
	public String modalLogin(ModelMap model) throws Exception {
		
	
		return "modalLogin";
	}
	
	@RequestMapping("register.do")
	public String register(ModelMap model) throws Exception {
		
	
		return "register";
	}
	
	
}
