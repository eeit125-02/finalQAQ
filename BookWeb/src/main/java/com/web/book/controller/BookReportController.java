package com.web.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.book.model.BookReportBean;
import com.web.book.service.BookReportService;

@Controller
public class BookReportController {
	
	@Autowired
	BookReportService bookReportService;
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	@ResponseBody
	public List<BookReportBean> editArea() {
		
		List<BookReportBean> memberBookReport = bookReportService.bookReportMemberAllList(5);
		System.out.println(memberBookReport);
		
	    return memberBookReport;   
	}
	
	@RequestMapping(value = "/bookReport" , method = {RequestMethod.POST})
	public String memberBookReport (Model model) {
		
		List<BookReportBean> memberBookReport = bookReportService.bookReportMemberAllList(5);
		model.addAttribute("bookReportList",memberBookReport);
		System.out.println(memberBookReport.size());
		
		return "BookReport/BookReport";
	}
	
}
