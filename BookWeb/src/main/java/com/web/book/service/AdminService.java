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
	
	// 刪除指定心得
	Boolean deleteBookReport(Integer brId);
	
	// 刪除指定書書籍
	Boolean deleteBook(Integer bkID);
	
	//刪除指定貼文
	Boolean deletePost(Integer postId);
	
	//刪除指定活動
	Boolean deleteAct(Integer actId);

	
	
	
}
