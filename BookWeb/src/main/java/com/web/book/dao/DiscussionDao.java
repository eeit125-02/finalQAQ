package com.web.book.dao;

import java.sql.Timestamp;
import java.util.List;

import com.web.book.model.CommandBean;
import com.web.book.model.PostBean;
import com.web.book.model.RuleBean;

public interface DiscussionDao {
	
	//會員新增貼文
	void addPost(PostBean new_post);
	//會員新增留言
	void addCommand(CommandBean new_command);	
	//依時間排序列出所有貼文
	List<PostBean> getAllPost();
	//依時間排序列出所有留言
	List<CommandBean> getAllCommand();
	//列出貼文內容
	List<RuleBean> getRule();
	//修改貼文
	void editPost(Integer edit_post_id,  String edit_post_title,
			String edit_post_content, Timestamp edit_post_time);
	//刪除貼文
	void deletPost(Integer delete_post_id);
	//修改板規
	RuleBean updateRule(RuleBean rb);
}