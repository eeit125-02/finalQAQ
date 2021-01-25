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
	
	// 取得每半年心得撰寫數量
	@PostMapping("/getMonthReportWrite")
	public Map<String, Object> getMonthReportWrite(){
		
		return adminservice.getMonthReportWrite();
	}
	
	// 取得每半年心得瀏覽數量
	@PostMapping("/getMonthReportViews")
	public Map<String, Object> getMonthReportViews(){
		
		return adminservice.getMonthReportView();
	}
	
	// 取得近半年貼文撰寫數量
	@PostMapping("/getMonthPostWrite")
	public Map<String, Object> getMonthPostWrite(){
		
		return adminservice.getMonthPostWrite();
	}
	
	// 取得近半年貼文點擊數量
	@PostMapping("/getMonthPostView")
	public Map<String, Object> getMonthPostView(){
		
		return adminservice.getMonthPostView();
	}
	
	// 書籍類型(共九大類)分別有多少藏書的比例圖
	@PostMapping("/getBookTpyeTable")
	public Map<String, Object> getBookTpyeTable(){
		
		return adminservice.getBookTpyeTable();
	}
	
	// 回傳單一圖書資訊
	@PostMapping("/getBook")
	public Map<String, Object> getAllBook( @RequestParam(value = "bkId" , required = true) Integer bkId){
		
		return adminservice.getBookInfo(bkId);
	}
	
	// 回傳單一貼文資訊
	@PostMapping("/getPost")
	public Map<String, Object> getAllPost( @RequestParam(value = "postId" , required = true) Integer postId){
		System.out.println(postId);
		return adminservice.getPostInfo(postId);
	}
	
	// 回傳單一活動資訊
	@PostMapping("/getAct")
	public Map<String, Object> getAllAct( @RequestParam(value = "actId" , required = true) Integer actId){
		
		return adminservice.getActInfo(actId);
	}
	
	// 刪除圖書資料
	@PostMapping("/deleteBook")
	public Boolean deleteBook(@RequestParam(value = "bkId", required = true) Integer bkId) {
		
		return adminservice.deleteBook(bkId);
	}
	
	// 刪除活動資料
	@PostMapping("/deleteAct")
	public Boolean deleteAct(@RequestParam(value = "actId", required = true) Integer actId) {
		
		return adminservice.deleteAct(actId);
	}
	
	// 刪除貼文資料
	@PostMapping("/deletePost")
	public Boolean deletePost(@RequestParam(value = "postId", required = true) Integer postId) {
		
		return adminservice.deletePost(postId);
	}
}
