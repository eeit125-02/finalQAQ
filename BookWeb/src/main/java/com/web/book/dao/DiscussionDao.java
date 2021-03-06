package com.web.book.dao;

import java.util.List;

import com.web.book.model.CommandBean;
import com.web.book.model.MemberBean;
import com.web.book.model.NestedCommandBean;
import com.web.book.model.PostBean;
import com.web.book.model.RuleBean;

public interface DiscussionDao {
	
	//會員新增貼文
	void addPost(PostBean new_post);
	//會員新增留言
	CommandBean addCommand(CommandBean new_command);	
	//會員新增巢狀留言
	NestedCommandBean addNestedCommand(NestedCommandBean new_nested_command);	
	//加一次點擊
	void addClick(Integer post_ID);
	
	//用post ID取出Post資料
	PostBean getPostBeanById(Integer pb_ID);
	//用member ID取出Member資料
	MemberBean getMemberBeanById(Integer mb_ID);
	//用command ID取出Command資料
	CommandBean getCommandBeanById(Integer command_ID);
	
	//用post id取出所有留言
	List<CommandBean> getCommandBeanByPostId(Integer pb_ID);
	//依時間排序列出所有貼文
	List<PostBean> getAllPost();
	//依熱門度排序所有貼文
	List<PostBean> getAllPostByHot();
	//依點擊率排序所有貼文
	List<PostBean> getAllPostByClick();
	//依時間排序列出所有留言
	List<CommandBean> getAllCommand();
	//依時間排序列出所有巢狀留言
	List<NestedCommandBean> getAllNestedCommand();
	//列出版規內容
	List<RuleBean> getRule();
	//列出會員內容
	List<MemberBean> getAllMember();
	//查詢貼文關鍵字
	List<PostBean> getPostByKeyword(String keyword);
	
	//修改貼文
	void editPost(Integer edit_post_id,  String edit_post_title,
			String edit_post_content, String edit_post_time);
	//刪除貼文
	void deletPost(Integer delete_post_id);
	
	//修改板規
	RuleBean updateRule(RuleBean rb);
}