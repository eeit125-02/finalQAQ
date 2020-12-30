package com.web.book.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Book_OrderDaoImpl {
	
	@Autowired
	SessionFactory factory;
	
	//新增一筆結帳資料
	public void insertOrder() {
		
	}
	
	
}
