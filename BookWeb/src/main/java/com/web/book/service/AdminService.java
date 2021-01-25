package com.web.book.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	// 取得所有心得數量
	List<Map<String, Object>> getAllBookReport();
	
	// 取得所有書籍資訊
	List<Map<String, Object>> getAllBook();
	
	// 獲得所有活動資料
	List<Map<String, Object>> getAllAct();
	
	// 獲得所有討論版資料
	List<Map<String, Object>> getAllPost();
	
	// 獲得所有購物資料
	List<Map<String, Object>> getAllStrore();
	
	// 獲取單一書本資訊
	Map<String, Object> getBookInfo(Integer bkId);
	
	// 取得單一討區資料
	Map<String, Object> getPostInfo(Integer postId);
	
	// 取得單一活動資料
	Map<String, Object> getActInfo(Integer actId);
	
	// 獲得近半年心得撰寫報表
	Map<String, Object> getMonthReportWrite();
	
	// 獲得近半年心得瀏覽報表
	Map<String,Object> getMonthReportView();
	
	// 取得近半年撰寫貼文數量
	Map<String, Object>  getMonthPostWrite();
	
	// 取得近半年貼文點擊數量
	Map<String, Object>  getMonthPostView();
	
	// 書籍類型(共九大類)分別有多少藏書的比例圖
	Map<String, Object> getBookTpyeTable();
	
	// 取得每半年註冊會員數量
	Map<String, Object>  getRegistereMonth();
	
	// 取得註冊會員男女比例
	Map<String, Object>  getSexRatio();
	
	// 取得活動類別比例
	Map<String, Object>  getActCategoryRatio();
	
	// 獲得近半年活動參與人數
	Map<String, Object>  getActMonthNumberOfParticipants();
		
	// 刪除指定心得
	Boolean deleteBookReport(Integer brId);
	
	// 刪除指定書書籍
	Boolean deleteBook(Integer bkID);
	
	//刪除指定貼文
	Boolean deletePost(Integer postId);
	
	//刪除指定活動
	Boolean deleteAct(Integer actId);

	
	
	
}
