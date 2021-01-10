package com.web.book.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.book.model.MemberBean;
import com.web.book.service.GlobalService;
import com.web.book.service.MemberService;

@Controller
@SessionAttributes(value = { "loginUser" })
public class Login {

	@Autowired
	MemberService ms;

	String Account;
	String logincheck =null;
	MemberBean checkMember;
	// 註冊資料
	@PostMapping("/registe")
	public String Registe(Model model, @RequestParam(value = "account") String mb_Account,
			@RequestParam(value = "pwd") String mb_Password, @RequestParam(value = "sex") String mb_Sex,
			@RequestParam(value = "name") String mb_Name,@RequestParam(value = "birthday") Date mb_Birthday,
			@RequestParam(value = "mail") String mb_Mail) {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String encryption = GlobalService.getMemberEncoder(mb_Password);
		MemberBean reg_member = new MemberBean(0, mb_Account, encryption, mb_Sex, mb_Birthday, mb_Name, mb_Mail, "", "",
				ts, 0, "", "");
		System.out.println(reg_member);
		reg_member.setCheckColume(true);
		System.out.println(reg_member);
		checkMember = reg_member;
		model.addAttribute("reg_member", reg_member);
		return "redirect:toConfirm";
	}
	
	// 註冊資料確認後送至資料庫
	@PostMapping("/confirm")
	public String Confirm() {
		System.out.println(checkMember);
		ms.insertMember(checkMember);
		return "redirect:toLogin";
	}

	// 重複帳號確認
	@PostMapping("/toRegiste/checkAccount/{mb_Account}")
	@ResponseBody
	public boolean checkAccount(@PathVariable("mb_Account") String account) {
		boolean check = ms.checkAccount(account);
		return check;
	}

	//重複信箱確認
	@PostMapping("/checkMail")
	@ResponseBody
	public boolean checkMail(@RequestParam(value = "mb_Mail",required = false) String email) {
		System.out.println("email");
		boolean check = ms.checkMail(email);
		System.out.println(check);
		return check;
	}
	
	//檢查舊密碼
	@PostMapping("/checkpwd")
	@ResponseBody
	public boolean checkPwd(@RequestParam(value = "oldpwd",required = false) String oldpwd) {
		boolean check = GlobalService.checkMemberEncoder(oldpwd,ms.select(Account).getMb_Password());
		System.out.println(oldpwd);
		System.out.println(check);
		return check;
	}
	
	// 檢查登入
	@PostMapping("/toLogin/checklogin/{mb_Account}/{mb_Password}")
	@ResponseBody
	public boolean checklogin(@PathVariable("mb_Account") String account, @PathVariable("mb_Password") String pwd) {
		boolean ck = ms.checkAccount(account);
		if(ck) {
		MemberBean mb = ms.select(account);
		boolean check = GlobalService.checkMemberEncoder(pwd,mb.getMb_Password());
		return check;
		}else {
			return ck;
		}
		
	}

	//JavaMail
	@PostMapping("/JavaMail")
	public String JavaMail(@RequestParam(value = "mail",required = false) String email) {
		JavaMail mail = new JavaMail();
		MemberBean member = ms.email(email);
		mail.SendMail(email,member.getMb_Password());
		return "redirect:toLogin";
	}
	
