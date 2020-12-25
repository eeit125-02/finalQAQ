package com.web.book.service;

import java.util.List;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;

public interface SearchService {

	//查詢書籍關鍵字
	List<BookBean> searchBook(String name);

	//取得單一本書的詳細資訊
	BookBean getBook(int id);

	//取得單一本書的類型
	List<BookTypeBean> getBookType(int id);

	// 會員收藏清單
	List<BookCollectBean> gotoCollect(int id);

	// 刪除收藏項目
	boolean delete(int bcid);

	// 新增收藏項目
	boolean savebc(int bk_ID, int mb_ID);

	// 新增書本
	BookBean savebk(BookBean bkc);

	// 修改書本
	int updatebk(BookBean mb);

	//查詢書籍作者
	List<BookBean> searchBookAuthor(String name);
	//查詢書籍出版社
	List<BookBean> searchBookPublish(String name);


}