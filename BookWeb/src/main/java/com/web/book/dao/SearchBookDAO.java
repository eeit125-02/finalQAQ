package com.web.book.dao;

import java.util.List;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.BookTypeBean;


public interface SearchBookDAO {

	// 查詢書籍關鍵字
	List<BookBean> searchBook(String name);
	//查詢書籍作者
	List<BookBean> searchBookAuthor(String name);
	//查詢書籍出版社
	List<BookBean> searchBookPublish(String name);
	//查詢書籍類別
	List<BookBean> searchBookType(List<Integer> reslist);

	// 取得單一本書的詳細資訊
	BookBean getBook(int id);

	// 取得單一本書的類型
	List<BookTypeBean> getBookType(int id);

	// 會員收藏清單
	List<BookCollectBean> getCollect(int MB_ID);

	// 刪除收藏項目
	boolean deletebc(int bcid);

	// 新增收藏項目
	boolean savebc(int bk_id, int mb_id);

	// 新增書本
	BookBean savebk(BookBean bkc);

	// 修改書本
	int updatebk(BookBean mb);

	//查詢收藏與否
	boolean checkbc(int bk_id, int mb_id);
	
	//刪除書本
	boolean deletebk(BookBean bkc);

}