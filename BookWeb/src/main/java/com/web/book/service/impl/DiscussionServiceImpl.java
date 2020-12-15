package com.web.book.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.DiscussionDao;
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

}
