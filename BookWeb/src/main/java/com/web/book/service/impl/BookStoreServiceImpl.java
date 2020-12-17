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
	public List<BookBean> searchBookStore() {
		return dao.searchBookStore();
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
	public List<BookBean> searchBookName(String bk_Name) {
		return dao.searchBookName(bk_Name);
	}

	@Override
	public void addBookName(Integer bs_Num, Integer bs_Price, Integer bk_ID, Integer bs_ID) {
		dao.addBookName(bs_Num, bs_Price, bk_ID, bs_ID);
	}

	@Override
	public void updateBookStore(Integer bks_ID, Integer bs_Num, Integer bs_Price) {
		dao.updateBookStore(bks_ID, bs_Num, bs_Price);
	}

	@Override
	public void deleteBookStore(Integer bks_ID) {
		dao.deleteBookStore(bks_ID);
	}

	

}
