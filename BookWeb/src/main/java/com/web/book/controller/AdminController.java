package com.web.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
	// 導向心得管理頁面
	@GetMapping("/BookReport")
	public String bookReportAdmin() {
		
		return "Admin/adminBookReport";
	}
	
	// 導向圖書管理
	@GetMapping("/Book")
	public String bookAdmin() {
		
		return "Admin/adminBook";
	}
	
}
