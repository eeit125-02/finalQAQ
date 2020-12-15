package com.web.book.dao;

import java.util.List;

import com.web.book.model.BookReportBean;

public interface BookReportDao {
	
	List<BookReportBean> bookReportMemberAllList(Integer mb_ID);
	
	List<BookReportBean> bookReportBookAllList(Integer bk_ID);
	
	BookReportBean getBookReport(Integer br_ID);
	
	void deleteBookReport(Integer br_ID);
	
	void upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content );
	
	void insertBookReport(int mb_ID, int bk_ID, int br_Score, String br_Content);
}
