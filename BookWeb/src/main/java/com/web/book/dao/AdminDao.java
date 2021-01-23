package com.web.book.dao;

import java.util.List;

import com.web.book.model.ActBean;
import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.PostBean;

public interface AdminDao {
	
	// 獲得半年心得撰寫數量 
	List<Object> getMonthReportWrite();
	
	// 獲得半年心得瀏覽數量
	List<Object> getMonthReportViews();
	
	// 獲得所有書籍資料
	List<BookBean> getAllbook();
	
	// 獲得所有活動資料
	List<ActBean> getAllAct();
	
	// 獲得所有討論版資料
	List<PostBean> getAllPost();
	
	// 獲得所有購物資料
	List<BookStoreBean> getAllStrore();
	
	// 獲取書籍資料
	BookBean getBook(Integer bkId);
	
	// 刪除書籍資料
	Boolean deleteBook(Integer bkId);
	
}
