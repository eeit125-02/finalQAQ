package com.web.book.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.AdminDao;
import com.web.book.dao.BookReportDao;
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
	
	// 刪處指定心得
	@Override
	public Boolean deleteBookReport(Integer brId) {
		
		bookReportDao.deleteBookReport(brId);
		
		return true;
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
			
			for(int j = 5; 0 <= j; j-- ) {
				 Object[] value = (Object[]) selectData.get(j);
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
			
			for(int j = 5; 0 <= j; j-- ) {
				 Object[] value = (Object[]) selectData.get(j);
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

	// 取得資訊並轉換為Json
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
	
	// 刪除圖書資料
	@Override
	public Boolean deleteBook(Integer bkID) {
		
		return adminDao.deleteBook(bkID);
	}

}
