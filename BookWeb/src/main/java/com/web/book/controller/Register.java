package com.web.book.controller;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.book.model.MemberBean;
import com.web.book.service.MemberService;

@Controller
public class Register {

	@Autowired
	MemberService ms;
	
	MemberBean checkMember;

	//註冊資料
	@PostMapping("/registe")
	public String Registe(Model model, @RequestParam(value = "account") String mb_Account,
			@RequestParam(value = "pwd") String mb_Password, @RequestParam(value = "sex") String mb_Sex,
			@RequestParam(value = "date") Date mb_Birthday, @RequestParam(value = "name") String mb_Name,
			@RequestParam(value = "mail") String mb_Mail, @RequestParam(value = "tel") String mb_Tel,
			@RequestParam(value = "address") String mb_Address, @RequestParam(value = "type") String[] mb_Type,
			@RequestParam(value = "pic") String mb_Pic) {
		String type = "";
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		for (int i = 0; i < mb_Type.length; i++) {
			type += mb_Type[i] + " ";
		}
		String MB_type = type;
		MemberBean reg_member = new MemberBean(0, mb_Account, mb_Password, mb_Sex, mb_Birthday, mb_Name, mb_Mail,
				mb_Tel, mb_Address, ts, 0, MB_type, null);
		System.out.println(reg_member);
		checkMember = reg_member;
		model.addAttribute("reg_member", reg_member);
		return "Member/confirm";
	}

	//註冊資料確認後送至資料庫
//	@PostMapping("/upDateBookReport/{mb_Account}/{mb_Password}/{mb_Name}/{mb_Sex}/{mb_Birthday}/{mb_Address}/{mb_Tel}/{mb_Mail}/{mb_type}")
	@PostMapping("/confirm")
	public String Confirm() {	
		ms.insertMember(checkMember);
		return "Member/login";		
	}
}