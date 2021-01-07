package com.web.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.SearchBookDAO;
import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;
import com.web.book.service.SearchService;

	@Transactional
	@Service
	public class SearchServiceImpl implements SearchService {

		@Autowired
		SearchBookDAO searchBookDAO;
		
		//查詢書籍關鍵字
		@Override
		public List<BookBean> searchBook(String name){
			return searchBookDAO.searchBook(name);	
		}
		
		//查詢書籍作者
		@Override
		public List<BookBean> searchBookAuthor(String name){
			return searchBookDAO.searchBookAuthor(name);	
		}
		//查詢書籍出版社
		@Override
		public List<BookBean> searchBookPublish(String name){
			return searchBookDAO.searchBookPublish(name);	
		}		
		
		//查詢書籍類型
		@Override
		public List<BookBean> searchBookType(List<Integer> reslist){
			return searchBookDAO.searchBookType(reslist);
		}
		
				
		//取得單一本書的詳細資訊
		@Override
		public BookBean getBook(int id) {
			return searchBookDAO.getBook(id);	
		}
		
		//取得單一本書的詳細資訊
		@Override
		public List<BookTypeBean> getBookType(int id) {
			return searchBookDAO.getBookType(id);	
		}
				
		//確認是否收藏
		@Override
		public boolean checkbc(int bk_ID, int mb_ID) {
			return searchBookDAO.checkbc(bk_ID, mb_ID);	
		}
		
		// 會員收藏清單
		@Override
		public List<BookCollectBean> gotoCollect(int id) {
			return searchBookDAO.getCollect(id);	
		}
		
		// 刪除收藏項目
		@Override
		public boolean delete(int bcid) {
			return searchBookDAO.deletebc(bcid);
		}
		
		// 新增收藏項目
		@Override
		public boolean savebc(int bk_ID, int mb_ID) {
			return searchBookDAO.savebc(bk_ID, mb_ID);
		}

		// 新增書本
		@Override
		public BookBean savebk(BookBean bkc) {
			return searchBookDAO.savebk(bkc);
		}

		// 修改書本
		@Override
		public int updatebk(BookBean mb) {
			return searchBookDAO.updatebk(mb);
		}
		
		// 刪除書本
		@Override
		public boolean deletebk(BookBean mb) {
			return searchBookDAO.deletebk(mb);
		}

	}


