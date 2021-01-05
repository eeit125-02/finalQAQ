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
//		hql有問題，待解決
//		List<PostBean> post_list_hot = discussionService.getAllPostByHot();
//		model.addAttribute("hotPost", post_list_hot);
		List<CommandBean> command_list = discussionService.getAllCommand();
		model.addAttribute("allCommand", command_list);
		List<RuleBean> rule_content = discussionService.getRule();
		model.addAttribute("rule",  rule_content);
		List<MemberBean> member_list = discussionService.getAllMember();
		model.addAttribute("member_info", member_list);
		model.addAttribute("loginUser", loginUser); //獲取LoginUser
		return "Discussion/mainpage"; 
	}
	
	//貼文內容(會員id目前為null)
	@ModelAttribute
	public void post_inf(Model model) {
		PostBean pb = new PostBean();
		Timestamp d = new Timestamp(System.currentTimeMillis());
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tsStr = sdf.format(d);
		pb.setPost_time(tsStr);
		model.addAttribute("postBean",pb);
	}
	
	//會員新增貼文
	@PostMapping("Discussion/add_post")
	public String processAddNewPost(@ModelAttribute("postBean")PostBean pb) {
		pb.setMemberbean(loginUser); //直接把Bean塞進去
		discussionService.addPost(pb);
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
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tsStr = sdf.format(d);
		discussionService.editPost(edit_post_id, edit_post_title,edit_post_content, tsStr);
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
