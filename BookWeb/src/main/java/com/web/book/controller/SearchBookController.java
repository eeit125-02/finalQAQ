package com.web.book.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.soap.SoapFaultException;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;
import com.web.book.model.MemberBean;
import com.web.book.model.SearchTypeBean;
import com.web.book.service.GlobalService;
import com.web.book.service.SearchService;

@Controller
@SessionAttributes(value = {"loginUser"})
public class SearchBookController {
	//查詢關鍵字
	String keyword = null;
	//類型關鍵字清單
	List<Integer> typelist=new ArrayList<Integer>();
	//主類型清單
	List<SearchTypeBean> maintype= new ArrayList<SearchTypeBean>();
	//查詢結果
	List<BookBean> finalresult = new ArrayList<BookBean>();
	//資料總筆數
	int count=0;
	//資料總頁數
	int totalpage=0;
	//(起始)頁數
	private Integer page = 1;
	
	@Autowired
	SearchService searchService;

//	// 查詢書籍關鍵字
//	@GetMapping("/searchbook")
//	public String gotoSearch(
//			Model model
//			, @RequestParam(value = "name", required=false) String bookname
//			, @RequestParam(value = "author", required=false) String authorname
//			, @RequestParam(value = "publish", required=false) String publishname
//			) {
//		
//		List<BookBean> result = new ArrayList<BookBean>();
//		int count=1;
//		
//		if(bookname!=null) {
//			result = searchService.searchBook(bookname);			
//			count=result.size(); //資料總筆數
//		}else if(authorname!=null) {
//			result = searchService.searchBookAuthor(authorname);			
//			count=result.size(); //資料總筆數
//		}else if(publishname!=null) {
//			result = searchService.searchBookPublish(publishname);			
//			count=result.size(); //資料總筆數
//		}else{
//			
//		}
//		
//		model.addAttribute("searchresult", result);
//		model.addAttribute("searchresultnumber", count);
//		if(count==0) {
//			model.addAttribute("searchresultzero", "很抱歉，查無資料");			
//		}else {
//		
//		int page=1; //第一頁
//		int perpage=10; //每頁筆數
//		int totalPages = count % perpage == 0 ? count / perpage : count / perpage+ 1;//總頁數
//		
//		Integer lastnum = count%perpage;
//		if(page==totalPages && lastnum != 0) {
//			perpage = lastnum; 
//		}
//		//本頁起始使用者序號
//		int beginIndex = (page - 1) * perpage;
//		//本頁末尾使用者序號的下一個
//		int endIndex = beginIndex + perpage;
//		model.addAttribute("count", count);
//		model.addAttribute("perpage", perpage);
//		model.addAttribute("totalPages", totalPages);
//		model.addAttribute("beginIndex", beginIndex);
//		model.addAttribute("endIndex", endIndex);
//		model.addAttribute("page", page);
//		model.addAttribute("bookname1", bookname);
//		model.addAttribute("bookname2", authorname);
//		model.addAttribute("bookname3", publishname);
//		}
//		return "SearchBook/Result";
//	}
//		
//	
////單項查詢後載入分頁
//	@GetMapping("/searchbook/{nowpage}")
//	public String Search(
//			Model model
//			,@RequestParam(value = "bookname1", required=false) String bookname
//			,@RequestParam(value = "bookname3", required=false) String publishname
//			,@RequestParam(value = "bookname2", required=false) String authorname
//			,@PathVariable(value = "nowpage") Integer nowpage
//			) {
//		List<BookBean> result = new ArrayList<BookBean>();
//		int count=1;
//		if(!bookname.isEmpty()) {
//			result = searchService.searchBook(bookname);			
//			count=result.size(); //資料總筆數
//			System.out.println(bookname+"!!!");
//		}else if(!authorname.isEmpty()) {
//			result = searchService.searchBookAuthor(authorname);			
//			count=result.size(); //資料總筆數
//			System.out.println(authorname+"???");
//		}else if(!publishname.isEmpty()) {
//			result = searchService.searchBookPublish(publishname);			
//			count=result.size(); //資料總筆數
//			System.out.println(publishname+"~~~");
//		}else{
//			
//		}
//		
//		model.addAttribute("searchresult", result);
//		model.addAttribute("searchresultnumber", count);
//
//		int page=nowpage; //當前頁
//		int perpage=10; //每頁筆數
//		int totalPages = count % perpage == 0 ? count / perpage : count / perpage+ 1; //總頁數
//		
//		Integer lastnum = count%perpage;
//		if(nowpage==totalPages && lastnum != 0) {
//			perpage = lastnum; 
//		}
//		
//		//本頁起始使用者序號
//		int beginIndex = (page - 1) * perpage;
//		//本頁末尾使用者序號的下一個
//		int endIndex = beginIndex + perpage;
//		model.addAttribute("count", count);
//		model.addAttribute("perpage", perpage);
//		model.addAttribute("totalPages", totalPages);
//		model.addAttribute("beginIndex", beginIndex);
//		model.addAttribute("endIndex", endIndex);
//		model.addAttribute("page", page);
//		model.addAttribute("bookname1", bookname);
//		model.addAttribute("bookname2", authorname);
//		model.addAttribute("bookname3", publishname);
//		return "SearchBook/Result";
//	}
//	
//	=============================================================

		
		// 關鍵字+類型搜尋結果(純導向)
		@GetMapping("/searchtype")
		public String gotoSearchType(Model model
				, @RequestParam(value = "b", required=false) List<Integer> reslist
				, @RequestParam(value = "name", required=false) String bookname
				, @RequestParam(value = "author", required=false) String authorname
				, @RequestParam(value = "publish", required=false) String publishname
				, @RequestParam(value = "apage", required=false,defaultValue = "1") Integer nowpage
				) {
			
			if ("".equals(bookname)) {
				bookname=null;}			
			if ("".equals(authorname)) {
				authorname=null;}			
			if ("".equals(publishname)) {
				publishname=null;}
			
			if(nowpage!=null) {
				page=nowpage;}
			
			if(bookname!=null) { //書名關鍵字
				keyword=bookname;
				finalresult = searchService.searchBook(keyword,page);
				totalpage=searchService.getResultPage();
				count=searchService.getResultNumber();
			}else if(authorname!=null) { //作者關鍵字
				keyword=authorname;
				finalresult = searchService.searchBookAuthor(keyword,page);
				totalpage=searchService.getResultPage();
				count=searchService.getResultNumber();
			}else if(publishname!=null) { //出版社關鍵字
				keyword=publishname;
				finalresult = searchService.searchBookPublish(keyword,page);
				totalpage=searchService.getResultPage();
				count=searchService.getResultNumber();
			}else if(reslist!=null) { //類型關鍵字
				typelist=reslist;
				finalresult=searchService.searchBookType(typelist,page);
				totalpage=searchService.getResultPage();
				count=searchService.getResultNumber();
			}else if(typelist!=null) {	
				finalresult=searchService.searchBookType(typelist,page);
				totalpage=searchService.getResultPage();
				count=searchService.getResultNumber();
			}else{
				
			}
			System.out.println("out");
			model.addAttribute("count", count);
			model.addAttribute("name", bookname);
			model.addAttribute("author", authorname);
			model.addAttribute("publish", publishname);
			model.addAttribute("b", reslist);
			model.addAttribute("apage",nowpage);
			
			if(count==0) { //資料總筆數確認
				model.addAttribute("searchresultzero", "很抱歉，查無資料");			
			}
						
			return "SearchBook/Result2";
		}
		
