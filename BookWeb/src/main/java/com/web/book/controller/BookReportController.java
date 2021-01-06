package com.web.book.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.support.SessionStatus;

import com.web.book.model.BookBean;
import com.web.book.model.BookReportBean;
import com.web.book.model.MemberBean;
import com.web.book.service.BookReportService;
import com.web.book.service.SearchService;

@Controller
@RequestMapping("/BookReport")
@SessionAttributes(value = { "loginUser" })
public class BookReportController {

	@Autowired
	BookReportService bookReportService;

	@Autowired
	SearchService searchService;

	private Integer bookId = 0;
	private Integer page = 0;
	private String searchType = null;
	MemberBean loginUser;

	@ModelAttribute
	public void setLoginUser(Model model, SessionStatus status) {
		loginUser = (MemberBean) model.getAttribute("loginUser");
		
	}

	@GetMapping("/{br_ID}")
	public String homeBookReport(@PathVariable("br_ID") Integer br_ID) {
		return "BookReport/BookReport";
		
	}

	@GetMapping("/EditBookReport")
	public String memberBookReport(Model model) {
		return "BookReport/EditBookReport";
	}

	@GetMapping("/searchBookReport/{searchType}/{page}")
	public String searchBookReport(
			@PathVariable("searchType") String searchType,
			@PathVariable("page") Integer page) {
		
		this.page = page;
		this.searchType = searchType;
		
		return "BookReport/searchBookReport";
	}

	@PostMapping("/EditBookReport/getBookReportList")
	@ResponseBody
	public List<Map<String, Object>> bookReportList() {
		List<Map<String, Object>> book = new ArrayList<>();
		List<BookReportBean> memberBookReport = bookReportService.bookReportMemberAllList(loginUser.getMb_ID());
		for (BookReportBean bookReportBean : memberBookReport) {
			Map<String, Object> data = new HashMap<>();
			data.put("br_ID", bookReportBean.getBr_ID());
			data.put("bk_Name", bookReportBean.getBook().getBk_Name());
			data.put("bk_Author", bookReportBean.getBook().getBk_Author());
			data.put("br_Score", bookReportBean.getBr_Score());
			data.put("br_DateTime", String.valueOf(bookReportBean.getBr_DateTime()));
			data.put("bk_Pic", bookReportBean.getBook().getBk_Pic());
			book.add(data);
		}

		return book;
	}

	@PostMapping("/EditBookReport/deleteBookReport/{br_ID}")
	@ResponseBody
	public String deleteBookReport(@PathVariable("br_ID") Integer br_ID) {
		bookReportService.deleteBookReport(br_ID);
		return "true";
	}

