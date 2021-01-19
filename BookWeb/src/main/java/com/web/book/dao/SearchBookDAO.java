package com.web.book.dao;

import java.util.List;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;
import com.web.book.model.SearchTypeBean;


public interface SearchBookDAO {

	// 查詢書籍關鍵字
	List<BookBean> searchBook(String name, Integer page);
	//查詢書籍作者
	List<BookBean> searchBookAuthor(String name, Integer page);
	//查詢書籍出版社
	List<BookBean> searchBookPublish(String name, Integer page);
	//查詢書籍類別
	List<BookBean> searchBookType(List<Integer> reslist, Integer page);

	// 取得單一本書的詳細資訊
	BookBean getBook(int id);

	// 取得單一本書的類型
	List<BookTypeBean> getBookType(int id);

	// 會員收藏清單
	List<BookCollectBean> getCollect(int MB_ID);

	//取得全部類型
	List<SearchTypeBean> getAllBookType();

	// 刪除收藏項目
	boolean deletebc(int bcid);

	// 新增收藏項目
	boolean savebc(int bk_id, int mb_id);

	// 新增書本
	BookBean savebk(BookBean bkc);
	// 新增書本類型
	int savebkty(List<Integer> tylist, int bk_ID);
	// 刪除書本類型
	boolean deletebkty(int bk_ID);
	// 修改書本
	int updatebk(BookBean mb);

	//查詢收藏與否
	boolean checkbc(int bk_id, int mb_id);
	
	//刪除書本
	boolean deletebk(BookBean bkc);
	
	//取得總頁數
	int getResultPage();
	//取得總筆數
	int getResultNumber();
	
	//點擊+1
	void addBookClick(Integer bk_ID);
	
	//取得全部書籍
	List<BookBean> searchAllBook();
	
	//新增收藏tag1
	BookCollectBean setbctag(int bc_ID, String tag1);
	
	//取得收藏tag
	BookCollectBean getbctag(int bc_ID);
	
	

}