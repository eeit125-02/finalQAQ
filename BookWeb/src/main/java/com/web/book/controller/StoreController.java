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
import com.web.book.model.ShoppingCartBean;
import com.web.book.service.BookStoreService;
import com.web.book.service.GlobalService;
import com.web.book.service.SearchService;
import com.web.book.service.ShoppingCartService;

@Controller
@SessionAttributes(value = { "loginUser" })
public class StoreController {

	private Integer page = 1;
	private String pageType = null;

	@Autowired
	BookStoreService bookStoreService;
	
	@Autowired
	ShoppingCartService cartService;
	
	@Autowired
	SearchService searchService;

	MemberBean loginUser;

	@ModelAttribute
	public void setLoginUser(Model model, SessionStatus status) {
		loginUser = (MemberBean) model.getAttribute("loginUser");
	}
	
	@GetMapping(value = "testPage")
	public String testPage(Model model) {
		cartService.deleteAllCart(loginUser.getMb_ID());
//管理者測試頁面
//		BookStoreBean store = bookStoreService.getOneBookStore(13061);
//		model.addAttribute("qaq", store);
//管理者測試頁面
		return "Transation/shoppingCart";
	}

	// 最終呈現首頁, 管理員a123456, ID=14
	@GetMapping("qaqTest")
	public String qaqMainPage(Model model) {
		page = 1;
		pageType = "main";
		List<BookStoreBean> list = bookStoreService.searchBookStore(page, 14);
		model.addAttribute("store", list);
		model.addAttribute("pageSize", bookStoreService.getAllSearchBookStoreSize(14));
		model.addAttribute("pageNow", page);
		model.addAttribute("pageType", pageType);
		return "/Transation/qaqMain";
	}

