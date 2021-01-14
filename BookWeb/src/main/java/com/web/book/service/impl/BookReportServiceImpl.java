package com.web.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.BookReportDao;
import com.web.book.model.BookReportBean;
import com.web.book.model.BookReportCollectBean;
import com.web.book.model.BookReportMessageBean;
import com.web.book.service.BookReportService;

@Transactional
@Service
public class BookReportServiceImpl implements BookReportService {

	@Autowired
	BookReportDao bookReportDao;
	
	@Override
	public List<BookReportBean> bookReportMemberAllList(Integer mb_ID) {
	
		return bookReportDao.bookReportMemberAllList(mb_ID);
	}

	@Override
	public List<BookReportBean> bookReportBookAllList(Integer bk_ID) {
	
		return bookReportDao.bookReportBookAllList(bk_ID);
	}
	
	@Override
	public BookReportBean getBookReport(Integer br_ID) {
		
		return bookReportDao.getBookReport(br_ID);
	}

	@Override
	public void deleteBookReport(Integer br_ID) {
		
		bookReportDao.deleteBookReport(br_ID);
		
	}

	@Override
	public void upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content) {

		bookReportDao.upDateBookReportData(br_ID, br_Score, br_Content);
		
	}

	@Override
	public void insertBookReport(Integer mb_ID, Integer bk_ID, String br_Name, Integer br_Score, String br_Content) {

		bookReportDao.insertBookReport(mb_ID, bk_ID, br_Name, br_Score, br_Content);
		
	}

	@Override
	public List<BookReportBean> allbookReportList() {
		
		return bookReportDao.allbookReportList();
	}

	@Override
	public Integer getSearchPageSize(String searchType) {
		
		
		if(searchType.equals("all")) {
			
			return bookReportDao.getAllBookRepotPageSize();
			
		}else {
			
			return bookReportDao.getSearchBookRepotPageSize(searchType);
		}
		
	}

	@Override
	public List<BookReportBean> getSearchBookRepotData(String searchType, Integer page) {
		
		
		if (searchType.equals("all")) {
			
			return bookReportDao.getThisPageDateForAllBookRepot(page);
			
		}else {
			
			return bookReportDao.getThisPageDateForSearchBookRepot(page, searchType);
			
		}
		
	}

	@Override
	public Boolean checkBookReport(Integer mbId, Integer bkId) {
		
		List<BookReportBean> memberBookReport = bookReportDao.bookReportMemberAllList(mbId);
		for (BookReportBean bookReport : memberBookReport) {
			if (bookReport.getBook().getBk_ID().equals(bkId)) {
				return false;
			}
		}
		return true;
	}

	@Override
	public String addSubReport(Integer brId, Integer mbId) {
		
		List<BookReportCollectBean> collects = bookReportDao.getMemberCollectReportList(mbId);
		BookReportBean bookReport = bookReportDao.getBookReport(brId);
		
		
		if(bookReport.getMember().getMb_ID() == mbId) { 
	
			return "1";
			
		}else {
			
			for (BookReportCollectBean collect : collects) {
				
				if (collect.getBookReport().getBr_ID().equals(brId)) {
					
					return "2";
					
				}
			}
		}
		
		bookReportDao.addSubReport(brId, mbId);

		return "true";
	}

	@Override
	public List<BookReportCollectBean> getMemberCollectReport(Integer mbId) {
		
		return bookReportDao.getMemberCollectReportList(mbId);
		
	}

	@Override
	public void deleteCollectReport(Integer rcId) {
		
		bookReportDao.delteCollectReport(rcId);
		
	}

	@Override
	public List<BookReportMessageBean> getBookReportMessageList(Integer brId) {
		
		return bookReportDao.getBookReportMessageList(brId);
	}

	@Override
	public List<BookReportMessageBean> getMemberBookReportMessageList(Integer mbId) {
		
		return bookReportDao.getMemberBookReportMessageList(mbId);
	}

	@Override
	public Boolean addReportMessage(Integer brId, Integer mbId, String content) {
		
		List<BookReportMessageBean> reportMessages = bookReportDao.getMemberBookReportMessageList(mbId);
		for (BookReportMessageBean reportMessage : reportMessages) {
			if(reportMessage.getBookReport().getBr_ID().equals(brId)) {
				return false;
			}
		}
		
		bookReportDao.addReportMessage(brId, mbId, content);
		return true;
	}

	@Override
	public void deletReportMessage(Integer bmId) {
		bookReportDao.deletReportMessage(bmId);
	}
	
	

	

}
