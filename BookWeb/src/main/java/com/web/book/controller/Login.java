package com.web.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.web.book.model.MemberBean;
import com.web.book.service.MemberService;

@Controller
public class Login {

	@Autowired
	MemberService ms;

	// 會員登入
	@PostMapping("/login")
	public String login(Model model, @RequestParam(value = "account") String account,
			@RequestParam(value = "pwd") String pwd) {
		boolean mb = ms.Login(account, pwd);
		if (mb) {
			if (account.equals("a123456") && pwd.equals("a123456")) {
				MemberBean memberall = (MemberBean) ms.adminselect();
				model.addAttribute("admin", memberall);
				return "Member/admin";
			} else {
				model.addAttribute("account", account);
			}
		} else {
			return "Member/login";
		}
		return "Member/city";
	}
	//會員資料
	@PostMapping("/mb_inf")
	public String Mb_inf(Model model, @RequestParam(value = "mb_inf") String account) {
		MemberBean select = ms.select(account);
		model.addAttribute("login", select);
		return "Member/mb_inf";
	}

	// 會員修改介面
	@PostMapping("/Modify")
	public String Modify(Model model, @RequestParam(value = "Modify") String account) {
		MemberBean select = ms.select(account);
		model.addAttribute("login", select);
		return "Member/Modify";
	}
	//會員修改
	@PostMapping("/Update")
	public String Update(Model model, @RequestParam(value = "pwd") String pwd) {
		MemberBean member = (MemberBean) model.getAttribute("select");
		member.setMb_Password(pwd);
		boolean update = ms.update(member);
		if (update) {
			MemberBean select = ms.select(member.getMb_Account());
			model.addAttribute("login", select);
		}
		return "Member/mb_inf";
	}

	// 管理員(會員資料)
	@PostMapping("/adminall")
	public String Memberall(Model model) {
		List<MemberBean> inf = ms.adminselect();
		if (inf != null) {
			model.addAttribute("memberall", inf);
		}
		return "Member/adminModify";
	}

	// 管理員會員刪除
	@PostMapping("/delete")
	public String Delete(Model model, @RequestParam(value = "delete") Integer Id) {
		ms.deleteMember(Id);
		List<MemberBean> inf = ms.adminselect();
		model.addAttribute("memberall", inf);
		return "Member/adminModify";

	}

}
