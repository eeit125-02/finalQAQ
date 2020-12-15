package com.web.book.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.book.model.CommandBean;
import com.web.book.model.PostBean;
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
		return "Discussion/mainpage"; 
	}
	
	//貼文內容(會員id目前為null)
	@ModelAttribute
	public void post_inf(Model model) {
		PostBean pb = new PostBean();
		pb.setMb_id(null);
		Timestamp d = new Timestamp(System.currentTimeMillis());  
		pb.setPost_time(d);
		model.addAttribute("postBean",pb);
	}
	
	//留言內容(會員id目前為null)
	@ModelAttribute
	public void command_info(Model model) {
		CommandBean cb = new CommandBean();
		cb.setMb_id(null);
		Timestamp d = new Timestamp(System.currentTimeMillis());  
		cb.setCommand_time(d);
		model.addAttribute("commandBean",cb);
	}
	
	//會員新增貼文
	@PostMapping("Discussion/add_post")
	public String processAddNewPost(@ModelAttribute("postBean")PostBean pb) {
		discussionService.addPost(pb);
		return "redirect:/Discussion/mainpage";
	}
	
	//會員新增留言
	@PostMapping("Discussion/add_command")
	public String processAddNewCommand(@ModelAttribute("commandBean")CommandBean cb) {
		discussionService.addCommand(cb);
		return "redirect:/Discussion/mainpage";
	}
	
}