		//導出關鍵字+類型搜尋結果
		@PostMapping("/searchtype/loadBookTypeList")
		public @ResponseBody Map<String,Object> gotoSearchTypeFin(Model model) {
			//存放頁數與最終搜尋結果list的變數
			Map<String, Object>  data = new HashMap<>();
			//存放最終搜尋結果list的變數
			List<Map<String, Object>> book = new ArrayList<>();
			System.out.println("finalresult"+finalresult);
			for (BookBean bookBean : finalresult) {
				Map<String, Object> finaldata = new HashMap<>();
				finaldata.put("bk_ID", bookBean.getBk_ID());
				finaldata.put("bk_Name", bookBean.getBk_Name());
				finaldata.put("bk_Author", bookBean.getBk_Author());
				finaldata.put("bk_Publish", bookBean.getBk_Publish());
				finaldata.put("bk_Date",String.valueOf(bookBean.getBk_Date()));
				finaldata.put("bk_Pic", bookBean.getBk_Pic());
				finaldata.put("bk_Content", bookBean.getBk_Content());
				book.add(finaldata);
			}
			data.put("totalpage", totalpage);
			data.put("nowpage", page);
			data.put("finaldata", book);
			finalresult=null;
//			typelist=null;
			keyword=null;
			count=0;
			totalpage=0;
			page=1;
		    return data;
		}
		
		
		
		
		
		
	
