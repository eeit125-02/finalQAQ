package com.web.book.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.book.service.DiscussionService;

@RestController
public class DiscussionRESTfulController {
	
	@Autowired
	DiscussionService discussionService;	
	
	@PostMapping("/Discussion/edit_rule")
	public String updateRule(Model model,
			@RequestParam(value="rule_content") String rule_Content) {
		
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		discussionService.updateRule(rule_Content, d);
		return "";
	}
	

}
