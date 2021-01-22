package com.web.book.dao;

import java.util.List;

public interface AdminDao {
	
	// 獲得半年心得撰寫數量 
	List<Object> getMonthReportWrite();
	
	// 獲得半年心得瀏覽數量
	List<Object> getMonthReportViews();
}
