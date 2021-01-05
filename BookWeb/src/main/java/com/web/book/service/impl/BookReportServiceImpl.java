package com.web.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.BookReportDao;
import com.web.book.model.BookReportBean;
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
	
	

	

}
