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
import com.web.book.model.MemberBean;
import com.web.book.model.NestedCommandBean;
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
	public CommandBean addCommand(CommandBean new_command) {
		Session session = factory.getCurrentSession();
		session.save(new_command);		
		return new_command;
	}

	//會員新增巢狀留言
	@Override
	public NestedCommandBean addNestedCommand(NestedCommandBean new_nested_command) {
		Session session = factory.getCurrentSession();
		session.save(new_nested_command);
		return new_nested_command;
	}
	
	//依時間排序列出所有貼文
	@SuppressWarnings("unchecked")
	@Override
	public List<PostBean> getAllPost() {
		String hql="FROM PostBean p ORDER BY p.post_time  DESC";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	//依熱門度排序所有貼文
	@SuppressWarnings("unchecked")
	@Override
	public List<PostBean> getAllPostByHot() {
		String hql= //"SELECT p.post_id, p.post_content, p.post_title, p.post_time, p.memberbean.mb_Name, p.commands.FK_PostBean_post_id"+
				"FROM PostBean p " + 
				//"WHERE p.post_id=c.FK_PostBean_post_id" + 
				"ORDER BY COUNT(p.commands.command_id) DESC";
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
	
	//依時間排序列出所有巢狀留言
	@SuppressWarnings("unchecked")
	@Override
	public List<NestedCommandBean> getAllNestedCommand() {
		String hql="FROM NestedCommandBean n ORDER BY n.nested_command_time DESC";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}


	//列出版規
	@SuppressWarnings("unchecked")
	@Override
	public List<RuleBean> getRule() {
		String hql="From RuleBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllMember() {
		String hql="From MemberBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	//修改貼文
	@Override
	public void editPost(Integer edit_post_id,  String edit_post_title,
		String edit_post_content, String edit_post_time) {
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

	//修改版規
	@Override
	public RuleBean updateRule(RuleBean rb) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(rb);
		return rb;
	}

	//用ID取出Post資料
	@Override
	public PostBean getPostBeanById(Integer pb_ID) {
		Session session = factory.getCurrentSession();
		PostBean pb = (PostBean) session.get(PostBean.class, pb_ID);
		return pb;
	}

	//用ID取出Member資料
	@Override
	public MemberBean getMemberBeanById(Integer mb_ID) {
		Session session = factory.getCurrentSession();
		MemberBean mb = (MemberBean) session.get(MemberBean.class, mb_ID);
		return mb;
	}
	
	//用ID取出Command資料
	@Override
	public CommandBean getCommandBeanById(Integer command_ID) {
		Session session = factory.getCurrentSession();
		CommandBean cb = (CommandBean) session.get(CommandBean.class, command_ID);
		return cb;
	}

	//用post id取出command資料
	@SuppressWarnings("unchecked")
	@Override
	public List<CommandBean> getCommandBeanByPostId(Integer pb_ID) {
		String hql="FROM CommandBean c WHERE FK_PostBean_post_id=:pb_ID ORDER BY c.command_time DESC";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("pb_ID", pb_ID).getResultList();
	}

	//有問題！！！
	//查詢貼文關鍵字
	@SuppressWarnings({ "unchecked"})
	@Override
	public List<PostBean> getPostByKeyword(String keyword) {
		String hql="FROM PostBean p WHERE p.post_content LIKE '%" + keyword + 
				"%' OR p.post_title LIKE '%" + keyword + "%'";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}




	






}
