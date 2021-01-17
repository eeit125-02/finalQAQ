package com.web.book.dao;

import java.util.List;

import com.web.book.model.BookBean;

public interface SearchOrderBookDAO {

	//Page
	List<BookBean> searchOrderBook(String name, Integer page);

	List<BookBean> searchOrderBookAuthor(String name, Integer page);

	List<BookBean> searchOrderBookPublish(String name, Integer page);

	List<BookBean> searchOrderBookType(List<Integer> reslist, Integer page);

	int getOrderResultPage();

	int getOrderResultNumber();
	
	//Date

	List<BookBean> searchOrderBookDate(String name, Integer page);

	List<BookBean> searchOrderBookAuthorDate(String name, Integer page);

	List<BookBean> searchOrderBookPublishDate(String name, Integer page);

	List<BookBean> searchOrderBookTypeDate(List<Integer> reslist, Integer page);


	//Click
	
	List<BookBean> searchOrderBookClick(String name, Integer page);

	List<BookBean> searchOrderBookAuthorClick(String name, Integer page);

	List<BookBean> searchOrderBookPublishClick(String name, Integer page);

	List<BookBean> searchOrderBookTypeClick(List<Integer> reslist, Integer page);
	
}