	// 檢查是否停權
	@PostMapping("/toLogin/checkColume/{mb_Account}")
	@ResponseBody
	public boolean checkColume(@PathVariable("mb_Account") String account) {
		boolean check = ms.checkColume(account);
		return check;
	}
	// 三方認證介面
		@PostMapping("/tothird")
		public @ResponseBody boolean tothird(Model model,
				@RequestParam(value = "name",required = false) String name,
				@RequestParam(value = "email",required = false) String email,
				@RequestParam(value = "file", required = false) String file,
				HttpServletResponse response) throws IOException, InterruptedException, ExecutionException {
			System.out.println(file);
			Account = email;
			boolean check = ms.checkAccount(Account);
				if(check==false) {			
					MemberBean loginMember = new MemberBean();
					Timestamp ts = new Timestamp(System.currentTimeMillis());
					loginMember.setMb_pic(file);
					loginMember.setCheckColume(true);
					loginMember.setMb_Birthday(new Date(0));
					loginMember.setMb_Date(ts);
					loginMember.setMb_Account(Account);
					loginMember.setMb_Name(name);
					ms.insertMember(loginMember);
					model.addAttribute(Account);
			}
				boolean verification = ms.checkColume(Account);
				if(verification==false) {
					return false;
				}
				MemberBean loginMember = ms.select(Account);
				String sessionId = GlobalService.createSessionID(String.valueOf(loginMember.getMb_ID()),
					loginMember.getMb_Name(), loginMember.getMb_Account());
			Cookie memId = new Cookie("Member_ID", sessionId);
			memId.setMaxAge(20*60);
			response.addCookie(memId);
			logincheck = "c" ;
			return true;
		}
	// 會員登入
	@PostMapping("/login")
	public String login(Model model, HttpServletResponse response, 
			@RequestParam(value = "account",required = false) String account,
			@RequestParam(value = "pwd",required = false) String pwd) throws IOException, InterruptedException, ExecutionException {
		MemberBean mb = ms.select(account);
		boolean pw =  GlobalService.checkMemberEncoder(pwd, mb.getMb_Password());
		if (pw) {
			if("a123456".equals(account) && "a123456".equals(pwd)) {
				Account = account;
				List<MemberBean> memberall = ms.adminselect();
				model.addAttribute("adminaccount", Account);
				model.addAttribute("admin", memberall);
				String sessionId = GlobalService.createSessionID(String.valueOf(mb.getMb_ID()),
						mb.getMb_Name(), mb.getMb_Account());
				Cookie memId = new Cookie("Member_ID", sessionId);
				memId.setMaxAge(1200);
				response.addCookie(memId);
				logincheck = "a" ;	
			}else {
			Account = account;
			String sessionId = GlobalService.createSessionID(String.valueOf(mb.getMb_ID()),
					mb.getMb_Name(), mb.getMb_Account());
			Cookie memId = new Cookie("Member_ID", sessionId);
			Cookie memName = new Cookie("Member_Name", mb.getMb_Name());			
			System.out.println(mb.getMb_pic());
			memId.setMaxAge(1200);
			response.addCookie(memId);
			response.addCookie(memName);
			model.addAttribute("loginMember", mb);
			logincheck = "b" ;
			}
			return "redirect:toCity";
		}
		return "Member/login";
				}
	// 會員資料
	@PostMapping("/mb_inf")
	public @ResponseBody Map<String,Object> Mb_inf(Model model) {
		MemberBean select = ms.select(Account);
		Map<String,Object> map= new HashMap<>(); 
		map.put("login", select);
		map.put("mb_Birthday",String.valueOf(select.getMb_Birthday()));
		return map;
	}

	// 會員修改
	@PostMapping("/toMbUpdate")
	public @ResponseBody Map<String,Object> toUpdate(Model model) {
		MemberBean mb_inf = ms.select(Account);
		Map<String,Object> map= new HashMap<>(); 
		map.put("mb_inf", mb_inf);
		map.put("mb_Birthday",String.valueOf(mb_inf.getMb_Birthday()));
		return map;
	}

	// 會員修改
	@PostMapping("/MbUpdate")
	public String Update(Model model,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file,
			@RequestParam(value = "test", required = false) String test,
			@RequestParam(value = "mb_Birthday", required = false) Date mb_Birthday,
			@RequestParam(value = "mb_Address", required = false) String mb_Address,
			@RequestParam(value = "mb_Tel", required = false) String mb_Tel,
			@RequestParam(value = "mb_Mail", required = false) String mb_Mail,
			@RequestParam(value = "mb_type", required = false) String mb_type
			) throws Exception {		
		MemberBean mb_inf = ms.select(Account);	
		System.out.println(test);
		if(test.equals("abc")) {
		mb_inf.setMb_pic(GlobalService.saveImage("member", file, mb_inf.getMb_Account()));
		}
		mb_inf.setMb_Birthday(mb_Birthday);
		mb_inf.setMb_Address(mb_Address);
		mb_inf.setMb_Tel(mb_Tel);
		mb_inf.setMb_Mail(mb_Mail);
		mb_inf.setMb_type(mb_type);
		boolean update = ms.update(mb_inf);
		if (update) {
			System.out.println(mb_inf);
			model.addAttribute("login", mb_inf);
		}
		return "redirect:toCity";
	}

