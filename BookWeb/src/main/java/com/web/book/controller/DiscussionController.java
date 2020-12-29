package com.web.book.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.book.model.CommandBean;
import com.web.book.model.MemberBean;
import com.web.book.model.PostBean;
import com.web.book.model.RuleBean;
import com.web.book.service.DiscussionService;

@Controller
public class DiscussionController {

	@Autowired
	DiscussionService discussionService;
	
	//由首頁連進討論區主頁
	//依時間排序列出所有貼文、留言
	@GetMapping("/Discussion/mainpage")
	public String Discussionmain(Model model) {
		List<PostBean> post_list = discussionService.getAllPost();
		model.addAttribute("allPost", post_list);
		List<CommandBean> command_list = discussionService.getAllCommand();
		model.addAttribute("allCommand", command_list);
		List<RuleBean> rule_content = discussionService.getRule();
		model.addAttribute("rule",  rule_content);
		List<MemberBean> member_list = discussionService.getAllMember();
		model.addAttribute("member_info", member_list);
		return "Discussion/mainpage"; 
	}
	
	//貼文內容(會員id目前為null)
	@ModelAttribute
	public void post_inf(Model model) {
		PostBean pb = new PostBean();
		Timestamp d = new Timestamp(System.currentTimeMillis());  
		pb.setPost_time(d);
		model.addAttribute("postBean",pb);
	}
	
	//留言內容(會員id目前為null)
	@ModelAttribute
	public void command_info(Model model) {
		CommandBean cb = new CommandBean();
		Timestamp d = new Timestamp(System.currentTimeMillis());  
		cb.setCommand_time(d);
		model.addAttribute("commandBean",cb);
	}

	
	//會員新增貼文
	@PostMapping("Discussion/add_post")
	public String processAddNewPost(@ModelAttribute("postBean")PostBean pb) {
		MemberBean mb = discussionService.getMemberBeanById(13); //先寫死
		pb.setMemberbean(mb);
		discussionService.addPost(pb);
		return "redirect:/Discussion/mainpage";
	}
	
	//會員新增留言
	@PostMapping("Discussion/add_command")
	public String processAddNewCommand(
			@ModelAttribute("commandBean")CommandBean cb,
			@RequestParam(value="postBean.post_id") Integer pb_ID) {
		MemberBean mb = discussionService.getMemberBeanById(11); //先寫死
		cb.setMemberbean(mb);
		PostBean pb = discussionService.getPostBeanById(pb_ID);
		cb.setPostBean(pb);
		discussionService.addCommand(cb);
		return "redirect:/Discussion/mainpage";
	}
	
	//帶參數前往修改貼文頁面
	@PostMapping("Discussion/go_edit")
	public String goEditPage(Model model,
			@RequestParam("edit_post_id") Integer edit_post_id,
			@RequestParam("edit_post_title") String edit_post_title,
			@RequestParam("edit_post_content") String edit_post_content
			) {
		return "/Discussion/edit_post";
	}
	
	//帶參數前往詳細貼文頁面
	@PostMapping("Discussion/show_detail")
	public String showDetailPage(Model model,
			@RequestParam("post_detail_id") Integer post_detail_id) {
		PostBean pb = discussionService.getPostBeanById(post_detail_id);
		model.addAttribute("PostBean", pb);
		List<CommandBean> command_detail= discussionService.getCommandBeanByPostId(post_detail_id);
		model.addAttribute("CommandBean", command_detail);
		return "/Discussion/post_detail";
	}
	
	//修改貼文
	@PostMapping("Discussion/edit_post")
	public String processPostEdit(Model model,
			@RequestParam("edit_post_id") Integer edit_post_id,
			@RequestParam("edit_post_title") String edit_post_title,
			@RequestParam("edit_post_content") String edit_post_content
			) {
		Timestamp d = new Timestamp(System.currentTimeMillis());
		discussionService.editPost(edit_post_id, edit_post_title,edit_post_content, d);
		return "redirect:/Discussion/mainpage"; 
	}
	
	//刪除貼文
	@PostMapping("Discussion/go_delete")
	public String processPostDelete(Model model,
			@RequestParam("delete_post_id") Integer delete_post_id) {
		discussionService.deletPost(delete_post_id);
		return "redirect:/Discussion/mainpage"; 
	}
	
	//搜尋關鍵字
	@PostMapping("Discussion/search_keyword")
	public String showKeywordSearchResult(Model model,
			@RequestParam("keyword") String keyword) {
		List<PostBean> post_list = discussionService.getAllPost();
		model.addAttribute("allPost", post_list);
		List<CommandBean> command_list = discussionService.getAllCommand();
		model.addAttribute("allCommand", command_list);
		return "/Discussion/search_result";
	}
}
