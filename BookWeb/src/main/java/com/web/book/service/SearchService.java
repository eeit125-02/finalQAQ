package com.web.book.service;

import java.util.List;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;
import com.web.book.model.SearchTypeBean;

public interface SearchService {

	//查詢書籍關鍵字
	List<BookBean> searchBook(String name, Integer page);

	//取得單一本書的詳細資訊
	BookBean getBook(int id);

	//取得單一本書的類型
	List<BookTypeBean> getBookType(int id);

	// 會員收藏清單
	List<BookCollectBean> gotoCollect(int id);

	//取得全部類型
	List<SearchTypeBean> getAllBookType();

	// 刪除收藏項目
	boolean delete(int bcid);

	// 新增收藏項目
	boolean savebc(int bk_ID, int mb_ID);

	// 新增書本
	BookBean savebk(BookBean bkc);

	// 修改書本
	int updatebk(BookBean mb);

	//查詢書籍作者
	List<BookBean> searchBookAuthor(String name, Integer page);
	//查詢書籍出版社
	List<BookBean> searchBookPublish(String name, Integer page);
	//查詢書籍類型
	List<BookBean> searchBookType(List<Integer> reslist, Integer page);

	//確認收藏與否
	boolean checkbc(int bk_ID, int mb_ID);

	//刪除書本
	boolean deletebk(BookBean mb);

	//取得總頁數
	int getResultPage();
	//取得總筆數
	int getResultNumber();


}