	@PostMapping("/EditBookReport/getBookReport/{br_ID}")
	@ResponseBody
	public Map<String, Object> getBookReport(@PathVariable("br_ID") Integer br_ID) {
		BookReportBean bookReport = bookReportService.getBookReport(br_ID);
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
	public String upDateBookReport(@RequestParam(value = "br_ID", required = true) Integer br_ID,
			@RequestParam(value = "br_Score", required = true) Integer br_Score,
			@RequestParam(value = "br_Content", required = true) String br_Content) {

		bookReportService.upDateBookReportData(br_ID, br_Score, br_Content);

		return "true";
	}

	@PostMapping("/addBookReport/{bk_ID}")
	public String addBookReport(@PathVariable("bk_ID") Integer bk_ID) {
		bookId = bk_ID;
		return "BookReport/addBookReport";
	}

	@PostMapping("/addBookReport/bookInfo")
	@ResponseBody
	public Map<String, Object> gotoPage() {

		BookBean result = searchService.getBook(bookId);
		Map<String, Object> info = new HashMap<>();
		info.put("bk_Name", result.getBk_Name());
		info.put("bk_Author", result.getBk_Author());
		info.put("bk_Pic", result.getBk_Pic());
		info.put("bk_Publish", result.getBk_Publish());
		info.put("bk_Translator", result.getBk_Translator());
		info.put("userAccount", loginUser.getMb_Account());
		bookId = 0;

		return info;
	}

	@PostMapping("/addBookReport/addReport")
	@ResponseBody
	public Boolean addBookReport(@RequestParam(value = "bk_ID", required = true) Integer bk_ID,
			@RequestParam(value = "br_Score", required = true) Integer br_Score,
			@RequestParam(value = "br_Content", required = true) String br_Content,
			@RequestParam(value = "br_Name", required = true) String br_Name) {

		bookReportService.insertBookReport(loginUser.getMb_ID(), bk_ID, br_Name, br_Score, br_Content);
		return true;
	}

	@PostMapping("/checkBookReport")
	@ResponseBody
	public Boolean checkBookReport(@RequestParam(value = "bk_ID", required = true) Integer bkId) {

		return bookReportService.checkBookReport(loginUser.getMb_ID(), bkId);
	}

	@PostMapping("/viewBookReport/{br_ID}")
	@ResponseBody
	public Map<String, Object> viewBookReport(@PathVariable("br_ID") Integer br_ID) {
		BookReportBean bookReport = bookReportService.getBookReport(br_ID);
		Map<String, Object> data = new HashMap<>();
		data.put("br_DateTime", bookReport.getBr_DateTime());
		data.put("br_Content", bookReport.getBr_Content());
		data.put("br_Score", bookReport.getBr_Score());
		data.put("br_Name", bookReport.getBr_Name());
		data.put("bk_Name", bookReport.getBook().getBk_Name());
		data.put("bk_Author", bookReport.getBook().getBk_Author());
		data.put("bk_Pic", bookReport.getBook().getBk_Pic());
		data.put("bk_Translator", bookReport.getBook().getBk_Translator());
		data.put("bk_Publish", bookReport.getBook().getBk_Publish());
		data.put("userAccount", bookReport.getMember().getMb_Account());

		return data;
	}

	@PostMapping("/allBookReport")
	@ResponseBody
	public List<Map<String, Object>> viewAllBookReport() {

		List<Map<String, Object>> bookReport = new ArrayList<>();
		List<BookReportBean> memberBookReport = bookReportService.allbookReportList();
		for (BookReportBean bookReportBean : memberBookReport) {
			Map<String, Object> data = new HashMap<>();
			data.put("br_ID", bookReportBean.getBr_ID());
			data.put("br_Name", bookReportBean.getBr_Name());
			data.put("bk_Name", bookReportBean.getBook().getBk_Name());
			data.put("bk_Author", bookReportBean.getBook().getBk_Author());
			data.put("br_Score", bookReportBean.getBr_Score());
			data.put("bk_Publish", bookReportBean.getBook().getBk_Publish());
			data.put("br_DateTime", new SimpleDateFormat("yyyy-MM-dd").format(bookReportBean.getBr_DateTime()));
			data.put("bk_Pic", bookReportBean.getBook().getBk_Pic());
			data.put("loginUser", bookReportBean.getMember().getMb_Account());
			bookReport.add(data);
		}
		return bookReport;
	}
	
	@PostMapping("/serchBookReportPage")
	@ResponseBody
	public Map<String,Object> searchBookReportPage() {
		
		Map<String, Object>  data = new HashMap<>();
		List<Map<String, Object>> bookReport = new ArrayList<>();
		List<BookReportBean> searchBookReport = bookReportService.getSearchBookRepotData(searchType, page);
		for (BookReportBean bookReportBean : searchBookReport) {
			Map<String, Object> searchData = new HashMap<>();
			searchData.put("br_ID", bookReportBean.getBr_ID());
			searchData.put("br_Name", bookReportBean.getBr_Name());
			searchData.put("bk_Name", bookReportBean.getBook().getBk_Name());
			searchData.put("bk_Author", bookReportBean.getBook().getBk_Author());
			searchData.put("br_Score", bookReportBean.getBr_Score());
			searchData.put("bk_Publish", bookReportBean.getBook().getBk_Publish());
			searchData.put("br_DateTime", new SimpleDateFormat("yyyy-MM-dd").format(bookReportBean.getBr_DateTime()));
			searchData.put("bk_Pic", bookReportBean.getBook().getBk_Pic());
			searchData.put("loginUser", bookReportBean.getMember().getMb_Account());
			bookReport.add(searchData);
		}
		
		data.put("pageSize", bookReportService.getSearchPageSize(searchType));
		data.put("searchType", searchType);
		data.put("searchPage", page);
		data.put("searchData", bookReport);
		
		page = 0;
		searchType = null;
		
		return data;
	}
	
	@PostMapping("/addSub/{brId}")
	@ResponseBody
	public Boolean addSub(@PathVariable("brId") Integer brId) {
		
		return bookReportService.addSubReport(brId, loginUser.getMb_ID());
	}

}
