package com.web.book.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.CommandBean;
import com.web.book.model.MemberBean;
import com.web.book.model.PostBean;
import com.web.book.model.RuleBean;
import com.web.book.service.DiscussionService;

@RestController
@SessionAttributes(value = {"loginUser"})
public class DiscussionRESTfulController {
	
	@Autowired
	DiscussionService discussionService;	
	
	MemberBean loginUser;
	@ModelAttribute
	public void setLoginUser(Model model) {
		loginUser = (MemberBean) model.getAttribute("loginUser");
	}
	
	//板規內容修改
	@PostMapping("/Discussion/edit_rule")
	@ResponseBody
	public RuleBean updateRule(Model model,
			@RequestParam(value="rule_content") String rule_Content) {	
		RuleBean rb = new RuleBean();
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		rb.setRule_id(1);
		rb.setRule_content(rule_Content);
		rb.setRule_time(d.toString());
		discussionService.updateRule(rb);
		return rb;
	}
	
	//新增留言
	@PostMapping("/Dsicussion/add_command_ajax")
	@ResponseBody
	public Map<String,Object> addCommandAjax(Model model,
			@RequestParam(value="new_command") String new_command,
			@RequestParam(value="post_id") Integer post_id){
		CommandBean cb = new CommandBean();
		Timestamp d = new Timestamp(System.currentTimeMillis());  
		cb.setCommand_time(d);
//		MemberBean mb = discussionService.getMemberBeanById(11); //先寫死
//		cb.setMemberbean(mb);
		cb.setMemberbean(loginUser);
		PostBean pb = discussionService.getPostBeanById(post_id);
		cb.setPostBean(pb);
		cb.setCommand_content(new_command);
		 discussionService.addCommand(cb);
		 Map<String,Object> new_cb = new HashMap<>();
		 new_cb.put("mb_name", cb.getMemberbean().getMb_Name());
		 new_cb.put("cb_time", cb.getCommand_time().toString());
		 new_cb.put("cb_content", cb.getCommand_content());
		return new_cb;
	}
	
	//hql有問題！！
	//查詢貼文關鍵字
	@PostMapping("/Discussion/search_keyword_manager")
	@ResponseBody
	public List<PostBean> searchPostKeyword(Model model,
			@RequestParam(value="keyword") String keyword
			) throws UnsupportedEncodingException {
		List<PostBean> pb = discussionService.getPostByKeyword(keyword);
		return pb;
	}
	
	

}
