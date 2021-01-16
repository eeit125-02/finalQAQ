package com.web.book.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.BookReportDao;
import com.web.book.dao.SearchBookDAO;
import com.web.book.model.BookBean;
import com.web.book.model.BookReportBean;
import com.web.book.model.BookReportCollectBean;
import com.web.book.model.BookReportMessageBean;
import com.web.book.service.BookReportService;

@Transactional
@Service
public class BookReportServiceImpl implements BookReportService {

	@Autowired
	BookReportDao bookReportDao;
	
	@Autowired
	SearchBookDAO searchBook;
	
	@Override
	public List<Map<String, Object>> bookReportMemberAllList(Integer mb_ID) {
		
		List<Map<String, Object>> book = new ArrayList<>();
		List<BookReportBean> memberBookReport = bookReportDao.bookReportMemberAllList(mb_ID);
		for (BookReportBean bookReportBean : memberBookReport) {
			Map<String, Object> data = new HashMap<>();
			data.put("br_ID", bookReportBean.getBr_ID());
			data.put("bk_Name", bookReportBean.getBook().getBk_Name());
			data.put("bk_Author", bookReportBean.getBook().getBk_Author());
			data.put("br_Score", bookReportBean.getBr_Score());
			data.put("br_DateTime", String.valueOf(bookReportBean.getBr_DateTime()));
			data.put("bk_Pic", bookReportBean.getBook().getBk_Pic());
			book.add(data);
		}
		return book;
	}

	@Override
	public List<BookReportBean> bookReportBookAllList(Integer bk_ID) {
	
		return bookReportDao.bookReportBookAllList(bk_ID);
	}
	
	@Override
	public Map<String, Object> getBookReport(Boolean isView , Integer br_ID) {
		
		BookReportBean bookReport = bookReportDao.getBookReport(br_ID);
		Map<String, Object> data = new HashMap<>();
		
		if (Boolean.TRUE.equals(isView)) {
			
			data.put("br_DateTime", bookReport.getBr_DateTime());
			data.put("br_Content", bookReport.getBr_Content());
			data.put("br_Score", bookReport.getBr_Score());
			data.put("br_Name", bookReport.getBr_Name());
			data.put("bk_Name", bookReport.getBook().getBk_Name());
			data.put("bk_Author", bookReport.getBook().getBk_Author());
			data.put("bk_Pic", bookReport.getBook().getBk_Pic());
			data.put("bk_Translator", bookReport.getBook().getBk_Translator());
			data.put("bk_Publish", bookReport.getBook().getBk_Publish());
			data.put("userAccount", bookReport.getMember().getMb_Account());
			
		} else {
			
			data.put("br_ID", bookReport.getBr_ID());
			data.put("bk_Name", bookReport.getBook().getBk_Name());
			data.put("bk_Author", bookReport.getBook().getBk_Author());
			data.put("bk_Publish", bookReport.getBook().getBk_Publish());
			data.put("br_Score", bookReport.getBr_Score());
			data.put("bk_Pic", bookReport.getBook().getBk_Pic());
			data.put("br_Content", bookReport.getBr_Content());
			
		}
		return data;
	}

	@Override
	public Boolean deleteBookReport(Integer br_ID) {
		
		bookReportDao.deleteBookReport(br_ID);
		
		return true;
	}

