package com.web.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.BookStoreDao;
import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.service.BookStoreService;

@Service
@Transactional
public class BookStoreServiceImpl implements BookStoreService {

	@Autowired
	BookStoreDao dao;
	
	@Override
	public List<BookStoreBean> searchBookStore(int page, int bs_ID) {
		return dao.searchBookStore(page, bs_ID);
	}
	// 一件商品所有價錢區間
	@Override
	public List<BookStoreBean> bookPrices(Integer bk_ID) {
		return dao.bookPrices(bk_ID);
	}
	
	// 商品頁面搜尋全部頁數，管理員a123456,07 
	@Override
	public Integer getAllSearchBookStoreSize(int bs_ID) {
		return dao.getAllSearchBookStoreSize(bs_ID);
	}

	@Override
	public BookBean getBookDetail(Integer bk_ID) {
		return dao.getBookDetail(bk_ID);
	}

	@Override
	public BookStoreBean getOneBookStore(Integer bks_ID) {
		return dao.getOneBookStore(bks_ID);
	}
	
	@Override
	public List<BookStoreBean> searchMemberStore(Integer mb_ID) {
		return dao.searchMemberStore(mb_ID);
	}

	@Override
	public List<BookStoreBean> searchStoreBookName(String bk_Name, Integer page, Integer bs_ID) {
		return dao.searchStoreBookName(bk_Name, page, bs_ID);
	}

	@Override
	public void insertSearchBookName(Integer bs_Num, Integer bs_Price, Integer bk_ID, Integer bs_ID) {
		dao.insertSearchBookName(bs_Num, bs_Price, bk_ID, bs_ID);
	}

	@Override
	public void updateBookStore(Integer bks_ID, Integer bs_Num, Integer bs_Price) {
		dao.updateBookStore(bks_ID, bs_Num, bs_Price);
	}

	@Override
	public void deleteBookStore(Integer bks_ID) {
		dao.deleteBookStore(bks_ID);
	}

	@Override
	public void boobqaq() {
		dao.boobqaq();
	}
	@Override
	public List<BookBean> searchBookName(String bk_Name) {
		return dao.searchBookName(bk_Name);
	}
	@Override
	public Integer getSearchStoreBookNameSize(String bk_Name, Integer bs_ID) {
		return dao.getSearchStoreBookNameSize(bk_Name, bs_ID);
	}
	
	

	

	

}