	// 商店首頁搜尋書名
	@GetMapping("qaqSBookName")
	public String qaqSBookName(Model model, @RequestParam(value = "sBkNe") String bk_Name) {
		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page, 14);
		page = 1;
		pageType = bk_Name;
		model.addAttribute("store", list);
		model.addAttribute("pageSize", bookStoreService.getSearchStoreBookNameSize(bk_Name, 14));
		model.addAttribute("pageNow", page);
		model.addAttribute("pageType", pageType);
		return "/Transation/qaqMain";
	}

	// 分頁, 管理員a123456, ID=14
	@GetMapping("qaqTest/{pageType}/{page}")
	public String qaqNextPage(Model model, @PathVariable Integer page, @PathVariable String pageType,
			@RequestParam(value = "sBkNe", required = false) String bk_Name) {
		if (pageType.equals("main")) {
			List<BookStoreBean> list = bookStoreService.searchBookStore(page, 14);
			model.addAttribute("pageSize", bookStoreService.getAllSearchBookStoreSize(14));
			model.addAttribute("store", list);
		} else {
			List<BookStoreBean> list = bookStoreService.searchStoreBookName(pageType, page, 14);
			model.addAttribute("store", list);
			model.addAttribute("pageSize", bookStoreService.getSearchStoreBookNameSize(pageType, 14));
		}
		model.addAttribute("pageNow", page);
		model.addAttribute("pageType", pageType);
		return "/Transation/qaqMain";
	}

	// 點擊首頁圖片和書名
	// 如果前端連結 1. 用 / 後端用PathVariable接 2. 用 ? 後端用RequestParam接
	@GetMapping("/qaqBookDetail/{bks_ID}")
	public String qaqBookDetail(Model model, @PathVariable Integer bks_ID) {
		BookStoreBean bookDetail = bookStoreService.getOneBookStore(bks_ID);
		model.addAttribute("bookdetail", bookDetail);
		return "Transation/detail";
	}

	// 一本書價錢區間畫面
	@GetMapping("/qaqManyPrice")
	public String qaqManyPrice(Model model, @RequestParam(value = "ID") Integer bk_ID) {
		List<Map<String, Object>> bookPrices = new ArrayList<>();
		List<BookStoreBean> manyPrice = bookStoreService.bookPrices(bk_ID);
		for (BookStoreBean bookStoreBean : manyPrice) {
			Map<String, Object> data = new HashMap<>();
			data.put("bk_ID", bookStoreBean.getBook().getBk_ID());
			data.put("bs_ID", bookStoreBean.getMember().getMb_ID());
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

	// 新增賣場搜尋出來的結果新增,藏在ajax裡form
	@PostMapping("/addBook")
	public String addOneBook(Model model, @RequestParam(value = "qaqBkID", required = false) Integer bk_ID,
			@RequestParam(value = "qtyNew", required = false) Integer bs_Num,
			@RequestParam(value = "priceNew", required = false) Integer bs_Price) {
		bookStoreService.insertSearchBookName(bs_Num, bs_Price, bk_ID, loginUser.getMb_ID());
		List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}

	// 點擊我要賣東西
	@PostMapping("addMyStore")
	public String goToStore(Model model) {
		return "/Transation/addMyStore";
	}

	// 搜尋時ajax
	@GetMapping("/Transation/addMyStore")
	@ResponseBody
	public Map<String, Object> qaqBookName(@RequestParam(value = "qaqBookName", required = false) String bk_Name,
			@RequestParam(value = "pageType", defaultValue = "search", required = true) String searchType,
			@RequestParam(value = "pageNow", defaultValue = "1", required = true) Integer searchPage) {
		page = searchPage;
		pageType = searchType;
		Map<String, Object> data = new HashMap<>();
		List<Map<String, Object>> bookList = new ArrayList<>();
		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page, 14);
		for (BookStoreBean bookStoreBean : list) {
			Map<String, Object> searchData = new HashMap<>();
			searchData.put("bk_ID", bookStoreBean.getBook().getBk_ID());
			searchData.put("bk_Pic", bookStoreBean.getBook().getBk_Pic());
			searchData.put("bk_Name", bookStoreBean.getBook().getBk_Name());
			searchData.put("bk_Author", bookStoreBean.getBook().getBk_Author());
			searchData.put("bk_Publish", bookStoreBean.getBook().getBk_Publish());
			searchData.put("bk_Date", bookStoreBean.getBook().getBk_Date());
			bookList.add(searchData);
		}
		data.put("pageSize", bookStoreService.getSearchStoreBookNameSize(bk_Name, 14));
		data.put("pageNow", page);
		data.put("pageType", pageType);
		data.put("searchData", bookList);
		return data;
	}

//	@GetMapping("/addMyStore")
//	@ResponseBody
//	public Map<String, Object> qaqBookNameDisplay(
//			@RequestParam(value = "qaqBookName", required = false) String bk_Name,
//			@RequestParam(value = "pageType", defaultValue = "search",required = true) String searchType,
//			@RequestParam(value = "pageNow", defaultValue = "1", required = true) Integer searchPage
//	){
//		page = searchPage;
//		pageType = searchType;
//		Map<String, Object> data = new HashMap<>();
//		List<Map<String, Object>> bookList = new ArrayList<>();
//		List<BookStoreBean> list = bookStoreService.searchStoreBookName(bk_Name, page, 14);
//		for (BookStoreBean bookStoreBean : list) {
//			Map<String, Object> searchData = new HashMap<>();
//			searchData.put("bk_ID", bookStoreBean.getBook().getBk_ID());
//			searchData.put("bk_Pic", bookStoreBean.getBook().getBk_Pic());
//			searchData.put("bk_Name", bookStoreBean.getBook().getBk_Name());
//			searchData.put("bk_Author", bookStoreBean.getBook().getBk_Author());
//			searchData.put("bk_Publish", bookStoreBean.getBook().getBk_Publish());
//			searchData.put("bk_Date", bookStoreBean.getBook().getBk_Date());
//			bookList.add(searchData);
//		}
//		data.put("pageSize", bookStoreService.getAllSearchBookStoreSize(14));
//		data.put("pageNow", page);
//		data.put("pageType", pageType);
//		data.put("searchData", bookList);
//		return data;
//	}
	// 新增書本 form:form
	@GetMapping("/addMyBookA")
	public String addMyBookA(Model model) {
		BookBean book = new BookBean();
		model.addAttribute("newBook", book);
		return "/Transation/addMyBook";
	}

	// 新增書本 form:form
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
		bookStoreService.insertSearchBookName(asd, qwe, book.getBk_ID(), loginUser.getMb_ID());
		bookStoreService.insertSearchBookName(asd, (qwe + 5000), book.getBk_ID(), 14);
		return "redirect:/myStore";
	}

	// 會員商店刪除自己商品
	@PostMapping("/deletebk")
	public String deletebk(Model model, @RequestParam(value = "bks_ID") Integer bks_ID) {
		bookStoreService.deleteBookStore(bks_ID);
		List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}

	// 會員商店更新自己商品
	@PostMapping("/updatebk")
	public String updatebk(Model model, @RequestParam(value = "updateBk", required = false) Integer bks_ID,
			@RequestParam(value = "bsPrice", required = false) Integer bs_Price,
			@RequestParam(value = "bsNum", required = false) Integer bs_Num) {
		bookStoreService.updateBookStore(bks_ID, bs_Num, bs_Price);
		List<BookStoreBean> list = bookStoreService.searchMemberStore(loginUser.getMb_ID());
		model.addAttribute("myBookList", list);
		return "/Transation/myStore";
	}

//  灌庫存值
//	@GetMapping("boobplay")
//	public String boob(Model model) {
//		bookStoreService.boobqaq();
//		return "redirect:/qaqTest";
//	}
}