	// 在查詢結果頁判斷收藏
	@GetMapping("/searchbook/checkcollect/{bk_ID}")
	public @ResponseBody boolean gotoCheckCollect(@PathVariable("bk_ID") Integer bk_id, @ModelAttribute("loginUser") MemberBean loginUser) {
		boolean result2=searchService.checkbc(bk_id, loginUser.getMb_ID());
		return result2;
	}
	
	// 在查詢結果頁加入收藏
	@GetMapping("/searchbook/resultcollect/{bk_ID}")
	public @ResponseBody boolean gotoCollect(@PathVariable("bk_ID") Integer bk_id, @ModelAttribute("loginUser") MemberBean loginUser) {
		boolean result2 = searchService.savebc(bk_id, loginUser.getMb_ID());
		return result2;
	}
	

	// 取得單一本書的詳細資訊(含類型)
	@GetMapping("/bookpage")
	public String gotoPage(Model model, @RequestParam(value = "page") Integer bk_id
			, @ModelAttribute("loginUser") MemberBean loginUser) {
		BookBean result = searchService.getBook(bk_id);
		
		System.out.println("**************************"+result.getBk_Click());
//		result.setBk_Click(result.getBk_Click()+1);
		searchService.addclick(bk_id);
		System.out.println("**************************"+result.getBk_Click());
		model.addAttribute("pageresult", result);
		List<BookTypeBean> result2=searchService.getBookType(bk_id);
		model.addAttribute("pageresulttype", result2);		
		
		boolean a=gotoCheckCollect(bk_id, loginUser);
		if(a==true) {
			model.addAttribute("havebc", a);					
		}			
		
		return "SearchBook/Page";
	}

	
	// 會員收藏清單(純導向)
	@GetMapping("/collectlist")
	public String gotoList(Model model) {
		return "SearchBook/Collect";
	}
	// 導出收藏清單
	@PostMapping("/collectlist/getBookCollectList")
	@ResponseBody
	public List<Map<String, Object>> gotoList(@ModelAttribute("loginUser") MemberBean loginUser) {	
		List<Map<String, Object>> book = new ArrayList<>();
		List<BookCollectBean> result = searchService.gotoCollect(loginUser.getMb_ID());
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
	
	
	
	// 刪除書籍
	@SuppressWarnings("unused")
	@GetMapping("/deletebook")
	public String gotoDeleteBook(Model model, @RequestParam(value = "delete") Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		boolean result2 = searchService.deletebk(result);
		return "SearchBook/Search";
	}
	
	
	
	// 刪除收藏項目
	@GetMapping("/collectlist/deletecollect/{bc_ID}")
	public @ResponseBody boolean gotoDelete(@PathVariable("bc_ID") Integer bc_id) {
		boolean result2 = searchService.delete(bc_id);
		return result2;
	}

//	// 在單獨頁面加入收藏
//	@GetMapping("/pagecollect")
//	public String gotoPageCollect(Model model, @RequestParam(value = "pagecollect") Integer bk_id, 
//			@ModelAttribute("loginUser") MemberBean loginUser,RedirectAttributes attr) {
//		boolean result2 = searchService.savebc(bk_id, loginUser.getMb_ID());
//		//導回原本頁面
////		BookBean result = searchService.getBook(bk_id);
////		model.addAttribute("pageresult", result);
////		model.addAttribute("pageresult2", result2);
////		return "SearchBook/Page";
//		attr.addAttribute("page",bk_id);
//		attr.addAttribute("loginUser",loginUser);
//		return "redirect:/bookpage";
//	}
	
	
	// 前往新增書籍頁面
	@GetMapping("/addnewbook")
	public String gotoAddnewbook(Model model) {
		BookBean result = new BookBean();
		List<SearchTypeBean> alltype= searchService.getAllBookType();
		maintype.add(alltype.get(0));
		maintype.add(alltype.get(9));
		maintype.add(alltype.get(17));
		maintype.add(alltype.get(27));
		maintype.add(alltype.get(36));
		maintype.add(alltype.get(46));
		maintype.add(alltype.get(56));
		maintype.add(alltype.get(62));
		maintype.add(alltype.get(69));

		model.addAttribute("maintype", maintype);
		model.addAttribute("newonebook", result);
		return "SearchBook/Addnewbook";
	}
	
	// 在查詢結果頁加入收藏
	@PostMapping("/searchbook/secondarytype/{categoryId}")
	public @ResponseBody List<SearchTypeBean> getSecondarytype(@PathVariable("categoryId") Integer categoryId) {
		List<SearchTypeBean> secondtype= new ArrayList<SearchTypeBean>();
		List<SearchTypeBean> alltype= searchService.getAllBookType();
		
		if(categoryId==1) {
			secondtype.add(alltype.get(1));
			secondtype.add(alltype.get(2));
			secondtype.add(alltype.get(3));
			secondtype.add(alltype.get(4));
			secondtype.add(alltype.get(5));
			secondtype.add(alltype.get(6));
			secondtype.add(alltype.get(7));
			secondtype.add(alltype.get(8));
		}else if(categoryId==10) {
			secondtype.add(alltype.get(10));
			secondtype.add(alltype.get(11));
			secondtype.add(alltype.get(12));
			secondtype.add(alltype.get(13));
			secondtype.add(alltype.get(14));
			secondtype.add(alltype.get(15));
			secondtype.add(alltype.get(16));
		}else if(categoryId==18) {
			secondtype.add(alltype.get(18));
			secondtype.add(alltype.get(19));
			secondtype.add(alltype.get(20));
			secondtype.add(alltype.get(21));
			secondtype.add(alltype.get(22));
			secondtype.add(alltype.get(23));
			secondtype.add(alltype.get(24));
			secondtype.add(alltype.get(25));
			secondtype.add(alltype.get(26));
		}else if(categoryId==28) {
			secondtype.add(alltype.get(28));
			secondtype.add(alltype.get(29));
			secondtype.add(alltype.get(30));
			secondtype.add(alltype.get(31));
			secondtype.add(alltype.get(32));
			secondtype.add(alltype.get(33));
			secondtype.add(alltype.get(34));
			secondtype.add(alltype.get(35));
		}else if(categoryId==37) {
			secondtype.add(alltype.get(37));
			secondtype.add(alltype.get(38));
			secondtype.add(alltype.get(39));
			secondtype.add(alltype.get(40));
			secondtype.add(alltype.get(41));
			secondtype.add(alltype.get(42));
			secondtype.add(alltype.get(43));
			secondtype.add(alltype.get(44));
			secondtype.add(alltype.get(45));
		}else if(categoryId==47) {
			secondtype.add(alltype.get(47));
			secondtype.add(alltype.get(48));
			secondtype.add(alltype.get(49));
			secondtype.add(alltype.get(50));
			secondtype.add(alltype.get(51));
			secondtype.add(alltype.get(52));
			secondtype.add(alltype.get(54));
			secondtype.add(alltype.get(55));
		}else if(categoryId==57) {
			secondtype.add(alltype.get(57));
			secondtype.add(alltype.get(58));
			secondtype.add(alltype.get(59));
			secondtype.add(alltype.get(60));
		}else if(categoryId==63) {
			secondtype.add(alltype.get(63));
			secondtype.add(alltype.get(64));
			secondtype.add(alltype.get(65));
			secondtype.add(alltype.get(66));
			secondtype.add(alltype.get(67));
			secondtype.add(alltype.get(68));
		}else if(categoryId==70) {
			secondtype.add(alltype.get(70));
			secondtype.add(alltype.get(72));
			secondtype.add(alltype.get(73));
			secondtype.add(alltype.get(75));
			secondtype.add(alltype.get(76));
			secondtype.add(alltype.get(77));
		}
		return secondtype;
	}
	
	// 最終新增頁面
	@PostMapping("/addnewbook")
	public String gotoAddnewbookFin(Model model, 
			@ModelAttribute("newonebook")BookBean result,
			@RequestParam(value = "types", required = false) List<Integer> tylist,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file,
			HttpServletRequest request,
			RedirectAttributes attr) throws Exception {
		// 圖片上傳用
		GlobalService.saveImage("booksearch", file, result.getBk_Name());
		result.setBk_Pic(GlobalService.saveImage("booksearch", file, result.getBk_Name()));
		result.setBk_Click(0);
		BookBean finalresult=searchService.savebk(result);
		for(Integer i : tylist) {
			if(i == 0) {
				attr.addAttribute("page",finalresult.getBk_ID());
				return "redirect:/bookpage";
			}
		}
		searchService.savebkty(tylist, result.getBk_ID());
		
		attr.addAttribute("page",finalresult.getBk_ID());
		return "redirect:/bookpage";
	}
	
	// 前往修改書籍頁面
	@GetMapping("/updatebook")
	public String gotoUpdate(Model model, 
			@RequestParam(value = "update",required=false) Integer bk_id) {
		BookBean result = searchService.getBook(bk_id);
		List<SearchTypeBean> alltype= searchService.getAllBookType();
		List<BookTypeBean> result2=searchService.getBookType(bk_id);
		model.addAttribute("pageresult", result);
		model.addAttribute("pageresulttype", result2);
		maintype.add(alltype.get(0));
		maintype.add(alltype.get(9));
		maintype.add(alltype.get(17));
		maintype.add(alltype.get(27));
		maintype.add(alltype.get(36));
		maintype.add(alltype.get(46));
		maintype.add(alltype.get(56));
		maintype.add(alltype.get(62));
		maintype.add(alltype.get(69));
		model.addAttribute("maintype", maintype);
		return "SearchBook/Update";
	}
	
	// 最終更新頁面
	@PostMapping("/updatebook")
	public String gotoUpdateFin(Model model, 
			@ModelAttribute("pageresult")BookBean result,
			@RequestParam(value = "types", required = false) List<Integer> tylist,
			@RequestParam(value="bk_ID",required=false) Integer bk_ID,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file, HttpServletRequest request,
			RedirectAttributes attr) throws Exception {
		// 圖片上傳用
		String img=GlobalService.saveImage("booksearch", file, result.getBk_Name());
		result.setBk_Pic(img);
		searchService.updatebk(result);
		for(Integer i : tylist) {
			if(i == 0) {
				attr.addAttribute("page",bk_ID);
				return "redirect:/bookpage";
			}
		}
		searchService.savebkty(tylist, result.getBk_ID());
		
		attr.addAttribute("page",bk_ID);
		return "redirect:/bookpage";
	}

	//點選轉到漂流瓶的第一個頁面
	@RequestMapping(value = "SearchBook/Search")
	public String serchPage(Model model) {	
		return "SearchBook/Search";
	}
}
