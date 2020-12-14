package com.web.book.dao.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.DiscussionDao;
import com.web.book.model.PostBean;

@Repository
public class DiscussionDaoImpl implements DiscussionDao {

	@Autowired
	SessionFactory factory;
	
	//會員新增貼文
	@Override
	public void addPost(PostBean new_post) {
		Session session = factory.getCurrentSession();
		session.save(new_post);
	}

}
