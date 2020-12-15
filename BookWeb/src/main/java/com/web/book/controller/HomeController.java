package com.web.book.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home( Model model, HttpServletRequest request) {
		String path =  request.getContextPath();
		String querString = request.getQueryString();
		model.addAttribute("queryString", querString);
		model.addAttribute("path1025",path);
		return "index";
	}
	
	@GetMapping("/header")
	public String header( Model model, HttpServletRequest request) {
		
		return "header";
	}
	
	@GetMapping("/footer")
	public String footer( Model model, HttpServletRequest request) {
		
		return "footer";
	}

}
