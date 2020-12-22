package com.web.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.service.SearchService;

@Controller
public class SearchBookController {
	String name = null;

	@Autowired
	SearchService searchService;

	// 查詢書籍關鍵字
	@GetMapping("/searchbook")
	public String gotoSearch(Model model, @RequestParam(value = "name") String name) {
		List<BookBean> result = searchService.searchBook(name);
		model.addAttribute("searchresult", result);
		return "SearchBook/Result";
	}

	// 在查詢結果頁加入收藏
	@SuppressWarnings("unused")
	@GetMapping("/resultcollect")
	public String gotoCollect(Model model, @RequestParam(value = "collect") Integer bk_id) {
		int mb_id = 5;
		int result2 = searchService.savebc(bk_id, mb_id);

		// 導回原來頁面（不可行，抓到的不是上面方法中的name）
		List<BookBean> result = searchService.searchBook(name);
		model.addAttribute("searchresult", result);
		return "SearchBook/Result";
	}

	// 取得單一本書的詳細資訊
	@GetMapping("/bookpage")
	public String gotoPage(Model model, @RequestParam(value = "page") Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("pageresult", result);
		return "SearchBook/Page";
	}

	// 會員收藏清單
	@GetMapping("/collectlist")
	public String gotoList(Model model, @RequestParam(value = "list") Integer mb_id) {
		mb_id = 5;
		List<BookCollectBean> result = searchService.gotoCollect(mb_id);
		model.addAttribute("collectresult", result);
		return "SearchBook/Collect";
	}
		
	// 刪除收藏項目
	@SuppressWarnings("unused")
	@GetMapping("/deletecollect")
	public String gotoDelete(Model model, @RequestParam(value = "deletebc") Integer bc_id) {
		int result2 = searchService.delete(bc_id);
		
		//導回原本頁面（抓不到）
		int mb_id=5; //先寫死
		List<BookCollectBean> result = searchService.gotoCollect(mb_id);
		model.addAttribute("collectresult", result);
		return "SearchBook/Collect";
	}

	// 在單獨頁面加入收藏
	@SuppressWarnings("unused")
	@GetMapping("/pagecollect")
	public String gotoPageCollect(Model model, @RequestParam(value = "pagecollect") Integer bk_id) {
		int mb_id = 5;
		int result2 = searchService.savebc(bk_id, mb_id);
		
		//導回原本頁面（抓不到？）
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("pageresult", result);
		return "SearchBook/Page";
	}
	
	
	// 前往修改書籍頁面
	@GetMapping("/updatebook")
	public String gotoUpdate(Model model, 
			@RequestParam(value = "update",required=false) Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("pageresult", result);
		return "SearchBook/Update";
	}
	
	// 最終更新頁面
	@PostMapping("/updatebook")
	public String gotoUpdateFin(Model model, 
			@ModelAttribute("pageresult")BookBean result,
			@RequestParam(value="bk_ID",required=false) Integer bk_ID,
			RedirectAttributes attr) {
		attr.addAttribute("page",bk_ID);
		searchService.updatebk(result);
		return "redirect:/bookpage";
//		return "SearchBook/Page";
	}

	//點選轉到漂流瓶的第一個頁面
	@RequestMapping(value = "SearchBook/Search")
	public String serchPage(Model model) {	
		return "SearchBook/Search";
	}
}
