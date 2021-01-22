package com.web.book.dao;

import java.util.List;

import com.web.book.model.BookReportBean;
import com.web.book.model.BookReportCollectBean;
import com.web.book.model.BookReportMessageBean;

public interface BookReportDao {
	
	List<BookReportBean> bookReportMemberAllList(Integer mb_ID);
	
	List<BookReportBean> bookReportBookAllList(Integer bk_ID);
	
	BookReportBean getBookReport(Integer br_ID);
	
	void deleteBookReport(Integer br_ID);
	
	void upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content );
	
	void insertBookReport(Integer mb_ID, Integer bk_ID, String br_Name, Integer br_Score, String br_Content);
	
	List<BookReportBean>  allbookReportList();
	
	Integer getAllBookRepotPageSize();
	
	List<BookReportBean> getThisPageDateForAllBookRepot(Integer page);
	
	Integer getSearchBookRepotPageSize(String searchString);
	
	List<BookReportBean> getThisPageDateForSearchBookRepot(Integer page, String searchString);
	
	void addSubReport(Integer br_ID, Integer mb_ID);
	
	List<BookReportCollectBean> getMemberCollectReportList(Integer mbId);
	
	void delteCollectReport(Integer rcId);
	 
	List<BookReportMessageBean> getBookReportMessageList(Integer brId);
	
	List<BookReportMessageBean> getMemberBookReportMessageList(Integer mbId);
	 
	void addReportMessage(Integer brId, Integer mbId, String content );
	 
	void deletReportMessage(Integer bmId);
	
	
}
