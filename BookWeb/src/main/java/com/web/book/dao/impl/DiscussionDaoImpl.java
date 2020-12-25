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
import com.web.book.model.RuleBean;

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

	//修改貼文
	@Override
	public void editPost(Integer edit_post_id,  String edit_post_title,
		String edit_post_content, Timestamp edit_post_time) {
		Session session = factory.getCurrentSession();
		PostBean pb = (PostBean) session.get(PostBean.class, edit_post_id);
		pb.setPost_time(edit_post_time);
		pb.setPost_title(edit_post_title);
		pb.setPost_content(edit_post_content);
	}

	//刪除貼文
	@Override
	public void deletPost(Integer delete_post_id) {
		Session session = factory.getCurrentSession();
		PostBean pb = (PostBean) session.get(PostBean.class, delete_post_id);
		session.delete(pb);		
	}

	@Override
	public RuleBean updateRule(String rule_content, Timestamp edittime) {
		Session session = factory.getCurrentSession();
		RuleBean rb = (RuleBean) session.get(RuleBean.class, 1);
		rb.setRule_content(rule_content);
		rb.setRule_time(edittime);
		return null;
	}

}
