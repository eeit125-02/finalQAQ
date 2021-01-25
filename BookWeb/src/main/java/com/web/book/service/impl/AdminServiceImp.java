package com.web.book.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.ActDao;
import com.web.book.dao.AdminDao;
import com.web.book.dao.BookReportDao;
import com.web.book.dao.DiscussionDao;
import com.web.book.model.ActBean;
import com.web.book.model.BookBean;
import com.web.book.model.BookReportBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.PostBean;
import com.web.book.service.AdminService;

@Service
@Transactional
public class AdminServiceImp implements AdminService {

	@Autowired
	BookReportDao bookReportDao;
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	DiscussionDao discussionDao;
	
	@Autowired
	ActDao actDao;
	
	
	// 取得所有心得資訊
	@Override
	public List<Map<String, Object>> getAllBookReport() {
		
		List<Map<String, Object>> bookReportTable = new ArrayList<>();
		List<BookReportBean> bookReports = bookReportDao.allbookReportList();
		
		for (BookReportBean bookReport : bookReports) {
			
			Map<String, Object> data = new HashMap<>();
			data.put("brId", bookReport.getBr_ID());
			data.put("brName", bookReport.getBr_Name());
			data.put("brTime", new SimpleDateFormat("yyyy-MM-dd").format(bookReport.getBr_DateTime()));
			data.put("mbAccount", bookReport.getMember().getMb_Account());
			
			bookReportTable.add(data);
		}
		
		return bookReportTable;
	}

	// 會取所有的書籍資料
	@Override
	public List<Map<String, Object>> getAllBook() {
		
		List<Map<String, Object>> bookTable = new ArrayList<>();
		List<BookBean> books = adminDao.getAllbook();
		
		for (BookBean book : books) {
			Map<String, Object> data = new HashMap<>();
			data.put("bkName", book.getBk_Name());
			data.put("bkId", book.getBk_ID());
			data.put("bkAuthor",book.getBk_Author());
			data.put("bkPublish", book.getBk_Publish());
			data.put("bkDate", String.valueOf(book.getBk_Date()));
			bookTable.add(data);
		}
		
		return bookTable;
	}


	// 製作近半年撰寫報表
	@Override
	public Map<String,Object> getMonthReportWrite() {
		
		List<Object> selectData = adminDao.getMonthReportWrite();
		Map<String, Object> returnData = new HashMap<>();
		
		List<String> monthList = new ArrayList<>();
		List<Integer> monthNumberList = new ArrayList<>();
		for(int i= 5; 0 <= i; i-- ){
			Object[] maxDay = (Object[])selectData.get(0);

			Integer thisMonth;
			Integer thisYear;

			if( (Integer.valueOf(maxDay[1].toString()) - i) <= 0) {
				
				thisYear = Integer.valueOf(maxDay[0].toString()) - 1;
				thisMonth = 12 + (Integer.valueOf( maxDay[1].toString()) - i);
			}else {
				
				thisYear = Integer.valueOf(maxDay[0].toString());
				thisMonth = Integer.valueOf(maxDay[1].toString())-i;
			}
			Object[] value;
			for(int j = 5; 0 <= j; j-- ) {
				 try {
						value = (Object[]) selectData.get(j);
					} catch (Exception e) {
						value = (Object[]) selectData.get(0);
					}
				if( Integer.valueOf( value[0].toString()).equals(thisYear) && Integer.valueOf( value[1].toString()).equals(thisMonth)) {
					monthList.add(value[0].toString()+ "-" + value[1].toString());
				    monthNumberList.add(Integer.valueOf(value[2].toString()));
				    break;
			    }else if (j == 0){
			    	monthList.add(thisYear + "-" + thisMonth);
				    monthNumberList.add(0);
				}
			}
		}
		
		returnData.put("month", monthList);
		returnData.put("monthNumber", monthNumberList);
		
		return returnData;
	}

	// 製作近半年瀏覽報表
	@Override
	public Map<String,Object> getMonthReportView() {
		
		List<Object> selectData = adminDao.getMonthReportViews();
		Map<String, Object> returnData = new HashMap<>();
		
		List<String> monthList = new ArrayList<>();
		List<Integer> monthNumberList = new ArrayList<>();
		for(int i= 5; 0 <= i; i-- ){
			Object[] maxDay = (Object[])selectData.get(0);

			Integer thisMonth;
			Integer thisYear;

			if( (Integer.valueOf(maxDay[1].toString()) - i) <= 0) {
				
				thisYear = Integer.valueOf(maxDay[0].toString()) - 1;
				thisMonth = 12 + (Integer.valueOf( maxDay[1].toString()) - i);
			}else {
				
				thisYear = Integer.valueOf(maxDay[0].toString());
				thisMonth = Integer.valueOf(maxDay[1].toString())-i;
			}
			Object[] value;
			for(int j = 5; 0 <= j; j-- ) {
				try {
					value = (Object[]) selectData.get(j);
				} catch (Exception e) {
					value = (Object[]) selectData.get(0);
				}
				
				if( Integer.valueOf( value[0].toString()).equals(thisYear) && Integer.valueOf( value[1].toString()).equals(thisMonth)) {
					monthList.add(value[0].toString()+ "-" + value[1].toString());
				    monthNumberList.add(Integer.valueOf(value[2].toString()));
				    break;
			    }else if (j == 0){
			    	monthList.add(thisYear + "-" + thisMonth);
				    monthNumberList.add(0);
				}
			}
		}
		
		returnData.put("month", monthList);
		returnData.put("viewNumber", monthNumberList);
		
		return returnData;
	}

