package com.web.book.service;

import java.util.List;

import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;

public interface BookStoreService {


	// 商品頁面搜尋
	List<BookStoreBean> searchBookStore(int page, int bs_ID);
	
	// 商品頁面搜尋全部頁數，管理員a123456,07 
	Integer getAllSearchBookStoreSize(int bs_ID);

	// 一件商品所有價錢區間
	List<BookStoreBean> bookPrices(Integer bk_ID);

	// 單一商品詳細資料
	BookBean getBookDetail(Integer bk_ID);

	// 單一賣家商品詳細資料
	BookStoreBean getOneBookStore(Integer bks_ID);

	// 搜尋會員賣場資料
	List<BookStoreBean> searchMemberStore(Integer mb_ID);

	// 從書庫搜尋書名(新增用途)
	List<BookBean> searchBookName(String bk_Name);
	
	// 首頁搜尋商品
	List<BookStoreBean> searchStoreBookName(String bk_Name, Integer page, Integer bs_ID);
	
	// 首頁搜尋商品全部頁數
	Integer getSearchStoreBookNameSize(String bk_Name, Integer bs_ID);

	// 從書庫搜尋出來的結果選擇一筆資料新增
	void insertSearchBookName(Integer bs_Num, Integer bs_Price, Integer bk_ID, Integer bs_ID);

	// 修改會員賣場資料
	void updateBookStore(Integer bks_ID, Integer bs_Num, Integer bs_Price);

	// 刪除會員賣場資料
	void deleteBookStore(Integer bks_ID);

	// 灌庫存值給商店
	void boobqaq();

}
