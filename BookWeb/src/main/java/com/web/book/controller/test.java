package com.web.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.book.model.MemberBean;
import com.web.book.service.MemberService;

@Controller
public class test {

//	@Autowired
//	MemberService ms;
//	
//	@PostMapping("/Update")
//	public String Update(@ModelAttribute("login") MemberBean member, Model model, @RequestParam(value = "pwd") String pwd,HttpServletRequest request) {
//		member.setMb_Password(pwd);
//		boolean update = ms.update(member);
//		if (update) {
//			MemberBean select = ms.select(member.getMb_Account());
//			model.addAttribute("login", select);
//		}
//		return "Member/mb_inf";
//	}
//	
//	@ModelAttribute
//	public void Test(Model model) {
//		List<MemberBean> all = ms.adminselect();
//		model.addAttribute("login",all);
//}
}