	// 獲得所有活動資料
	@Override
	public List<Map<String, Object>> getAllAct() {
		
		List<Map<String, Object>> actTable = new ArrayList<>();
		List<ActBean> acts = adminDao.getAllAct();
		 
		for (ActBean act : acts) {
			
			Map<String, Object> data = new HashMap<>();
			data.put("actName",act.getact_Name());
			data.put("actTime", String.valueOf(act.getact_Date()));
			data.put("actId", act.getact_ID());
			
			actTable.add(data);
		}
		
		return actTable;
	}

	// 獲得所有討論版資料
	@Override
	public List<Map<String, Object>> getAllPost() {
		List<Map<String, Object>> postTable = new ArrayList<>();
		List<PostBean> posts = adminDao.getAllPost();
		
		for(PostBean post : posts) {
			
			Map<String, Object> data = new HashMap<>();
			data.put("psotId", post.getPost_id());
			data.put("memberAcount", post.getMemberbean().getMb_Account());
			data.put("postTime", post.getPost_time());
			data.put("postTitle",post.getPost_title());
			
			postTable.add(data);
		}
		
		return postTable;
	}

	// 獲得所有購物資料
	@Override
	public List<Map<String, Object>> getAllStrore() {
		
		List<Map<String, Object>> storeTable = new ArrayList<>();
		List<BookStoreBean> stores = adminDao.getAllStrore();
		
		for ( BookStoreBean store : stores) {
			
			Map<String, Object> data = new HashMap<>();
			data.put("bsId", store.getBks_ID());
			data.put("bsDate", store.getBs_Date());
			data.put("bkName", store.getBook().getBk_Name());
			data.put("bsPrice", store.getBs_Price());
			data.put("bsAccount", store.getMember().getMb_Account());
			storeTable.add(data);
		}
		
		return storeTable;
	}

	// 取得書本資訊並轉換為JSON格式
	@Override
	public Map<String, Object> getBookInfo(Integer bkId) {
		
		BookBean book = adminDao.getBook(bkId);
		
		Map<String, Object> returnJson = new HashMap<>();
		returnJson.put("bkDate", String.valueOf(book.getBk_Date()));
		returnJson.put("bkType", book.getBk_BookType());
		returnJson.put("bkPic", book.getBk_Pic());
		returnJson.put("bkLan", book.getBk_Language());
		returnJson.put("bkISBN", book.getBk_ISBN());
		returnJson.put("bkPublish", book.getBk_Publish());
		returnJson.put("bkAuthor", book.getBk_Author());
		returnJson.put("bkContent", book.getBk_Content());
		returnJson.put("bkName", book.getBk_Name());
		returnJson.put("bkPage", book.getBk_Page());
		returnJson.put("bkTranslator", book.getBk_Translator());
		returnJson.put("bkPublisherPlace", book.getBk_Publisher_Place());
		
		return returnJson;
	}
	

	// 取得貼文資訊並轉換為JSON格式
	@Override
	public Map<String, Object> getPostInfo(Integer postId) {
		
		PostBean post =  discussionDao.getPostBeanById(postId);
		
		Map<String, Object> returnJson = new HashMap<>();
		returnJson.put("postContent", post.getPost_content());
		returnJson.put("postTime", post.getPost_time());
		returnJson.put("postMember", post.getMemberbean().getMb_Account());
		returnJson.put("postTitle", post.getPost_title());
		
		return returnJson;
	}
	
	// 取得活動資訊並轉換為JSON格式
	@Override
	public Map<String, Object> getActInfo(Integer actId) {
		
		ActBean act = actDao.getAct(actId);
		
		Map<String, Object> returnJson = new HashMap<>();
		returnJson.put("actImage", act.getact_Image());
		returnJson.put("actIntro", act.getact_Intro());
		returnJson.put("actTheme", act.getact_Theme());
		returnJson.put("actDate", act.getact_Date());
		returnJson.put("actTime", act.getact_Time());
		returnJson.put("actLoc", act.getact_Loc());
		returnJson.put("actName", act.getact_Name());
		returnJson.put("actPlace", act.getact_Place());
		returnJson.put("actPax", act.getact_Pax());
		returnJson.put("actDifferentpax", act.getAct_Differentpax());
		return returnJson;
	}
	
	// 刪處指定心得
	@Override
	public Boolean deleteBookReport(Integer brId) {
		
		bookReportDao.deleteBookReport(brId);
		
		return true;
	}
	
