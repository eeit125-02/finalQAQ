package com.web.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.SearchBookDAO;
import com.web.book.dao.SearchOrderBookDAO;
import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;
import com.web.book.model.SearchTypeBean;
import com.web.book.service.SearchService;

	@Transactional
	@Service
	public class SearchServiceImpl implements SearchService {

		@Autowired
		SearchBookDAO searchBookDAO;
		@Autowired
		SearchOrderBookDAO searchOrderBookDAO;
		
		//查詢書籍關鍵字
		@Override
		public List<BookBean> searchBook(String name, Integer page){
			return searchBookDAO.searchBook(name,page);	
		}
		
		//查詢書籍作者
		@Override
		public List<BookBean> searchBookAuthor(String name, Integer page){
			return searchBookDAO.searchBookAuthor(name,page);	
		}
		//查詢書籍出版社
		@Override
		public List<BookBean> searchBookPublish(String name, Integer page){
			return searchBookDAO.searchBookPublish(name,page);	
		}		
		
		//查詢書籍類型
		@Override
		public List<BookBean> searchBookType(List<Integer> reslist, Integer page){
			return searchBookDAO.searchBookType(reslist,page);
		}
		
		//取得總頁數
		@Override
		public int getResultPage(){
			return searchBookDAO.getResultPage();
		}
		
		//取得總筆數
		@Override
		public int getResultNumber(){
			return searchBookDAO.getResultNumber();
		}
				
		//取得單一本書的詳細資訊
		@Override
		public BookBean getBook(int id) {
			return searchBookDAO.getBook(id);	
		}
		
		//取得單一本書的詳細類型
		@Override
		public List<BookTypeBean> getBookType(int id) {
			return searchBookDAO.getBookType(id);	
		}

		//取得全部類型
		@Override
		public List<SearchTypeBean> getAllBookType() {
			return searchBookDAO.getAllBookType();	
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
		
		// 搜尋收藏清單關鍵字
		@Override
		public List<BookCollectBean> getKeyCollect(int id, String key) {
			return searchBookDAO.getKeyCollect(id, key);	
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
		// 新增收藏tag
		@Override
		public BookCollectBean setbctag(int bc_ID, String tag1, String tag2, String tag3) {
			return searchBookDAO.setbctag(bc_ID, tag1, tag2, tag3);
		}
		
		// 刪除收藏tag
		@Override
		public BookCollectBean deletebctag(int bc_ID, String tag1, String tag2, String tag3) {
			return searchBookDAO.deletebctag(bc_ID, tag1, tag2, tag3);
		}
		
		// 取得收藏tag
		@Override
		public BookCollectBean getbctag(int bc_ID) {
			return searchBookDAO.getbctag(bc_ID);
		}
			
		// 新增書本
		@Override
		public BookBean savebk(BookBean bkc) {
			return searchBookDAO.savebk(bkc);
		}
		// 新增書本類型
		@Override
		public int savebkty(List<Integer> tylist, int bk_ID) {
			return searchBookDAO.savebkty(tylist, bk_ID);
		}
		// 刪除書本類型
		@Override
		public boolean deletebkty(int bk_ID) {
			return searchBookDAO.deletebkty(bk_ID);
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
		
		//點擊+1
		@Override
		public void addclick(int bk_ID) {
			searchBookDAO.addBookClick(bk_ID);
		}		

//		=======================
		
		//查詢書籍關鍵字byPage
		@Override
		public List<BookBean> searchOrderBook(String name, Integer page){
			return searchOrderBookDAO.searchOrderBook(name,page);	
		}
		
		//查詢書籍作者byPage
		@Override
		public List<BookBean> searchOrderBookAuthor(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookAuthor(name,page);	
		}
		//查詢書籍出版社byPage
		@Override
		public List<BookBean> searchOrderBookPublish(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookPublish(name,page);	
		}		
		
		//查詢書籍類型byPage
		@Override
		public List<BookBean> searchOrderBookType(List<Integer> reslist, Integer page){
			return searchOrderBookDAO.searchOrderBookType(reslist,page);
		}
		
		//取得總頁數byPage
		@Override
		public int getOrderResultPage(){
			return searchOrderBookDAO.getOrderResultPage();
		}
		
		//取得總筆數byPage
		@Override
		public int getOrderResultNumber(){
			return searchOrderBookDAO.getOrderResultNumber();
		}
		
		//查詢書籍關鍵字byDate
		@Override
		public List<BookBean> searchOrderBookDate(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookDate(name,page);	
		}
		
		//查詢書籍作者byDate
		@Override
		public List<BookBean> searchOrderBookAuthorDate(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookAuthorDate(name,page);	
		}
		//查詢書籍出版社byDate
		@Override
		public List<BookBean> searchOrderBookPublishDate(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookPublishDate(name,page);	
		}		
		
		//查詢書籍類型byDate
		@Override
		public List<BookBean> searchOrderBookTypeDate(List<Integer> reslist, Integer page){
			return searchOrderBookDAO.searchOrderBookTypeDate(reslist,page);
		}
		
		
		//查詢書籍關鍵字byClick
		@Override
		public List<BookBean> searchOrderBookClick(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookClick(name,page);	
		}
		
		//查詢書籍作者byClick
		@Override
		public List<BookBean> searchOrderBookAuthorClick(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookAuthorClick(name,page);	
		}
		//查詢書籍出版社byClick
		@Override
		public List<BookBean> searchOrderBookPublishClick(String name, Integer page){
			return searchOrderBookDAO.searchOrderBookPublishClick(name,page);	
		}		
		
		//查詢書籍類型byClick
		@Override
		public List<BookBean> searchOrderBookTypeClick(List<Integer> reslist, Integer page){
			return searchOrderBookDAO.searchOrderBookTypeClick(reslist,page);
		}
		
		//取得全部書籍
		@Override
		public List<BookBean> getAllBook(){
			return searchBookDAO.searchAllBook();
		}
	}


