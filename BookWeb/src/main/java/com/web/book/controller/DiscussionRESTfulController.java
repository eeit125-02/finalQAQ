package com.web.book.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import com.web.book.model.NestedCommandBean;
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
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tsStr = sdf.format(d);
		rb.setRule_id(1);
		rb.setRule_content(rule_Content);
		rb.setRule_time(tsStr);
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
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tsStr = sdf.format(d);
		cb.setCommand_time(tsStr);
		cb.setMemberbean(loginUser);
		PostBean pb = discussionService.getPostBeanById(post_id);
		cb.setPostBean(pb);
		cb.setCommand_content(new_command);
		 discussionService.addCommand(cb);
		 Map<String,Object> new_cb = new HashMap<>();
		 new_cb.put("mb_name", cb.getMemberbean().getMb_Name());
		 new_cb.put("cb_time", cb.getCommand_time());
		 new_cb.put("cb_content", cb.getCommand_content());
		 new_cb.put("cb_id", cb.getCommand_id());
		return new_cb;
	}
	
	@PostMapping("/Discussion/add_nested_command_ajax")
	@ResponseBody
	public Map<String, Object> addNestedCommandAjax(Model model,
			@RequestParam(value="nested_command") String new_nested_command,
			@RequestParam(value="command_id") Integer command_id
			){
		NestedCommandBean ncb = new NestedCommandBean();
		Timestamp d = new Timestamp(System.currentTimeMillis());
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tsStr = sdf.format(d);
		ncb.setNested_command_time(tsStr);
		ncb.setMemberbean(loginUser);
		CommandBean pb = discussionService.getCommandBeanById(command_id);
		ncb.setCommandBean(pb);
		ncb.setNested_command_content(new_nested_command);
		discussionService.addNestedCommand(ncb);
		
		Map<String,Object> new_ncb = new HashMap<>();
		new_ncb.put("mb_name", ncb.getMemberbean().getMb_Name());
		new_ncb.put("ncb_time", ncb.getNested_command_time());
		new_ncb.put("ncb_content", ncb.getNested_command_content());
		new_ncb.put("cb_id", ncb.getCommandBean().getCommand_id());
		new_ncb.put("cb_content", ncb.getCommandBean().getCommand_content());
		return new_ncb;
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
