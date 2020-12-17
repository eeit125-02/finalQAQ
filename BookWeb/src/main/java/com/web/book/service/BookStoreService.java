package com.web.book.service;

import java.util.List;

import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;

public interface BookStoreService {
	
		// 商品頁面搜尋
		List<BookBean> searchBookStore();

		// 單一商品詳細資料
		BookBean getBookDetail(Integer bk_ID);

		// 搜尋會員賣場資料
		List<BookStoreBean> searchMemberStore(Integer mb_ID);

		// 從書庫搜尋書名(新增用途)
		List<BookBean> searchBookName(String bk_Name);

		// 從書庫搜尋出來的結果選擇一筆資料新增
		void addBookName(Integer bs_Num, Integer bs_Price, Integer bk_ID, Integer bs_ID);

		// 修改會員賣場資料
		void updateBookStore(Integer bs_Num, Integer bs_Price, Integer bk_ID);

		// 刪除會員賣場資料
		void deleteBookStore(Integer bks_ID);
	
}
