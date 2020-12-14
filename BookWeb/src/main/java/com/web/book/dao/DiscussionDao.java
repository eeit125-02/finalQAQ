package com.web.book.dao;

import com.web.book.model.PostBean;

public interface DiscussionDao {
	
	//會員新增貼文
	void  addPost(PostBean new_post);

}