	@Override
	public Boolean upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content) {

		bookReportDao.upDateBookReportData(br_ID, br_Score, br_Content);
		
		return true;
	}

	@Override
	public Boolean insertBookReport(Integer mb_ID, Integer bk_ID, String br_Name, Integer br_Score, String br_Content) {

		bookReportDao.insertBookReport(mb_ID, bk_ID, br_Name, br_Score, br_Content);
		
		return true;
	}

	@Override
	public List<Map<String, Object>> allbookReportList() {
		
		List<Map<String, Object>> bookReport = new ArrayList<>();
		List<BookReportBean> memberBookReport = bookReportDao.allbookReportList();
		for (BookReportBean bookReportBean : memberBookReport) {
			Map<String, Object> data = new HashMap<>();
			data.put("br_ID", bookReportBean.getBr_ID());
			data.put("br_Name", bookReportBean.getBr_Name());
			data.put("bk_Name", bookReportBean.getBook().getBk_Name());
			data.put("bk_Author", bookReportBean.getBook().getBk_Author());
			data.put("br_Score", bookReportBean.getBr_Score());
			data.put("bk_Publish", bookReportBean.getBook().getBk_Publish());
			data.put("br_DateTime", new SimpleDateFormat("yyyy-MM-dd").format(bookReportBean.getBr_DateTime()));
			data.put("bk_Pic", bookReportBean.getBook().getBk_Pic());
			data.put("loginUser", bookReportBean.getMember().getMb_Account());
			bookReport.add(data);
		}
		return bookReport;
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
	public Map<String,Object> getSearchBookRepotData(String searchType, Integer page) {
		
		Map<String, Object>  data = new HashMap<>();
		
		List<Map<String, Object>> bookReport = new ArrayList<>();
		List<BookReportBean> searchBookReport;
		
		if (searchType.equals("all")) {
			
			searchBookReport = bookReportDao.getThisPageDateForAllBookRepot(page);
		}else {
			
			searchBookReport = bookReportDao.getThisPageDateForSearchBookRepot(page, searchType);
		}
		for (BookReportBean bookReportBean : searchBookReport) {
			Map<String, Object> searchData = new HashMap<>();
			searchData.put("br_ID", bookReportBean.getBr_ID());
			searchData.put("br_Name", bookReportBean.getBr_Name());
			searchData.put("bk_Name", bookReportBean.getBook().getBk_Name());
			searchData.put("bk_Author", bookReportBean.getBook().getBk_Author());
			searchData.put("br_Score", bookReportBean.getBr_Score());
			searchData.put("bk_Publish", bookReportBean.getBook().getBk_Publish());
			searchData.put("br_DateTime", new SimpleDateFormat("yyyy-MM-dd").format(bookReportBean.getBr_DateTime()));
			searchData.put("bk_Pic", bookReportBean.getBook().getBk_Pic());
			searchData.put("loginUser", bookReportBean.getMember().getMb_Account());
			bookReport.add(searchData);
		}
		
		if(searchType.equals("all")) {
			
			data.put("pageSize", bookReportDao.getAllBookRepotPageSize());
		}else {
			
			data.put("pageSize", bookReportDao.getSearchBookRepotPageSize(searchType));
		}
		data.put("searchType", searchType);
		data.put("searchPage", page);
		data.put("searchData", bookReport);
		
		return data;
		
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
	public List<Map<String, Object>> getMemberCollectReport(Integer mbId) {
		
		List<Map<String, Object>> collectReport = new ArrayList<>();
		List<BookReportCollectBean> memberCollects = bookReportDao.getMemberCollectReportList(mbId);
		
		for (BookReportCollectBean bookReportCollect : memberCollects) {
			
			Map<String, Object>  data = new HashMap<>();
			data.put("rcId", bookReportCollect.getRc_ID());
			data.put("brId", bookReportCollect.getBookReport().getBr_ID());
			data.put("mbAccount", bookReportCollect.getBookReport().getMember().getMb_Account());
			data.put("bkName", bookReportCollect.getBookReport().getBook().getBk_Name());
			data.put("bkPic", bookReportCollect.getBookReport().getBook().getBk_Pic());
			data.put("bkAuthor", bookReportCollect.getBookReport().getBook().getBk_Author());
			data.put("bkPublish",bookReportCollect.getBookReport().getBook().getBk_Publish());
			data.put("brName", bookReportCollect.getBookReport().getBr_Name());
			data.put("brScore", bookReportCollect.getBookReport().getBr_Score());
			data.put("brDate", new SimpleDateFormat("yyyy-MM-dd").format(bookReportCollect.getBookReport().getBr_DateTime()));
			
			collectReport.add(data);
		}
		
		return collectReport;
		
	}

	@Override
	public Boolean deleteCollectReport(Integer rcId) {
		
		bookReportDao.delteCollectReport(rcId);
		
		return true;
	}

	@Override
	public Map<String, Object> getBookReportMessageList(Integer brId, Integer loginUserId) {
		
		Map<String, Object> returnData = new HashMap<>();
		List<Map<String, Object>> reportMessages = new ArrayList<>();
		List<BookReportMessageBean> bookReportMessages = bookReportDao.getBookReportMessageList(brId);
		
		for (BookReportMessageBean bookReportMessage : bookReportMessages) {
			
			Map<String, Object>  data = new HashMap<>();
			
			data.put("bmId", bookReportMessage.getBm_ID());
			data.put("bmContent", bookReportMessage.getBm_Content());
			data.put("mbName", bookReportMessage.getMember().getMb_Name());
			data.put("mbPic", bookReportMessage.getMember().getMb_pic());
			data.put("bmDate", new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(bookReportMessage.getBm_Date()));
			
			reportMessages.add(data);
			
		}
		
		returnData.put("messages",reportMessages);
		
		if (bookReportDao.getBookReport(brId).getMember().getMb_ID() == loginUserId) {
			returnData.put("reportOwner",true);
		} else {
			returnData.put("reportOwner",false);
		}
		
		return returnData;
	}

	@Override
	public List<Map<String, Object>> getMemberBookReportMessageList(Integer mbId) {
		
		List<Map<String, Object>> reportMessages = new ArrayList<>();
		List<BookReportMessageBean> bookReportMessages = bookReportDao.getMemberBookReportMessageList(mbId);
		System.out.println(bookReportMessages.size());
		System.out.println(mbId);
		for (BookReportMessageBean bookReportMessage : bookReportMessages) {
			
			Map<String, Object>  data = new HashMap<>();
			
			data.put("bmId", bookReportMessage.getBm_ID());
			data.put("bmContent", bookReportMessage.getBm_Content());
			data.put("bmDate", new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(bookReportMessage.getBm_Date()));
			data.put("brId", bookReportMessage.getBookReport().getBr_ID());
			data.put("brName", bookReportMessage.getBookReport().getBr_Name());
			data.put("bkName", bookReportMessage.getBookReport().getBook().getBk_Name());
			data.put("bkAuthor", bookReportMessage.getBookReport().getBook().getBk_Author());
			data.put("bkPic", bookReportMessage.getBookReport().getBook().getBk_Pic());
			
			reportMessages.add(data);
		}
		
		return reportMessages;
	}

	@Override
	public String addReportMessage(Integer brId, Integer mbId, String content) {
		
		List<BookReportMessageBean> reportMessages = bookReportDao.getMemberBookReportMessageList(mbId);

		for (BookReportMessageBean reportMessage : reportMessages) {
			if(reportMessage.getBookReport().getBr_ID().equals(brId)) {
				return "2";
			}
			if(reportMessage.getBookReport().getMember().getMb_ID() == mbId) {
				return "1";
			}
		}
		bookReportDao.addReportMessage(brId, mbId, content);
		return "true";
	}

	@Override
	public Boolean deletReportMessage(Integer bmId) {
		
		bookReportDao.deletReportMessage(bmId);
		
		return true;
	}

	@Override
	public Map<String, Object> gotoPage(Integer loginUserId , Integer bkId) {
		
		BookBean result = searchBook.getBook(bkId);
		Map<String, Object> info = new HashMap<>();
		info.put("bk_Name", result.getBk_Name());
		info.put("bk_Author", result.getBk_Author());
		info.put("bk_Pic", result.getBk_Pic());
		info.put("bk_Publish", result.getBk_Publish());
		info.put("bk_Translator", result.getBk_Translator());
		info.put("userAccount", loginUserId);
		
		return info;
	}
	
	
}
