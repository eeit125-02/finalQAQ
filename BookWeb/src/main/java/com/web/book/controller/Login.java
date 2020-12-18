package com.web.book.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.MemberBean;
import com.web.book.service.MemberService;


@SessionAttributes("login")
@Controller
public class Login {

	@Autowired
	MemberService ms;

	String Account;
	
	// 會員登入
	@PostMapping("/login")
	public String login(Model model, @RequestParam(value = "account") String account,
			@RequestParam(value = "pwd") String pwd) {
		boolean mb = ms.Login(account, pwd);
		if (mb) {		
			Account=account;
			if (account.equals("a123456") && pwd.equals("a123456")) {
				List<MemberBean> memberall = ms.adminselect();
				model.addAttribute("admin", memberall);
				return "Member/admin";
			} 
		} else {
			return "Member/login";
		}
		return "Member/city";
	}
	//會員資料
	@PostMapping("/mb_inf")
	public String Mb_inf(Model model) {
		MemberBean select = ms.select(Account);
		System.out.println(select);
		model.addAttribute("login",select);
		return "Member/mb_inf";
	}

	// 會員修改介面
	@PostMapping("/Modify")
	public String Modify(Model model) {
		model.addAttribute("account",Account);
		return "Member/Modify";
	}
	//會員修改
	@PostMapping("/Update")
	public String Update(Model model, @RequestParam(value = "pwd") String pwd) {
		MemberBean mb_inf = ms.select(Account);
		System.out.println(mb_inf);
		mb_inf.setMb_Password(pwd);
		boolean update = ms.update(mb_inf);
		if (update) {
			model.addAttribute("login", mb_inf);
		}
		return "Member/mb_inf";
	}

	//會員介面
	@GetMapping("/toCity")
	public String tocity(Model model) {
		return "Member/city";
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
	public String Delete(Model model, @RequestParam(value = "delete",defaultValue="0") Integer deleteId,
									  @RequestParam(value = "update",defaultValue="") String account) {
		if(deleteId != 0) {
		ms.deleteMember(deleteId);
		List<MemberBean> inf = ms.adminselect();
		model.addAttribute("memberall", inf);
		return "Member/adminModify";
		}else {
		MemberBean member = ms.select(account);
		model.addAttribute("member",member);
		return "Member/adminupdate";
		}
	}

	@PostMapping(value = "/adminupdate")
	public String toadminupdate(Model model,@RequestParam(value = "pwd") String mb_Password,
			 @RequestParam(value = "name") String mb_Name,@RequestParam(value = "mail") String mb_Mail, @RequestParam(value = "tel") String mb_Tel,
			@RequestParam(value = "address") String mb_Address,
			@RequestParam(value = "account") String account) {
		MemberBean mb_inf = ms.select(account);
		mb_inf.setMb_Password(mb_Password); 
		mb_inf.setMb_Name(mb_Name);
		mb_inf.setMb_Mail(mb_Mail);	
		mb_inf.setMb_Tel(mb_Tel); 
		mb_inf.setMb_Address(mb_Address);
		boolean update = ms.update(mb_inf);
		List<MemberBean> inf = ms.adminselect();
		model.addAttribute("memberall", inf);
		return "Member/adminModify";
	}
	
	@RequestMapping(value = "/toAdmin")
	public String toadmin(Model model) {
		return "Member/admin";
	}
	
	@RequestMapping(value = "/toLogin")
	public String tologin(Model model) {
		
		return "Member/login";
	}
	
	@RequestMapping(value = "/toRegiste")
	public String toregiste(Model model) {
		
		return "Member/registe";
	}
	
}
