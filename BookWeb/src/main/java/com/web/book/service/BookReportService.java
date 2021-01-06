package com.web.book.service;

import java.util.List;

import com.web.book.model.BookReportBean;

public interface BookReportService {
	
	List<BookReportBean> bookReportMemberAllList(Integer mb_ID);
	
	List<BookReportBean> bookReportBookAllList(Integer bk_ID);
	
	BookReportBean getBookReport(Integer br_ID);
	
	void deleteBookReport(Integer br_ID);
	
	void upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content );
	
	void insertBookReport(Integer mb_ID, Integer bk_ID, String br_Name, Integer br_Score, String br_Content);
	
	List<BookReportBean> allbookReportList();
	
	Integer getSearchPageSize(String searchType);
	
	List<BookReportBean> getSearchBookRepotData(String searchType, Integer page);
	
	Boolean checkBookReport(Integer mbId, Integer bkId);
	
	Boolean addSubReport(Integer brId, Integer mbId);
	
	
	
}
