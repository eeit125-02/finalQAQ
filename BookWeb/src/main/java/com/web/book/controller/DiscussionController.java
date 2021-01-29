package com.web.book.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.CommandBean;
import com.web.book.model.MemberBean;
import com.web.book.model.NestedCommandBean;
import com.web.book.model.PostBean;
import com.web.book.model.RuleBean;
import com.web.book.service.DiscussionService;

@Controller
@SessionAttributes(value = {"loginUser"})
public class DiscussionController {

	@Autowired
	DiscussionService discussionService;
	
	MemberBean loginUser;
	@ModelAttribute
	public void setLoginUser(Model model) {
		loginUser = (MemberBean) model.getAttribute("loginUser");
	}
	
	//由首頁連進討論區主頁
	@GetMapping("/Discussion/mainpage")
	public String Discussionmain(Model model) {
		List<PostBean> post_list = discussionService.getAllPost();
		model.addAttribute("allPost", post_list);
		List<PostBean> post_list_hot = discussionService.getAllPostByHot();
		model.addAttribute("hotPost", post_list_hot);
		List<PostBean> post_list_click = discussionService.getAllPostByClick();
		model.addAttribute("clickPost", post_list_click);
		List<CommandBean> command_list = discussionService.getAllCommand();
		model.addAttribute("allCommand", command_list);
		List<RuleBean> rule_content = discussionService.getRule();
		model.addAttribute("rule",  rule_content);
		List<MemberBean> member_list = discussionService.getAllMember();
		model.addAttribute("member_info", member_list);
		model.addAttribute("loginUser", loginUser); //獲取LoginUser
		List<NestedCommandBean> nested_command_detail = discussionService.getAllNestedCommand();
		model.addAttribute("AllNestedCommand", nested_command_detail);
		return "Discussion/mainpage"; 
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
		discussionService.addClick(post_detail_id);
		PostBean pb = discussionService.getPostBeanById(post_detail_id);
		model.addAttribute("PostBean", pb);
		List<CommandBean> command_detail= discussionService.getCommandBeanByPostId(post_detail_id);
		model.addAttribute("CommandBean", command_detail);
		model.addAttribute("loginUser", loginUser); 
		List<NestedCommandBean> nested_command_detail = discussionService.getAllNestedCommand();
		model.addAttribute("AllNestedCommand", nested_command_detail);
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
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tsStr = sdf.format(d);
		discussionService.editPost(edit_post_id, edit_post_title,edit_post_content, tsStr);
		
		PostBean pb = discussionService.getPostBeanById(edit_post_id);
		model.addAttribute("PostBean", pb);
		List<CommandBean> command_detail= discussionService.getCommandBeanByPostId(edit_post_id);
		model.addAttribute("CommandBean", command_detail);
		model.addAttribute("loginUser", loginUser); 
		List<NestedCommandBean> nested_command_detail = discussionService.getAllNestedCommand();
		model.addAttribute("AllNestedCommand", nested_command_detail);
		return "/Discussion/post_detail"; 
	}
		
	//搜尋關鍵字
	@PostMapping("Discussion/search_keyword")
	public String showKeywordSearchResult(Model model,
			@RequestParam("keyword") String keyword) {
		List<PostBean> post_list = discussionService.getAllPost();
		model.addAttribute("allPost", post_list);
		List<CommandBean> command_list = discussionService.getAllCommand();
		model.addAttribute("allCommand", command_list);
		model.addAttribute("loginUser", loginUser); 
		List<NestedCommandBean> nested_command_detail = discussionService.getAllNestedCommand();
		model.addAttribute("AllNestedCommand", nested_command_detail);
		return "/Discussion/search_result";
	}
	
	//錯誤攔截
	@PostMapping("Discussion/catch_exception")
	public String catchException(Model model) {
		model.addAttribute("exception", 1/0);
		return "Discussion/mainpage";
	}
	
	@PostMapping("Discussion/catch_404_exception")
	public String catch404Exception(Model model) {
		return "Discussion/not_existed_page";
	}
	
	
}
