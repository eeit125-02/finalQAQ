package com.web.book.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.BookBean;
import com.web.book.model.BookReportBean;
import com.web.book.model.MemberBean;
import com.web.book.service.BookReportService;
import com.web.book.service.SearchService;

@Controller
@RequestMapping("/BookReport")
@SessionAttributes(value = {"loginUser"})
public class BookReportController {
	
	@Autowired
	BookReportService bookReportService;
	
	@Autowired
	SearchService searchService;
	
	Integer bookId;
	MemberBean loginUser;
	
	@ModelAttribute
	public void setLoginUser(Model model) {
		loginUser = (MemberBean) model.getAttribute("loginUser");
	}
	
	@GetMapping("")
	public String homeBookReport (Model model) {
		return "BookReport/BookReport";
	}
	
	@GetMapping("/EditBookReport" )
	public String memberBookReport (Model model) {
		return "BookReport/EditBookReport";
	}
	
	@PostMapping("/EditBookReport/getBookReportList")
	@ResponseBody
	public List<Map<String, Object>> bookReportList(){
		List<Map<String, Object>> book = new ArrayList<>();
		List<BookReportBean> memberBookReport = bookReportService.bookReportMemberAllList(loginUser.getMb_ID());
		for (BookReportBean bookReportBean : memberBookReport) {
			Map<String, Object> data = new HashMap<>();
			data.put("br_ID", bookReportBean.getBr_ID());
			data.put("bk_Name", bookReportBean.getBook().getBk_Name());
			data.put("bk_Author", bookReportBean.getBook().getBk_Author());
			data.put("br_Score", bookReportBean.getBr_Score());
			data.put("br_DateTime",String.valueOf(bookReportBean.getBr_DateTime()));
			data.put("bk_Pic", bookReportBean.getBook().getBk_Pic());
			book.add(data);
		}
		
	    return book;   
	}
	
	@PostMapping("/EditBookReport/deleteBookReport/{br_ID}")
	@ResponseBody
	public String deleteBookReport( @PathVariable("br_ID") Integer br_ID ) {
		bookReportService.deleteBookReport(br_ID);
		return "true";
	}
	
	@PostMapping("/EditBookReport/getBookReport/{br_ID}")
	@ResponseBody
	public Map<String, Object> getBookReport( @PathVariable("br_ID") Integer br_ID ) {
		BookReportBean bookReport =  bookReportService.getBookReport(br_ID);
		Map<String, Object> data = new HashMap<>();
		data.put("br_ID", bookReport.getBr_ID());
		data.put("bk_Name", bookReport.getBook().getBk_Name());
		data.put("bk_Author", bookReport.getBook().getBk_Author());
		data.put("bk_Publish", bookReport.getBook().getBk_Publish());
		data.put("br_Score", bookReport.getBr_Score());
		data.put("bk_Pic", bookReport.getBook().getBk_Pic());
		data.put("br_Content", bookReport.getBr_Content());
		
		return data;
	}
	
	@PostMapping("/EditBookReport/upDateBookReport")
	@ResponseBody
	public String upDateBookReport(
			@RequestParam(value = "br_ID", required = true) Integer br_ID, 
			@RequestParam(value = "br_Score", required = true) Integer br_Score,
			@RequestParam(value = "br_Content", required = true) String br_Content) {
		
		bookReportService.upDateBookReportData(br_ID, br_Score, br_Content);
		
		return "true";
	}
	
	@PostMapping("/addBookReport/{bk_ID}")
	public String addBookReport( @PathVariable("bk_ID") Integer bk_ID) {
		bookId = bk_ID;
		return "BookReport/addBookReport";
	}
	
	
	@PostMapping("/addBookReport/bookInfo")
	@ResponseBody
	public Map<String, Object> gotoPage(Model model, @RequestParam(value = "page") Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		Map<String, Object> info = new HashMap<>();
		info.put("bk_Name", result.getBk_Name());
		info.put("bk_Author", result.getBk_Author());
		info.put("bk_Pic", result.getBk_Pic());
		info.put("bk_Translator", result.getBk_Translator());
		info.put("userAccount", loginUser.getMb_Account());
		return info;
	}
	
	
	
}
