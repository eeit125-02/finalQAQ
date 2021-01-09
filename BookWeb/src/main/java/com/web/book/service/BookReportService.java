package com.web.book.service;

import java.util.List;

import com.web.book.model.BookReportBean;
import com.web.book.model.BookReportCollectBean;

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
	
	String addSubReport(Integer brId, Integer mbId);
	
	List<BookReportCollectBean> getMemberCollectReport(Integer mbId);
	
	void deleteCollectReport(Integer rcId);
	
}
