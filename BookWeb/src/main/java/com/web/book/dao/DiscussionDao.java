package com.web.book.dao;

import java.util.List;

import com.web.book.model.CommandBean;
import com.web.book.model.PostBean;

public interface DiscussionDao {
	
	//會員新增貼文
	void addPost(PostBean new_post);
	//會員新增留言
	void addCommand(CommandBean new_command);	
	//依時間排序列出所有貼文
	List<PostBean> getAllPost();
	//依時間排序列出所有留言
	List<CommandBean> getAllCommand();
}