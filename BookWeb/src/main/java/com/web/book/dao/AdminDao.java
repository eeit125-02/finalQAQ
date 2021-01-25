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
	
	// 取得每半年心得貼文數量
	List<Object> getMonthPostWrite();
	
	// 取得近半年貼文點擊數量
	List<Object> getMonthPostView();
	
	// 書籍類型(共九大類)分別有多少藏書的比例圖
	List<Object> getBookTpyeTable();
	
	// 取得每半年註冊會員數量
	List<Object> getRegistereMonth();
	
	// 取得註冊會員男女比例
	List<Object> getSexRatio();
	
	// 取得活動類別比例
	List<Object> getActCategoryRatio();
	
	// 獲得近半年活動參與人數
	List<Object> getActMonthNumberOfParticipants();
	
	// 獲得所有書籍資料
	List<BookBean> getAllbook();
	
	// 獲得所有活動資料
	List<ActBean> getAllAct();
	
	// 獲得所有討論版資料
	List<PostBean> getAllPost();
	
	// 獲得所有購物資料
	List<BookStoreBean> getAllStrore();
	
	// 取得每半年成交量數量
	List<Object> getStoreMonthPsc();
	
	// 取得每半年成交金額
	List<Object> getStoreMonthPrice();
	
	// 獲取書籍資料
	BookBean getBook(Integer bkId);
	
	// 刪除書籍資料
	Boolean deleteBook(Integer bkId);
	
	//刪除指定討論版
	Boolean deletePost(Integer postId);
	
	//刪除指定活動
	Boolean deleteAct(Integer bksId);
	
	
}
