package com.web.book.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.AdminDao;
import com.web.book.dao.BookReportDao;
import com.web.book.model.BookReportBean;
import com.web.book.service.AdminService;

@Service
@Transactional
public class AdminServiceImp implements AdminService {

	@Autowired
	BookReportDao bookReportDao;
	
	@Autowired
	AdminDao adminDao;
	
	
	@Override
	public List<Map<String, Object>> getAllBookReport() {
		
		List<Map<String, Object>> bookReportTable = new ArrayList<>();
		List<BookReportBean> bookReports = bookReportDao.allbookReportList();
		
		for (BookReportBean bookReport : bookReports) {
			
			Map<String, Object> data = new HashMap<>();
			data.put("brId", bookReport.getBr_ID());
			data.put("brName", bookReport.getBr_Name());
			data.put("brTime", new SimpleDateFormat("yyyy-MM-dd").format(bookReport.getBr_DateTime()));
			data.put("mbAccount", bookReport.getMember().getMb_Account());
			
			bookReportTable.add(data);
		}
		
		return bookReportTable;
	}

	@Override
	public List<Map<String, Object>> getAllBook() {
		return null;
	}

	@Override
	public Boolean deleteBookReport(Integer brId) {
		
		bookReportDao.deleteBookReport(brId);
		
		return true;
	}

	@Override
	public Map<String,Object> getMonthReportWrite() {
		
		List<Object> selectData = adminDao.getMonthReportWrite();
		Map<String, Object> returnData = new HashMap<>();
		
		List<String> monthList = new ArrayList<>();
		List<Integer> monthNumberList = new ArrayList<>();
		for(int i= 1; i <= 6; i++ ){
		
			
		   Object[] value = (Object[]) selectData.get(selectData.size()- i);
		   monthList.add(value[0]+ "-" + value[1]);
		   monthNumberList.add(Integer.valueOf(value[2].toString()));
			  
		}
		
		returnData.put("month", monthList);
		returnData.put("monthNumber", monthNumberList);
		
		return returnData;
	}

	@Override
	public Map<String,Object> getMonthReportView() {
		
		List<Object> selectData = adminDao.getMonthReportViews();
		Map<String, Object> returnData = new HashMap<>();
		
		List<String> monthList = new ArrayList<>();
		List<Integer> monthNumberList = new ArrayList<>();
		for(int i= 1; i <= selectData.size(); i++ ){
		   Object[] value = (Object[]) selectData.get(selectData.size()- i);
		   monthList.add(value[0]+ "-" + value[1]);
		   monthNumberList.add(Integer.valueOf(value[2].toString()));
			  
		}
		
		returnData.put("month", monthList);
		returnData.put("viewNumber", monthNumberList);
		
		return returnData;
	}

}
