package com.web.book.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.book.model.BookBean;
import com.web.book.model.Book_COLLECTBean;
import com.web.book.service.SearchService;

@Controller
public class SearchBookController {
	String name = null;

	@Autowired
	SearchService searchService;
	
//	@GetMapping("Search")
//	public String Search( Model model, HttpServletRequest request) {
//		
//		return "SearchBook/Search";
//	}

	// 查詢書籍關鍵字
	@RequestMapping(value = "/searchbook", params = { "name" })
	public String gotoSearch(Model model, @RequestParam(value = "name") String name) {
		List<BookBean> result = searchService.searchBook(name);
		model.addAttribute("searchresult", result);
		return "SearchBook/Result";
	}

	// 在查詢結果頁加入收藏
	@SuppressWarnings("unused")
	@RequestMapping(value = "/resultcollect", params = { "collect" })
	public String gotoCollect(Model model, @RequestParam(value = "collect") Integer bk_id) {
		int mb_id = 5;
		int result2 = searchService.savebc(bk_id, mb_id);

		// 導回原來頁面（不可行，抓到的不是上面方法中的name）
		List<BookBean> result = searchService.searchBook(name);
		model.addAttribute("searchresult", result);
		return "SearchBook/Result";
	}

	// 取得單一本書的詳細資訊
	@RequestMapping(value = "/bookpage", params = { "page" })
	public String gotoPage(Model model, @RequestParam(value = "page") Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("pageresult", result);
		return "SearchBook/Page";
	}

	// 會員收藏清單
	@RequestMapping(value = "/collectlist", params = { "list" })
	public String gotoList(Model model, @RequestParam(value = "list") Integer mb_id) {
		mb_id = 5;
		List<Book_COLLECTBean> result = searchService.gotoCollect(mb_id);
		model.addAttribute("collectresult", result);
		return "SearchBook/Collect";
	}

		
	// 刪除收藏項目
	@SuppressWarnings("unused")
	@RequestMapping(value = "/deletecollect", params = { "deletebc" })
	public String gotoDelete(Model model, @RequestParam(value = "deletebc") Integer bc_id) {
		int result2 = searchService.delete(bc_id);
		
		//導回原本頁面（抓不到）
		int mb_id=5; //先寫死
		List<Book_COLLECTBean> result = searchService.gotoCollect(mb_id);
		model.addAttribute("collectresult", result);
		return "SearchBook/Collect";
	}

	
	// 在單獨頁面加入收藏
	@SuppressWarnings("unused")
	@RequestMapping(value = "/pagecollect", params = { "name" })
	public String gotoPageCollect(Model model, @RequestParam(value = "name") Integer bk_id) {
		int mb_id = 5;
		int result2 = searchService.savebc(bk_id, mb_id);
		
		//導回原本頁面（抓不到？）
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("pageresult", result);
		return "SearchBook/Page";
	}
	
	
	// 前往修改書籍頁面
	@RequestMapping(value = "/updatebook", params = { "update" })
	public String gotoUpdate(Model model, @RequestParam(value = "update") Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("bookresult", result);
		return "SearchBook/Update";
	}

	
	// 最終更新頁面
	@SuppressWarnings("unused")
	@RequestMapping(value = "/confirmupdate", params = {"id", "bookname", "bookauthor", "bookpublish", "bookdate", "bookcontent" })
	public String gotoUpdateFin(Model model, 
			@RequestParam(value = "id") Integer bk_ID,
			@RequestParam(value = "bookname") String bk_Name,
			@RequestParam(value = "bookauthor") String bk_Author, 
			@RequestParam(value = "bookpublish") String bk_Publish, 
			@RequestParam(value = "bookdate") Date bk_Date,			
			@RequestParam(value = "bookcontent") String bk_Content
			) {
		//暫未設值
		String bk_BookType=null;
		String bk_Translator=null;
		String bk_ISBN=null;
		String bk_Pic=null;
		String bk_Language=null;
		Integer bk_Price=null;
		String bk_Publisher_Place=null;
		Integer bk_Page=null;
		BookBean result=new BookBean(bk_ID, bk_Name, bk_BookType, bk_Author, bk_Translator, bk_Publish, bk_ISBN, 
				bk_Date, bk_Pic, bk_Language, bk_Price, bk_Page, bk_Publisher_Place, bk_Content);
		int count= searchService.updatebk(result);

		//導回原本頁面（抓不到？）
				BookBean result1 = searchService.getBook(bk_ID);
				model.addAttribute("pageresult", result1);
				return "SearchBook/Page";
		}
	
}
