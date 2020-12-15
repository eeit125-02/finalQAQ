package com.web.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.DiscussionDao;
import com.web.book.model.CommandBean;
import com.web.book.model.PostBean;
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
	public void addCommand(CommandBean new_command) {
		discussionDao.addCommand(new_command);		
	}
	
	//依時間排序列出所有貼文
	@Override
	public List<PostBean> getAllPost() {
		return discussionDao.getAllPost();
	}

	//依時間排序列出所有留言
	@Override
	public List<CommandBean> getAllCommand() {
		return discussionDao.getAllCommand();
	}


}
