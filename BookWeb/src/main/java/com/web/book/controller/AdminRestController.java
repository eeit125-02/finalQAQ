package com.web.book.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.book.service.AdminService;

@RestController
@RequestMapping("/Admin")
public class AdminRestController {

	@Autowired
	AdminService adminservice;
	
	// 回傳所有心得資訊
	@PostMapping("/getAllBookReport")
	public List<Map<String, Object>> getAllBookReport(){
		
		return adminservice.getAllBookReport();
	}
	
	// 回傳所有書籍資訊
	@PostMapping("/getAllBook")
	public List<Map<String, Object>> getAllBook(){
		
		return adminservice.getAllBook();
	}
	
	// 回傳所有活動
	@PostMapping("/getAllAct")
	public List<Map<String, Object>> getAllAct(){
		
		return adminservice.getAllAct();
	}
	
	// 回傳所有討論
	@PostMapping("/getAllPost")
	public List<Map<String, Object>> getAllPost(){
		
		return adminservice.getAllPost();
	}
	
	@PostMapping("/getAllStrore")
	public List<Map<String, Object>> getAllStrore(){
		
		return adminservice.getAllStrore();
	}
	
	// 刪除心得並回傳是否新增成功
	@PostMapping("/deleteBookReport")
	public Boolean deleteBookReport(
			@RequestParam(value = "brId" , required = true) Integer brId) {
		
		return adminservice.deleteBookReport(brId);
	}
	
	// 取得每月心得撰寫數量
	@PostMapping("/getMonthReportWrite")
	public Map<String, Object> getMonthReportWrite(){
		
		return adminservice.getMonthReportWrite();
	}
	
	// 取得每月心得瀏覽數量
	@PostMapping("/getMonthReportViews")
	public Map<String, Object> getMonthReportViews(){
		
		return adminservice.getMonthReportView();
	}
	
	// 回傳單一圖書資訊
	@PostMapping("/getBook")
	public Map<String, Object> getAllBook( @RequestParam(value = "bkId" , required = true) Integer bkId){
		
		return adminservice.getBookInfo(bkId);
	}
	
	// 刪除圖書資料
	@PostMapping("/deleteBook")
	public Boolean deleteBook(@RequestParam(value = "bkId", required = true) Integer bkId) {
		System.out.println(bkId);
		return adminservice.deleteBook(bkId);
	}
}
