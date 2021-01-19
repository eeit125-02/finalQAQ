package com.web.book.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private String pageType = null;
	
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
		page = 1;
		pageType = "main";
		List<BookStoreBean> list = bookStoreService.searchBookStore(page);
		model.addAttribute("store", list);
		model.addAttribute("pageSize", bookStoreService.getAllSearchBookStoreSize());
		model.addAttribute("pageNow", page);
		model.addAttribute("pageType", pageType);
		return "/Transation/qaqMain";
	}
	
	// 商店首頁搜尋書名
	@GetMapping("qaqSBookName")
	public String qaqSBookName(Model model,
			@RequestParam(value = "sBkNe") String bk_Name
			) {
		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page);
		page = 1;
		pageType = bk_Name;
		model.addAttribute("store", list);
		model.addAttribute("pageSize", bookStoreService.getSearchStoreBookNameSize(bk_Name));
		model.addAttribute("pageNow", page);
		model.addAttribute("pageType", pageType);
		return "/Transation/qaqMain";
	}
	
	// 分頁
	@GetMapping("qaqTest/{pageType}/{page}")
	public String qaqNextPage(Model model,
			@PathVariable Integer page,
			@PathVariable String pageType,
			@RequestParam(value = "sBkNe", required = false) String bk_Name
			) {
		if(pageType.equals("main") ) {
			List<BookStoreBean> list = bookStoreService.searchBookStore(page);
			model.addAttribute("pageSize", bookStoreService.getAllSearchBookStoreSize());
			model.addAttribute("store", list);
		}else {
			List<BookStoreBean> list = bookStoreService.searchStoreBookName(pageType, page);
			model.addAttribute("store", list);
			model.addAttribute("pageSize", bookStoreService.getSearchStoreBookNameSize(pageType));
		}
		model.addAttribute("pageNow", page);
		model.addAttribute("pageType", pageType);
		return "/Transation/qaqMain";
	}

	// 點擊首頁圖片和書名
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
		List<Map<String, Object>> bookPrices = new ArrayList<>();
		List<BookStoreBean> manyPrice = bookStoreService.bookPrices(bk_ID);
		for (BookStoreBean bookStoreBean : manyPrice) {
			Map<String, Object> data = new HashMap<>();
			data.put("bk_Pic", bookStoreBean.getBook().getBk_Pic());
			data.put("bks_ID", bookStoreBean.getBks_ID());
			data.put("bk_Name", bookStoreBean.getBook().getBk_Name());
			data.put("bk_Author", bookStoreBean.getBook().getBk_Author());
			data.put("bk_Publish", bookStoreBean.getBook().getBk_Publish());
			data.put("bk_PublishDate", bookStoreBean.getBook().getBk_Date());
			data.put("mb_Account", bookStoreBean.getMember().getMb_Account());
			data.put("bs_Price", bookStoreBean.getBs_Price());
			data.put("bs_Num", bookStoreBean.getBs_Num());
			data.put("mb_Name", bookStoreBean.getMember().getMb_Name());
			data.put("bs_Date", new SimpleDateFormat("yyyy-MM-dd").format(bookStoreBean.getBs_Date()));
			bookPrices.add(data);
		}
		model.addAttribute("bookPrices", bookPrices);
		return "Transation/qaqManyPrice";
	}
	
	// 前往單一賣家的賣場
	@GetMapping("/myStore")
	public String myStore(Model model) {
		List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}
	
	// 新增賣場搜尋出來的結果新增
		@PostMapping("/addBook")
		public String addOneBook(Model model,
				@RequestParam(value = "qaqBkID", required = false) Integer bk_ID,
				@RequestParam(value = "qtyNew", required = false) Integer bs_Num,
				@RequestParam(value = "priceNew", required = false) Integer bs_Price			
				) {
			bookStoreService.addBookName(bs_Num, bs_Price, bk_ID, loginUser.getMb_ID());
			List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
			model.addAttribute("myBookList", list);
			return "/Transation/myStore";
		}

	@PostMapping("/QAQbook")
	public String QAQ(Model model, @RequestParam(value = "updatebk") Integer bks_ID,
			@RequestParam(value = "price") Integer bs_Price, @RequestParam(value = "qty") Integer bs_Num) {
		bookStoreService.updateBookStore(bks_ID, bs_Num, bs_Price);
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

	@PostMapping("/addMyBook")
	public String qaq(Model model) {
		String type = "work"; 
		model.addAttribute("searchType", type);
		return "/Transation/addMyStore";
	}

	@PostMapping("/searchBookName")
	public String searchBookName(Model model, @RequestParam(value = "searchbk") String bk_Name) {
		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page);
		model.addAttribute("bookName", list);
		return "/Transation/addMyStore";
	}
	
	// 搜尋時ajax
	@GetMapping("/Transation/qaqBookName")
	@ResponseBody
	public List<Map<String, Object>> qaqBookName(@RequestParam(value = "qaqBookName", required = false) String bk_Name
	){
		List<Map<String, Object>> bookList = new ArrayList<>();
		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page);
		for (BookStoreBean bookStoreBean : list) {
			Map<String, Object> data = new HashMap<>();
			data.put("bk_ID", bookStoreBean.getBook().getBk_ID());
			data.put("bk_Pic", bookStoreBean.getBook().getBk_Pic());
			data.put("bk_Name", bookStoreBean.getBook().getBk_Name());
			data.put("bk_Author", bookStoreBean.getBook().getBk_Author());
			data.put("bk_Publish", bookStoreBean.getBook().getBk_Publish());
			data.put("bk_Date", bookStoreBean.getBook().getBk_Date());
			bookList.add(data);
		}
		return bookList;
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