	// 刪除圖書資料
	@Override
	public Boolean deleteBook(Integer bkID) {
		
		return adminDao.deleteBook(bkID);
	}

	// 刪除貼文資料
	@Override
	public Boolean deletePost(Integer postId) {
		
		return adminDao.deletePost(postId);
	}

	// 刪除活動資料
	@Override
	public Boolean deleteAct(Integer actId) {
		
		return adminDao.deleteAct(actId);
	}

	// 取得每半年心得貼文數量
	@Override
	public Map<String, Object> getMonthPostWrite() {
		List<Object> selectData = adminDao.getMonthPostWrite();
		Map<String, Object> returnData = new HashMap<>();
		
		List<String> monthList = new ArrayList<>();
		List<Integer> monthNumberList = new ArrayList<>();
		for(int i= 5; 0 <= i; i-- ){
			Object[] maxDay = (Object[])selectData.get(0);

			Integer thisMonth;
			Integer thisYear;

			if( (Integer.valueOf(maxDay[1].toString()) - i) <= 0) {
				
				thisYear = Integer.valueOf(maxDay[0].toString()) - 1;
				thisMonth = 12 + (Integer.valueOf( maxDay[1].toString()) - i);
			}else {
				
				thisYear = Integer.valueOf(maxDay[0].toString());
				thisMonth = Integer.valueOf(maxDay[1].toString())-i;
			}
			Object[] value;
			for(int j = 5; 0 <= j; j-- ) {
				 try {
						value = (Object[]) selectData.get(j);
					} catch (Exception e) {
						value = (Object[]) selectData.get(0);
					}
				if( Integer.valueOf( value[0].toString()).equals(thisYear) && Integer.valueOf( value[1].toString()).equals(thisMonth)) {
					monthList.add(value[0].toString()+ "-" + value[1].toString());
				    monthNumberList.add(Integer.valueOf(value[2].toString()));
				    break;
			    }else if (j == 0){
			    	monthList.add(thisYear + "-" + thisMonth);
				    monthNumberList.add(0);
				}
			}
		}
		
		returnData.put("month", monthList);
		returnData.put("monthNumber", monthNumberList);
		
		return returnData;
	}

	// 取得半年貼文點擊數量
	@Override
	public Map<String, Object> getMonthPostView() {
		List<Object> selectData = adminDao.getMonthPostView();
		Map<String, Object> returnData = new HashMap<>();
		
		List<String> monthList = new ArrayList<>();
		List<Integer> monthNumberList = new ArrayList<>();
		for(int i= 5; 0 <= i; i-- ){
			Object[] maxDay = (Object[])selectData.get(0);

			Integer thisMonth;
			Integer thisYear;

			if( (Integer.valueOf(maxDay[1].toString()) - i) <= 0) {
				
				thisYear = Integer.valueOf(maxDay[0].toString()) - 1;
				thisMonth = 12 + (Integer.valueOf( maxDay[1].toString()) - i);
			}else {
				
				thisYear = Integer.valueOf(maxDay[0].toString());
				thisMonth = Integer.valueOf(maxDay[1].toString())-i;
			}
			Object[] value;
			for(int j = 5; 0 <= j; j-- ) {
				try {
					value = (Object[]) selectData.get(j);
				} catch (Exception e) {
					value = (Object[]) selectData.get(0);
				}
				
				if( Integer.valueOf( value[0].toString()).equals(thisYear) && Integer.valueOf( value[1].toString()).equals(thisMonth)) {
					monthList.add(value[0].toString()+ "-" + value[1].toString());
				    monthNumberList.add(Integer.valueOf(value[2].toString()));
				    break;
			    }else if (j == 0){
			    	monthList.add(thisYear + "-" + thisMonth);
				    monthNumberList.add(0);
				}
			}
		}
		
		returnData.put("month", monthList);
		returnData.put("viewNumber", monthNumberList);
		
		return returnData;
	}

	// 書籍類型(共九大類)分別有多少藏書的比例圖
	@Override
	public Map<String, Object> getBookTpyeTable() {
		List<Object> selectData = adminDao.getBookTpyeTable();
		Map<String, Object> returnData = new HashMap<>();
		
		List<String> monthList = new ArrayList<>();
		List<Integer> monthNumberList = new ArrayList<>();
		
		Object[] value;
		for(int i = 0; i < selectData.size(); i++ ) {
			
			value = (Object[]) selectData.get(i);
			monthList.add(value[0].toString());
		    monthNumberList.add(Integer.valueOf(value[1].toString()));
			   
		    
		}
		returnData.put("month", monthList);
		returnData.put("viewNumber", monthNumberList);
		System.out.println(returnData);
		return returnData;
	}

	@Override
	public Map<String, Object> getRegistereMonth() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getSexRatio() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getActCategoryRatio() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getActMonthNumberOfParticipants() {
		// TODO Auto-generated method stub
		return null;
	}
}
