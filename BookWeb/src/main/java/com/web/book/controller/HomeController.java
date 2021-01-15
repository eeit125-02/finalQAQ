package com.web.book.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.MemberBean;
import com.web.book.service.GlobalService;
import com.web.book.service.MemberService;

@Controller
@SessionAttributes(value = {"loginUser"})
public class HomeController {

	@Autowired
	MemberService ms;
	
	private Boolean sessioIsLoad = false;
	
	@GetMapping("/")
	public String home( Model model, HttpServletRequest request) {
		String path =  request.getContextPath();
		String querString = request.getQueryString();
		model.addAttribute("queryString", querString);
		model.addAttribute("path1025",path);
		return "index";
	}
	
	@GetMapping("/header")
	public String header( Model model, HttpServletRequest request,
			@CookieValue(value = "Member_ID", required=false) String memberId) throws InterruptedException, ExecutionException, IOException {
		if (memberId != null && Boolean.FALSE.equals(sessioIsLoad)) {
			sessioIsLoad = true;
			Map<String,String> user = GlobalService.getSession(memberId);
			model.addAttribute("loginUser", ms.select(user.get("account")));
			model.addAttribute("sessionLoad",false);
		}else {
			sessioIsLoad = false;
		}
		
		return "header";
	}
	
	@GetMapping("/adminheader")
	public String admin( Model model, HttpServletRequest request,
			@CookieValue(value = "Member_ID", required=false) String memberId) throws InterruptedException, ExecutionException, IOException {
		
		if (memberId != null && Boolean.FALSE.equals(sessioIsLoad)) {
			sessioIsLoad = true;
			Map<String,String> user = GlobalService.getSession(memberId);
			model.addAttribute("loginUser", ms.select(user.get("account")));
			model.addAttribute("sessionLoad",false);
		}
		
		return "adminheader";
	}
	
	@GetMapping("/footer")
	public String footer( Model model, HttpServletRequest request) {
		
		return "footer";
	}

}
