package com.web.book.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.DiscussionDao;
import com.web.book.model.CommandBean;
import com.web.book.model.MemberBean;
import com.web.book.model.PostBean;
import com.web.book.model.RuleBean;
import com.web.book.service.DiscussionService;


@Service
@Transactional
public class DiscussionServiceImpl implements DiscussionService {

	@Autowired
	DiscussionDao discussionDao;
	
	//會員新增貼文
	@Override
	public void addPost(PostBean new_post) {
		discussionDao.addPost(new_post);
	}
	
	//會員新增留言
	@Override
	public CommandBean addCommand(CommandBean new_command) {
		return discussionDao.addCommand(new_command);		
	}
	
	//依時間排序列出所有貼文
	@Override
	public List<PostBean> getAllPost() {
		return discussionDao.getAllPost();
	}

	//依熱門度排序所有貼文
	@Override
	public List<PostBean> getAllPostByHot() {
		return discussionDao.getAllPostByHot();
	}

	
	//依時間排序列出所有留言
	@Override
	public List<CommandBean> getAllCommand() {
		return discussionDao.getAllCommand();
	}

	//列出版規
	@Override
	public List<RuleBean> getRule() {
		return discussionDao.getRule();
	}
	
	//抓取資料會員
	@Override
	public List<MemberBean> getAllMember() {
		return discussionDao.getAllMember();
	}
	
	//修改貼文
	@Override
	public void editPost(Integer edit_post_id,  String edit_post_title,
			String edit_post_content, String edit_post_time) {
		discussionDao.editPost(edit_post_id,  edit_post_title,
				edit_post_content, edit_post_time);
	}

	//刪除貼文
	@Override
	public void deletPost(Integer delete_post_id) {
		discussionDao.deletPost(delete_post_id);		
	}

	//修改版規
	@Override
	public RuleBean updateRule(RuleBean rb) {
		return discussionDao.updateRule(rb);
	}

	//用ID取出Post資料
	@Override
	public PostBean getPostBeanById(Integer pb_ID) {
		return discussionDao.getPostBeanById(pb_ID);
	}

	//用ID取出Member資料
	@Override
	public MemberBean getMemberBeanById(Integer mb_ID) {
		return discussionDao.getMemberBeanById(mb_ID);
	}

	//用post id取出command資料
	@Override
	public List<CommandBean> getCommandBeanByPostId(Integer pb_ID) {
		return discussionDao.getCommandBeanByPostId(pb_ID);
	}

	//查詢貼文關鍵字
	@Override
	public List<PostBean> getPostByKeyword(String keyword) {
		return discussionDao.getPostByKeyword(keyword);
	}




}