	// 密碼修改介面
	@PostMapping("/Modify")
	public @ResponseBody MemberBean Modify(Model model, @ModelAttribute("loginUser") MemberBean loginUser
										  ) {
		model.addAttribute("loginUser",loginUser);
		return loginUser;
	}

	// 密碼更新
	@PostMapping("/Update")
	public String Update(Model model, @RequestParam("pwd") String pwd) {
		MemberBean mb_inf = ms.select(Account);
		String encryption = GlobalService.getMemberEncoder(pwd);
		mb_inf.setMb_Password(encryption);
		ms.update(mb_inf);
		return "redirect:toCity";
	}

	//管理員搜尋
	@PostMapping("/admin_search")
	public @ResponseBody Map<String,Object> admin_inf(String account) {
		System.out.println(account);
		MemberBean select = ms.select(account);
		Map<String,Object> map= new HashMap<>(); 
		map.put("infcheck", select.isCheckColume());
		map.put("inf", select);
		map.put("infDate",String.valueOf(select.getMb_Date()));
		System.out.println(map);
		return map;
	}
	
	// 管理員(會員資料)
	@GetMapping("/adminall")
	public String Memberall(Model model) {
		List<MemberBean> inf = ms.adminselect();
		model.addAttribute("memberall", inf);
		return "Member/adminModify";
	}

	// 管理員會員刪除
	@PostMapping("/delete")
	public String Delete(Model model, @RequestParam(value = "delete", defaultValue = "0") Integer deleteId,
			@RequestParam(value = "update", defaultValue = "") String account) {
		if (deleteId != 0) {
			ms.deleteMember(deleteId);
			List<MemberBean> inf = ms.adminselect();
			model.addAttribute("memberall", inf);
			return "Member/adminModify";
		} else {
			MemberBean member = ms.select(account);
			model.addAttribute("member", member);
			return "Member/adminupdate";
		}
	}

	// 管理員更新
	@PostMapping("/adminupdate")
	public String toadminupdate(Model model, @RequestParam(value = "pwd") String mb_Password,
			@RequestParam(value = "name") String mb_Name, @RequestParam(value = "mail") String mb_Mail,
			@RequestParam(value = "tel") String mb_Tel, @RequestParam(value = "address") String mb_Address,
			@RequestParam(value = "account") String account) {
		MemberBean mb_inf = ms.select(account);
		String encryption = GlobalService.getMemberEncoder(mb_Password);
		mb_inf.setMb_Password(encryption);
		mb_inf.setMb_Name(mb_Name);
		mb_inf.setMb_Mail(mb_Mail);
		mb_inf.setMb_Tel(mb_Tel);
		mb_inf.setMb_Address(mb_Address);
		boolean update = ms.update(mb_inf);
		List<MemberBean> inf = ms.adminselect();
		model.addAttribute("memberall", inf);
		return "Member/adminModify";
	}

	//管理員權限
	@PostMapping("/adminchange")
	public @ResponseBody void change(@RequestParam(value = "ac", required=false) String ac) {
		ms.change(ac);
	}
	// 管理員介面
	@GetMapping("/toAdmin")
	public String toadmin(Model model) {
		return "Member/admin";
	}

	// 登入介面
	@GetMapping("/toLogin")
	public String tologin(Model model) {
		return "Member/login";
	}

	// 註冊介面
	@GetMapping("/toRegiste")
	public String toregiste(Model model) {
		return "Member/registe";
	}
	
	// 註冊確認介面
	@GetMapping("/toConfirm")
	public String toConfirm(Model model) {
		System.out.println(checkMember);
		model.addAttribute("reg_member",checkMember);
		return "Member/confirm";
	}

	//忘記密碼
	@GetMapping("/toforget")
	public String toForget(Model model) {
		return "Member/forget";
	}
	
	// 會員介面
	@GetMapping("/toCity")
	public String tocity(Model model) {
		MemberBean inf = ms.select(Account);
		model.addAttribute("loginUser",inf);
		if(logincheck.equals("c")) {
			model.addAttribute("third","third");
			return "Member/city";
		}else if(logincheck.equals("a")) {
			model.addAttribute("third","admin");
			return "Member/city";
		}else if(logincheck.equals("b")) {
			model.addAttribute("common","common");
			return "Member/city";
		}else {
			return "Member/login";
		}
	}
	
}
