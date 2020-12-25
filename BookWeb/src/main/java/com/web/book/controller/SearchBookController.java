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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;
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
	
	// 查詢書籍作者
	@GetMapping("/searchbookauthor")
	public String gotoSearchAuthor(Model model, @RequestParam(value = "author") String name) {
		List<BookBean> result = searchService.searchBookAuthor(name);
		model.addAttribute("searchresult", result);
		return "SearchBook/Result";
	}
	
	// 查詢書籍出版社
	@GetMapping("/searchbookpublish")
	public String gotoSearchPublish(Model model, @RequestParam(value = "publish") String name) {
		List<BookBean> result = searchService.searchBookPublish(name);
		model.addAttribute("searchresult", result);
		return "SearchBook/Result";
	}

	// 在查詢結果頁加入收藏
	@GetMapping("/searchbook/resultcollect/{bk_ID}")
	public @ResponseBody boolean gotoCollect(@PathVariable("bk_ID") Integer bk_id) {
		System.out.println(bk_id);
		int mb_id = 5;
		boolean result2 = searchService.savebc(bk_id, mb_id);
		return result2;
	}
	

	// 取得單一本書的詳細資訊(含類型)
	@GetMapping("/bookpage")
	public String gotoPage(Model model, @RequestParam(value = "page") Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("pageresult", result);
		List<BookTypeBean> result2=searchService.getBookType(bk_id);
		model.addAttribute("pageresulttype", result2);		
		return "SearchBook/Page";
	}

	
//	// 會員收藏清單(原版本)
//	@GetMapping("/collectlist")
//	public String gotoList(Model model, @RequestParam(value = "list") Integer mb_id) {
//		mb_id = 5;
//		List<BookCollectBean> result = searchService.gotoCollect(mb_id);
//		model.addAttribute("collectresult", result);
//		return "SearchBook/Collect";
//	}
	// 會員收藏清單(純導向)
	@GetMapping("/collectlist")
	public String gotoList(Model model) {
		return "SearchBook/Collect";
	}
	// 導出收藏清單
	@PostMapping("/collectlist/getBookCollectList/{mb_ID}")
	@ResponseBody
	public List<Map<String, Object>> gotoList(@PathVariable("mb_ID") Integer mb_id) {
		mb_id = 5;		
		List<Map<String, Object>> book = new ArrayList<>();
		List<BookCollectBean> result = searchService.gotoCollect(mb_id);
		System.out.println(mb_id);
		for (BookCollectBean bookCollectBean : result) {
			Map<String, Object> data = new HashMap<>();
			data.put("bc_ID", bookCollectBean.getBc_ID());
			data.put("bk_ID", bookCollectBean.getBook().getBk_ID());
			data.put("bk_Name", bookCollectBean.getBook().getBk_Name());
			data.put("bk_Author", bookCollectBean.getBook().getBk_Author());
			data.put("bk_Publish", bookCollectBean.getBook().getBk_Publish());
			data.put("bk_Date",String.valueOf(bookCollectBean.getBook().getBk_Date()));
			data.put("bk_Pic", bookCollectBean.getBook().getBk_Pic());
			data.put("bk_Content", bookCollectBean.getBook().getBk_Content());
			book.add(data);
		}
	    return book;   
	}
	
	
	
	
	
	
	
	
	
	
	// 刪除收藏項目
	@GetMapping("/collectlist/deletecollect/{bc_ID}")
	public @ResponseBody boolean gotoDelete(@PathVariable("bc_ID") Integer bc_id) {
		boolean result2 = searchService.delete(bc_id);
		return result2;
//		//導回原本頁面（抓不到）
//		int mb_id=5; //先寫死
//		List<BookCollectBean> result = searchService.gotoCollect(mb_id);
//		model.addAttribute("collectresult", result);
//		return "SearchBook/Collect";
	}

	// 在單獨頁面加入收藏
	@SuppressWarnings("unused")
	@GetMapping("/pagecollect")
	public String gotoPageCollect(Model model, @RequestParam(value = "pagecollect") Integer bk_id) {
		int mb_id = 5;
		boolean result2 = searchService.savebc(bk_id, mb_id);
		//導回原本頁面
		BookBean result = searchService.getBook(bk_id);
		model.addAttribute("pageresult", result);
		return "SearchBook/Page";
	}
	
	
	// 前往新增書籍頁面
	@GetMapping("/addnewbook")
	public String gotoAddnewbook(Model model) {
		BookBean result = new BookBean();
		model.addAttribute("newonebook", result);
		return "SearchBook/Addnewbook";
	}
	
	// 最終新增頁面
	@PostMapping("/addnewbook")
	public String gotoAddnewbookFin(Model model, 
			@ModelAttribute("newonebook")BookBean result,
			RedirectAttributes attr) {
		BookBean finalresult=searchService.savebk(result);
		attr.addAttribute("page",finalresult.getBk_ID());
		return "redirect:/bookpage";
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
	}

	//點選轉到漂流瓶的第一個頁面
	@RequestMapping(value = "SearchBook/Search")
	public String serchPage(Model model) {	
		return "SearchBook/Search";
	}
}
