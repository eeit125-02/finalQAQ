package com.web.book.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.web.book.model.RuleBean;
import com.web.book.service.DiscussionService;

@RestController
public class DiscussionRESTfulController {
	
	@Autowired
	DiscussionService discussionService;	
	
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
	

}
