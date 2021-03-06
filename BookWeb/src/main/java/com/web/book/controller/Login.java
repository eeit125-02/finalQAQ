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
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.book.model.MemberBean;
import com.web.book.service.GlobalService;
import com.web.book.service.MemberService;

@Controller
@SessionAttributes(value = { "loginUser" })
public class Login {

	@Autowired
	MemberService ms;
//	String mail;
//	String Account;
	String logincheck =null;
//	MemberBean checkMember;
	
	
	// 註冊資料
	@PostMapping("/registe")
	public String Registe(Model model, @RequestParam(value = "account") String mb_Account,
			@RequestParam(value = "pwd") String mb_Password, @RequestParam(value = "sex") String mb_Sex,
			@RequestParam(value = "name") String mb_Name,@RequestParam(value = "birthday") Date mb_Birthday,
			@RequestParam(value = "mail") String mb_Mail) throws IOException, InterruptedException, ExecutionException {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String encryption = GlobalService.getMemberEncoder(mb_Password);
		String pic = "https://firebasestorage.googleapis.com/v0/b/bookweb-50d11.appspot.com/o/member%2F%E5%81%87%E8%A3%9D%E6%9C%89%E5%9C%96%E7%89%87.jpg?alt=media&token=2ce87f02-12f3-4120-821f-e0dcfa825f49";
		MemberBean loginUser = new MemberBean(0, mb_Account, encryption, mb_Sex, mb_Birthday, mb_Name, mb_Mail, "", "",
				ts, 0, "",pic);
		loginUser.setCheckColume(true);
		System.out.println(loginUser);
		model.addAttribute("loginUser",loginUser);
		JavaMail jm = new JavaMail();
		jm.Register(mb_Mail);
		return "index";
	}
	
