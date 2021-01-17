package com.web.book.controller;

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

import com.web.book.model.MemberBean;
import com.web.book.service.BookReportService;

@Controller
@RequestMapping("/BookReport")
@SessionAttributes(value = { "loginUser" })
public class BookReportController {

	@Autowired
	BookReportService bookReportService;


	MemberBean loginUser;

	@ModelAttribute
	public void setLoginUser(Model model, SessionStatus status) {
		loginUser = (MemberBean) model.getAttribute("loginUser");
		
	}

	@GetMapping("/{br_ID}")
	public String homeBookReport(
			@PathVariable("br_ID") Integer br_ID) {
		
		return "BookReport/BookReport";
	}

	@GetMapping("/EditBookReport")
	public String memberBookReport(Model model) {
		
		return "BookReport/EditBookReport";
	}

	@GetMapping("/searchBookReport/{searchType}/{page}")
	public String searchBookReport() {
		
		
		return "BookReport/searchBookReport";
	}

	@PostMapping("/EditBookReport/getBookReportList")
	@ResponseBody
	public List<Map<String, Object>> bookReportList() {
		
		return bookReportService.bookReportMemberAllList(loginUser.getMb_ID());
	}

	@PostMapping("/EditBookReport/deleteBookReport/{br_ID}")
	@ResponseBody
	public Boolean deleteBookReport(
			@PathVariable("br_ID") Integer br_ID) {
		
		return bookReportService.deleteBookReport(br_ID);
	}

	@PostMapping("/EditBookReport/getBookReport/{br_ID}")
	@ResponseBody
	public Map<String, Object> getBookReport(
			@PathVariable("br_ID") Integer br_ID) {
		
		return bookReportService.getBookReport(false , br_ID);
	}

	@PostMapping("/EditBookReport/upDateBookReport")
	@ResponseBody
	public Boolean upDateBookReport(
			@RequestParam(value = "br_ID", required = true) Integer br_ID,
			@RequestParam(value = "br_Score", required = true) Integer br_Score,
			@RequestParam(value = "br_Content", required = true) String br_Content) {

		return bookReportService.upDateBookReportData(br_ID, br_Score, br_Content);
	}

	@PostMapping("/addBookReport/{bk_ID}")
	public String addBookReport() {
		
		return "BookReport/addBookReport";
	}

	@PostMapping("/addBookReport/bookInfo/{bk_ID}")
	@ResponseBody
	public Map<String, Object> gotoPage(
			@PathVariable("bk_ID") Integer bkId) {

		return bookReportService.gotoPage(loginUser.getMb_ID() , bkId);
	}

	@PostMapping("/addBookReport/addReport")
	@ResponseBody
	public Boolean addBookReport(
			@RequestParam(value = "bk_ID", required = true) Integer bk_ID,
			@RequestParam(value = "br_Score", required = true) Integer br_Score,
			@RequestParam(value = "br_Content", required = true) String br_Content,
			@RequestParam(value = "br_Name", required = true) String br_Name) {

		return bookReportService.insertBookReport(loginUser.getMb_ID(), bk_ID, br_Name, br_Score, br_Content);
	}

	@PostMapping("/checkBookReport")
	@ResponseBody
	public Boolean checkBookReport(
			@RequestParam(value = "bk_ID", required = true) Integer bkId) {

		return bookReportService.checkBookReport(loginUser.getMb_ID(), bkId);
	}

	@PostMapping("/viewBookReport/{br_ID}")
	@ResponseBody
	public Map<String, Object> viewBookReport(
			@PathVariable("br_ID") Integer br_ID) {

		return bookReportService.getBookReport(true , br_ID);
	}

	@PostMapping("/allBookReport")
	@ResponseBody
	public List<Map<String, Object>> viewAllBookReport() {

		return bookReportService.allbookReportList();
	}
	
	@PostMapping("/serchBookReportPage")
	@ResponseBody
	public Map<String,Object> searchBookReportPage(
			@RequestParam(value = "searchType", required = true) String searchType,
			@RequestParam(value = "searchPage", required = true) Integer page) {
		
		return bookReportService.getSearchBookRepotData(searchType, page);
	}
	
	@PostMapping("/addSub/{brId}")
	@ResponseBody
	public String addSub(
			@PathVariable("brId") Integer brId) {
		
		return bookReportService.addSubReport(brId, loginUser.getMb_ID());
	}
	
	@PostMapping("/EditBookReport/getMemberCollectReport")
	@ResponseBody
	public List<Map<String, Object>> getMemberCollectReport(){
		
		return bookReportService.getMemberCollectReport(loginUser.getMb_ID());
	}
	
	@PostMapping("/EditBookReport/deleteCollectReport/{rcId}")
	@ResponseBody
	public Boolean deletCollectReport(
			@PathVariable("rcId") Integer rcId){
		
		return bookReportService.deleteCollectReport(rcId);
	}
	
	@PostMapping("/bookReportMessageList/{brId}")
	@ResponseBody
	public Map<String, Object> bookReportMessageList(
			@PathVariable("brId") Integer brId){
		
		return bookReportService.getBookReportMessageList(brId,  loginUser.getMb_ID());
	}
	
	@PostMapping("/EditBookReport/memberReportMessageList")
	@ResponseBody
	public List<Map<String, Object>> memberReportMessageList(){
		
		return bookReportService.getMemberBookReportMessageList(loginUser.getMb_ID());
	}
	
	@PostMapping("/addReportMessage")
	@ResponseBody
	public String addReportMessage(
			@RequestParam(value = "bmContent", required = true) String bmContent,
			@RequestParam(value = "brId", required = true) Integer brId) {
		
		return bookReportService.addReportMessage(brId, loginUser.getMb_ID(), bmContent);
	}
	
	@PostMapping("/deleteReportMessage")
	@ResponseBody
	public Boolean deleteReportMessage(
			@RequestParam(value = "bmId", required = true) Integer bmId) {
		
		return bookReportService.deletReportMessage(bmId);
	}
	
	
}
