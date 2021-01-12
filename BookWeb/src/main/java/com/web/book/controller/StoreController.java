package com.web.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.MemberBean;
import com.web.book.service.BookStoreService;
import com.web.book.service.GlobalService;
import com.web.book.service.SearchService;

@Controller
@SessionAttributes(value = { "loginUser" })
public class StoreController {

	private Integer page = 1;
	
	@Autowired
	BookStoreService bookStoreService;
	@Autowired
	SearchService searchService;
	
	MemberBean loginUser;

	@ModelAttribute
	public void setLoginUser(Model model, SessionStatus status) {
		loginUser = (MemberBean) model.getAttribute("loginUser");
	}

	// 最終呈現首頁
	@GetMapping("qaqTest")
	public String qaqMainPage(Model model) {
		List<BookStoreBean> list = bookStoreService.searchBookStore(page);
		model.addAttribute("store", list);
		model.addAttribute("pageSize", bookStoreService.getAllSearchBookStoreSize());
		model.addAttribute("pageNow", page);
		page = 1;
		return "/Transation/qaqMain";
	}
	// 分頁
	@GetMapping("qaqTest/{page}")
	public String qaqNextPage(Model model,
			@PathVariable Integer page
			) {
		List<BookStoreBean> list = bookStoreService.searchBookStore(page);
		model.addAttribute("store", list);
		model.addAttribute("pageSize", bookStoreService.getAllSearchBookStoreSize());
		model.addAttribute("pageNow", page);
		return "/Transation/qaqMain";
	}

	// 如果前端連結 1. 用 / 後端用PathVariable接   2. 用 ? 後端用RequestParam接
	@GetMapping("/qaqBookDetail/{bks_ID}")
	public String qaqBookDetail(Model model,
			@PathVariable Integer bks_ID
			) {
		BookStoreBean bookDetail = bookStoreService.getOneBookStore(bks_ID);
		model.addAttribute("bookdetail", bookDetail);
		return "Transation/detail";
	}
	
	// 一本書價錢區間畫面
	@GetMapping("/qaqManyPrice")
	public String qaqManyPrice(Model model,
			@RequestParam(value = "ID") Integer bk_ID
			) {
		List<BookStoreBean> bookPrices = bookStoreService.bookPrices(bk_ID);
		model.addAttribute("bookPrices", bookPrices);
		return "Transation/qaqManyPrice";
	}
	
	@PostMapping("/detail")
	public String priceDetail(Model model, @RequestParam(value = "bks_ID") Integer bks_ID
			) {
		BookStoreBean bookDetail = bookStoreService.getOneBookStore(bks_ID);
		model.addAttribute("bookdetail", bookDetail);
		return "Transation/detail";
	}
	
	// 前往一本書的詳細頁面
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam(value = "selectbk") Integer bk_ID) {
		BookBean book = bookStoreService.getBookDetail(bk_ID);
		model.addAttribute("bookdetail", book);
		return "/Transation/detail";
	}
	
	// 商店首頁搜尋書名
	@GetMapping("qaqSBookName")
	public String qaqSBookName(Model model,
			@RequestParam(value = "sBkNe") String bk_Name
			) {
		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page);
		model.addAttribute("store", list);
		model.addAttribute("pageSize", bookStoreService.getSearchStoreBookNameSize(bk_Name));
		model.addAttribute("pageNow", page);
		page = 1;
		return "/Transation/qaqMain";
	}

	@GetMapping("/myStore")
	public String myStore(Model model) {
		List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
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
			List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
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
		List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}

	@PostMapping("/addMyBook")
	public String qaq(Model model) {
		return "/Transation/addMyStore";
	}

	@PostMapping("/searchBookName")
	public String searchBookName(Model model, @RequestParam(value = "searchbk") String bk_Name) {
		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page);
		model.addAttribute("bookName", list);
		return "/Transation/addMyStore";
	}

	@PostMapping("/addBook")
	public String addOneBook(Model model, HttpServletRequest request) {
		String a = request.getParameter("setbk");
		bookStoreService.addBookName(
				Integer.parseInt(request.getParameter(a + "qty")),
				Integer.parseInt(request.getParameter(a + "price")),
				Integer.parseInt(request.getParameter("setbk")),
				loginUser.getMb_ID()
				);
		List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
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
		bookStoreService.addBookName(asd, qwe, book.getBk_ID(), loginUser.getMb_ID());
		return "redirect:/myStore";
	}


//  灌庫存值
//	@GetMapping("boobplay")
//	public String boob(Model model) {
//		bookStoreService.boobqaq();
//		return "redirect:/qaqTest";
//	}
}