	// 註冊資料確認後送至資料庫
	@GetMapping("/toconfirm")
	public String Confirm(Model model) {
		System.out.println("-------------------------------------");
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		System.out.println(loginUser);
		ms.insertMember(loginUser);
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
	public boolean checkPwd(Model model,@RequestParam(value = "oldpwd",required = false) String oldpwd) {
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		boolean check = GlobalService.checkMemberEncoder(oldpwd,ms.select(loginUser.getMb_Account()).getMb_Password());
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
	
	//忘記密碼更新
	@PostMapping("/JavaMailUpdate")
	public String JavaMailUpdate(Model model, @RequestParam("pwd") String pwd) {
		String encryption = GlobalService.getMemberEncoder(pwd);
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		System.out.println(loginUser.getMb_Account());
		ms.select(loginUser.getMb_Account()).setMb_Password(encryption);
		ms.update(loginUser);
		return "redirect:toLogin";
	}
	
	//JavaMail跳轉
	@GetMapping("/pwdlink")
	public String pwdlink(Model model) {
		return "Member/MailModify";
	}
	
	//JavaMail
	@PostMapping("/JavaMail")
	public String JavaMail(Model model,@RequestParam(value = "mail",required = false) String email,HttpServletResponse response) throws IOException, InterruptedException, ExecutionException {
		MemberBean loginUser = ms.email(email);
		model.addAttribute("loginUser",loginUser);
		JavaMail mail = new JavaMail();
		mail.SendMail(email);
		return "index";
	}
	
	// 檢查是否停權
	@PostMapping("/toLogin/checkColume/{mb_Account}")
	@ResponseBody
	public boolean checkColume(@PathVariable("mb_Account") String account) {
		if(account.equals("a123456")) {
			return true;
		}
		boolean check = ms.checkColume(account);
		return check;
	}
	// 三方認證介面
		@PostMapping("/tothird")
		public @ResponseBody boolean tothird(Model model,
				@RequestParam(value = "name",required = false) String name,
				@RequestParam(value = "email",required = false) String email,
				HttpServletResponse response) throws IOException, InterruptedException, ExecutionException {
			String Account = email;
			boolean check = ms.checkAccount(Account);
				if(check==false) {			
					MemberBean loginMember = new MemberBean();
					Timestamp ts = new Timestamp(System.currentTimeMillis());
					String pic = "https://firebasestorage.googleapis.com/v0/b/bookweb-50d11.appspot.com/o/member%2F%E5%81%87%E8%A3%9D%E6%9C%89%E5%9C%96%E7%89%87.jpg?alt=media&token=2ce87f02-12f3-4120-821f-e0dcfa825f49";
					loginMember.setMb_Tel("");
					loginMember.setMb_Address("");
					loginMember.setMb_type("");
					loginMember.setMb_pic(pic);
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
			memId.setMaxAge(600*600);
			response.addCookie(memId);
			model.addAttribute("loginUser", loginMember);
//			logincheck = "c" ;
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
				List<MemberBean> memberall = ms.adminselect();
				model.addAttribute("adminaccount", account);
				model.addAttribute("admin", memberall);
				String sessionId = GlobalService.createSessionID(String.valueOf(mb.getMb_ID()),
						mb.getMb_Name(), mb.getMb_Account());
				Cookie memId = new Cookie("Member_ID", sessionId);
				memId.setMaxAge(60*60);
				response.addCookie(memId);
				model.addAttribute("loginUser", mb);
//				logincheck = "a" ;	
			}else {
			String sessionId = GlobalService.createSessionID(String.valueOf(mb.getMb_ID()),
					mb.getMb_Name(), mb.getMb_Account());
			Cookie memId = new Cookie("Member_ID", sessionId);
			Cookie memName = new Cookie("Member_Name", mb.getMb_Name());			
			System.out.println(mb.getMb_pic());
			memId.setMaxAge(600*600);
			response.addCookie(memId);
			response.addCookie(memName);
			model.addAttribute("loginUser", mb);
			logincheck = "b" ;
			}
			return "redirect:toCity";
		}
		return "Member/login";
				}
	// 會員資料
	@PostMapping("/mb_inf")
	public @ResponseBody Map<String,Object> Mb_inf(Model model) {
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		MemberBean select = ms.select(loginUser.getMb_Account());
		Map<String,Object> map= new HashMap<>(); 
		map.put("login", select);
		map.put("mb_Birthday",String.valueOf(select.getMb_Birthday()));
		return map;
	}

	// 會員修改
	@PostMapping("/toMbUpdate")
	public @ResponseBody Map<String,Object> toUpdate(Model model) {
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		MemberBean mb_inf = ms.select(loginUser.getMb_Account());
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
			@RequestParam(value = "mb_type", required = false) String mb_type
			) throws Exception {		
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		MemberBean mb_inf = ms.select(loginUser.getMb_Account());	
		System.out.println(test);
		if(test.equals("abc")) {
		mb_inf.setMb_pic(GlobalService.saveImage("member", file, mb_inf.getMb_Account()));
		}
		mb_inf.setMb_Birthday(mb_Birthday);
		mb_inf.setMb_Address(mb_Address);
		mb_inf.setMb_Tel(mb_Tel);
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
	public @ResponseBody MemberBean Modify(Model model
										  ) {
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		return loginUser;
	}

	// 密碼更新
	@PostMapping("/Update")
	public String Update(Model model, @RequestParam("pwd") String pwd) {
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		MemberBean mb_inf = ms.select(loginUser.getMb_Account());
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
	@GetMapping("/admindelete")
	public String Delete(Model model, @RequestParam(value = "dl" ,required = false) Integer deleteId) {
		System.out.println("++++++++++++++++++++++++++"+deleteId);
			ms.deleteMember(deleteId);
			List<MemberBean> inf = ms.adminselect();
			model.addAttribute("memberall", inf);
//			logincheck="a";
			return "redirect:toCity";
	}
//	// 管理員更新
//	@PostMapping("/adminupdate")
//	public String toadminupdate(Model model, @RequestParam(value = "pwd") String mb_Password,
//			@RequestParam(value = "name") String mb_Name, @RequestParam(value = "mail") String mb_Mail,
//			@RequestParam(value = "tel") String mb_Tel, @RequestParam(value = "address") String mb_Address,
//			@RequestParam(value = "account") String account) {
//		MemberBean mb_inf = ms.select(account);
//		String encryption = GlobalService.getMemberEncoder(mb_Password);
//		mb_inf.setMb_Password(encryption);
//		mb_inf.setMb_Name(mb_Name);
//		mb_inf.setMb_Mail(mb_Mail);
//		mb_inf.setMb_Tel(mb_Tel);
//		mb_inf.setMb_Address(mb_Address);
//		boolean update = ms.update(mb_inf);
//		List<MemberBean> inf = ms.adminselect();
//		model.addAttribute("memberall", inf);
//		return "Member/adminModify";
//	}

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
	public String tologin(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		logincheck=null;
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		return "Member/login";
	}

	// 註冊介面
	@GetMapping("/toRegiste")
	public String toregiste(Model model) {
		return "Member/registe";
	}

	//忘記密碼
	@GetMapping("/toforget")
	public String toForget(Model model) {
		return "Member/forget";
	}
	
	// 會員介面
	@GetMapping("/toCity")
	public String tocity(Model model) {
		MemberBean loginUser = (MemberBean)model.getAttribute("loginUser");
		System.out.println(logincheck);
		if(loginUser==null) {
			logincheck=null;
			return "redirect:toLogin";
		}
		MemberBean inf = ms.select(loginUser.getMb_Account());
		System.out.println(inf);
		model.addAttribute("login",inf);
		if(loginUser.getMb_Account().equals("a123456")) {
			model.addAttribute("third","admin");
			System.out.println("99999999");
			return "Member/city";
		}else if(logincheck=="b") {
			model.addAttribute("third","common");
			System.out.println("123");
			return "Member/city";
		}else {
			model.addAttribute("third","third");
			System.out.println("456");
			return "Member/city";
		}
	}
	
}
