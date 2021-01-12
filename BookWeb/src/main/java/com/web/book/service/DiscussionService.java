package com.web.book.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.web.book.model.CommandBean;
import com.web.book.model.MemberBean;
import com.web.book.model.NestedCommandBean;
import com.web.book.model.PostBean;
import com.web.book.model.RuleBean;

public interface DiscussionService {
	
	//會員新增貼文
	void addPost(PostBean new_post);
	//會員新增留言
	CommandBean addCommand(CommandBean new_command);
	//會員新增巢狀留言
	NestedCommandBean addNestedCommand(NestedCommandBean new_nested_command);
	//用ID取出Post資料
	PostBean getPostBeanById(Integer pb_ID);
	//用ID取出Member資料
	MemberBean getMemberBeanById(Integer mb_ID);
	//用ID取出Command資料
	CommandBean getCommandBeanById(Integer command_ID);
	//用post id取出command資料
	List<CommandBean> getCommandBeanByPostId(Integer pb_ID);
	//依時間排序列出所有貼文
	List<PostBean> getAllPost();
	//依熱門度排序所有貼文
	List<PostBean> getAllPostByHot();
	//依時間排序列出所有留言
	List<CommandBean> getAllCommand();
	//列出貼文內容
	List<RuleBean> getRule();
	//列出會員內容
	List<MemberBean> getAllMember();
	//修改貼文
	void editPost(Integer edit_post_id,  String edit_post_title,
			String edit_post_content, String edit_post_time);
	//刪除貼文
	void deletPost(Integer delete_post_id);
	//修改板規
	RuleBean updateRule(RuleBean rb);
	//查詢貼文關鍵字
	List<PostBean> getPostByKeyword(String keyword);
}