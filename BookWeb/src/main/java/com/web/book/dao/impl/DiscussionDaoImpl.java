package com.web.book.dao.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.DiscussionDao;
import com.web.book.model.CommandBean;
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
	
	//會員新增留言
	@Override
	public void addCommand(CommandBean new_command) {
		Session session = factory.getCurrentSession();
		session.save(new_command);		
	}

	
	//依時間排序列出所有貼文
	@SuppressWarnings("unchecked")
	@Override
	public List<PostBean> getAllPost() {
		String hql="FROM PostBean p ORDER BY p.post_time DESC";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	//依時間排序列出所有留言
	@SuppressWarnings({ "unchecked"})
	@Override
	public List<CommandBean> getAllCommand() {
		String hql="FROM CommandBean c ORDER BY c.command_time DESC";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

}