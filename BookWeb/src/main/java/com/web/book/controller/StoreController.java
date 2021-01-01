package com.web.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.service.BookStoreService;
import com.web.book.service.GlobalService;
import com.web.book.service.SearchService;

@Controller
public class StoreController {

	@Autowired
	BookStoreService bookStoreService;
	@Autowired
	SearchService searchService;

//  最終呈現首頁製作中
	@GetMapping("qaqTest")
	public String qaqmainPage(Model model) {
//		List<BookBean> list = bookStoreService.searchBookStore();
//		model.addAttribute("bookstore", list);
		return "/Transation/qaqMain";
	}

	@GetMapping("/Transation/storeMain")
	public String mainPage(Model model) {
		List<BookBean> list = bookStoreService.searchBookStore();
		model.addAttribute("bookstore", list);
		return "/Transation/storeMain";
	}

	@GetMapping("/detail")
	public String detail(Model model, @RequestParam(value = "selectbk") Integer bk_ID) {
		BookBean book = bookStoreService.getBookDetail(bk_ID);
		model.addAttribute("bookdetail", book);
		return "/Transation/detail";
	}

	@GetMapping("/myStore")
	public String myStore(Model model) {
		Integer mb_ID = 13;
		List<BookStoreBean> list = bookStoreService.searchMemberStore(mb_ID);
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}

	@PostMapping("/updateOrDelete")
	public String updateOrDelete(Model model, @RequestParam(value = "waitupbk", defaultValue = "0") Integer bks_ID1,
			@RequestParam(value = "deletebk", defaultValue = "0") Integer bks_ID) {
		if (bks_ID1 != 0 && bks_ID == 0) {
			BookStoreBean bookStore = bookStoreService.getOneBookStore(bks_ID1);
			model.addAttribute("bookStore", bookStore);
			return "/Transation/myUpdateStore";
		} else {
			bookStoreService.deleteBookStore(bks_ID);
			Integer mb_ID = 13;
			List<BookStoreBean> list = bookStoreService.searchMemberStore(mb_ID);
			model.addAttribute("myBookList", list);
			return "/Transation/myStore";
		}
	}

	@PostMapping("/QAQbook")
	public String QAQ(Model model, @RequestParam(value = "updatebk") Integer bks_ID,
			@RequestParam(value = "price") Integer bs_Price, @RequestParam(value = "qty") Integer bs_Num) {
		System.out.println("1." + bks_ID);
		System.out.println("2." + bs_Price);
		System.out.println("3." + bs_Num);
		bookStoreService.updateBookStore(bks_ID, bs_Num, bs_Price);
		Integer mb_ID = 13;
		List<BookStoreBean> list = bookStoreService.searchMemberStore(mb_ID);
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}

	@PostMapping("/addMyBook")
	public String qaq(Model model) {
		return "/Transation/addMyStore";
	}

	@PostMapping("/searchBookName")
	public String searchBookName(Model model, @RequestParam(value = "searchbk") String bk_Name) {
		List<BookBean> list = bookStoreService.searchBookName(bk_Name);
		model.addAttribute("bookName", list);
		return "/Transation/addMyStore";
	}

	@PostMapping("/addBook")
	public String addOneBook(Model model, HttpServletRequest request) {
		String a = request.getParameter("setbk");
		bookStoreService.addBookName(Integer.parseInt(request.getParameter(a + "qty")),
				Integer.parseInt(request.getParameter(a + "price")), Integer.parseInt(request.getParameter("setbk")),
				13);
		Integer mb_ID = 13;
		List<BookStoreBean> list = bookStoreService.searchMemberStore(mb_ID);
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}

	@GetMapping("/addMyBookA")
	public String addMyBookA(Model model) {
		BookBean book = new BookBean();
		model.addAttribute("newBook", book);
		return "/Transation/addMyBook";
	}

	@PostMapping("/addMyBookB")
	public String addMyBookB(Model model, @ModelAttribute("newBook") BookBean book, @RequestParam("price") Integer qwe,
			@RequestParam("qty") Integer asd, @RequestParam CommonsMultipartFile file) {
		// 圖片上傳用
		try {
			book.setBk_Pic(GlobalService.saveImage("Shopping", file, book.getBk_Name()));
		} catch (IOException e) {
			System.out.println("發生錯誤了!!!");
			e.printStackTrace();
		}
		searchService.savebk(book);
		bookStoreService.addBookName(asd, qwe, book.getBk_ID(), 13);
		return "redirect:/myStore";
	}

}
