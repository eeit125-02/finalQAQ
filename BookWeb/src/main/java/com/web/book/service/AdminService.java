package com.web.book.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	//  刪除指定心得
	Boolean deleteBookReport(Integer brId);
	
	// 獲得每月心得撰寫數量
	Map<String, Object> getMonthReportWrite();
	
	// 獲得每月心得瀏覽數量
	Map<String,Object> getMonthReportView();
	
	// 取得所有心得數量
	List<Map<String, Object>> getAllBookReport();
	
	// 取得所有書籍
	List<Map<String, Object>> getAllBook();
}
