package com.web.book.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.book.service.AdminService;

@Controller
@RequestMapping("/Admin")
public class AdminController {

	@Autowired
	AdminService adminservice;
	
	// 導向管理心得頁面
	@GetMapping("/BookReport")
	public String bookReportAdmin() {
		
		return "Admin/adminBookReport";
	}
	
	// 回傳所有心得資訊
	@PostMapping("/getAllBookReport")
	@ResponseBody
	public List<Map<String, Object>> getAllBookReport(){
		
		return adminservice.getAllBookReport();
	}
	
	// 刪除心得並回傳是否新增成功
	@PostMapping("/deleteBookReport")
	@ResponseBody
	public Boolean deleteBookReport(
			@RequestParam(value = "brId" , required = true) Integer brId) {
		return adminservice.deleteBookReport(brId);
	}
	
}
