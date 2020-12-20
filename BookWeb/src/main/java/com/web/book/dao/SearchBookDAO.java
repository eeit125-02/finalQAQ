package com.web.book.dao;

import java.util.List;

import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;


public interface SearchBookDAO {

	// 查詢書籍關鍵字
	// 缺一個判斷list=0就顯示查無此書的判斷式
	List<BookBean> searchBook(String name);

	// 取得單一本書的詳細資訊
	BookBean getBook(int id);

	// 會員收藏清單
	List<BookCollectBean> getCollect(int MB_ID);

	// 刪除收藏項目
	int deletebc(int bcid);

	// 新增收藏項目
	int savebc(int bk_id, int mb_id);

	// 新增書本
	int savebk(BookBean bkc);

	// 修改書本
	int updatebk(BookBean mb);

}