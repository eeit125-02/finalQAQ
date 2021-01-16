package com.web.book.service;

import java.util.List;
import java.util.Map;

import com.web.book.model.BookReportBean;

public interface BookReportService {
	
	List<Map<String, Object>> bookReportMemberAllList(Integer mb_ID);
	
	List<BookReportBean> bookReportBookAllList(Integer bk_ID);
	
	Map<String, Object> getBookReport(Boolean isView, Integer br_ID);
	
	Boolean deleteBookReport(Integer br_ID);
	
	Boolean upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content );
	
	Boolean insertBookReport(Integer mb_ID, Integer bk_ID, String br_Name, Integer br_Score, String br_Content);
	
	List<Map<String, Object>> allbookReportList();
	
	Integer getSearchPageSize(String searchType);
	
	Map<String,Object> getSearchBookRepotData(String searchType, Integer page);
	
	Boolean checkBookReport(Integer mbId, Integer bkId);
	
	String addSubReport(Integer brId, Integer mbId);
	
	List<Map<String, Object>> getMemberCollectReport(Integer mbId);
	
	Boolean deleteCollectReport(Integer rcId);
	
	Map<String, Object> getBookReportMessageList(Integer brId, Integer loginUserId );
	
	List<Map<String, Object>> getMemberBookReportMessageList(Integer mbId);
	 
	String addReportMessage(Integer brId, Integer mbId, String content );
	 
	Boolean deletReportMessage(Integer bmId);
	
	Map<String, Object> gotoPage(Integer loginUserId , Integer bkId);
	
}
