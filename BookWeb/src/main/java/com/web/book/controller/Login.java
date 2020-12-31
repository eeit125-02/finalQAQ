package com.web.book.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.book.model.MemberBean;
import com.web.book.service.GlobalService;
import com.web.book.service.MemberService;

@Controller
@SessionAttributes(value = { "loginUser" })
public class Login {

	@Autowired
	MemberService ms;

	String Account;
	String logincheck;
	MemberBean checkMember;
	// 註冊資料
	@PostMapping("/registe")
	public String Registe(Model model, @RequestParam(value = "account") String mb_Account,
			@RequestParam(value = "pwd") String mb_Password, @RequestParam(value = "sex") String mb_Sex,
			@RequestParam(value = "name") String mb_Name,@RequestParam(value = "birthday") Date mb_Birthday, @RequestParam(value = "mail") String mb_Mail) {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
//		String type = "";
//		for (int i = 0; i < mb_Type.length; i++) {
//			type += mb_Type[i] + " ";
//		}
//		String MB_type = type;
		MemberBean reg_member = new MemberBean(0, mb_Account, mb_Password, mb_Sex, mb_Birthday, mb_Name, mb_Mail, null, null,
				ts, 0, null, null);
		System.out.println(reg_member);
		reg_member.setCheckColume(true);
		checkMember = reg_member;
		model.addAttribute("reg_member", reg_member);
		return "Member/confirm";
	}

	// 註冊資料確認後送至資料庫
//	@PostMapping("/upDateBookReport/{mb_Account}/{mb_Password}/{mb_Name}/{mb_Sex}/{mb_Birthday}/{mb_Address}/{mb_Tel}/{mb_Mail}/{mb_type}")
	@PostMapping("/confirm")
	public String Confirm() {
		ms.insertMember(checkMember);
		return "redirect:toLogin";
	}

	// google資料匯入資料庫
//	@PostMapping("/toLogin/google")
//	@ResponseBody
//	public String Google(Model model,HttpServletResponse response,@RequestParam(value="account") String account,
//						 @RequestParam(value="name", required = false) String name) throws IOException, InterruptedException, ExecutionException {
//		Account = account;
//		System.out.println(name);
//		MemberBean loginMember = ms.select(Account);
//		if(loginMember == null) {			
//			model.addAttribute(account);
//			loginMember.setMb_Account(account);
//			loginMember.setMb_Name(name);
//			ms.insertMember(loginMember);
//			model.addAttribute(account);
//		}
//		GlobalService.setLoginMember(loginMember);
//		String sessionId = GlobalService.createSessionID(String.valueOf(loginMember.getMb_ID()),
//				loginMember.getMb_Name(), loginMember.getMb_Account());
//		Cookie memId = new Cookie("Member_ID", sessionId);
//		memId.setMaxAge(120);
//		response.addCookie(memId);
//		System.out.println("--------------------");
//		return "Member/third";
//	}
//	
	// 重複帳號確認
	@PostMapping("/toRegiste/checkAccount/{mb_Account}")
	@ResponseBody
	public boolean checkAccount(@PathVariable("mb_Account") String account) {
		boolean check = ms.checkAccount(account);
		return check;
	}

	// 檢查登入
	@PostMapping("/toLogin/checklogin/{mb_Account}/{mb_Password}")
	@ResponseBody
	public boolean checklogin(@PathVariable("mb_Account") String account, @PathVariable("mb_Password") String pwd) {
		boolean check = ms.Login(account, pwd);
		System.out.println(check);
		return check;
	}

	// 檢查是否停權
	@PostMapping("/toLogin/checkColume/{mb_Account}")
	@ResponseBody
	public boolean checkColume(@PathVariable("mb_Account") String account) {
		boolean check = ms.checkColume(account);
		System.out.println(check);
		return check;
	}
	// 三方認證介面
		@PostMapping("/tothird")
		public @ResponseBody boolean tothird(Model model,
				@RequestParam(value = "name",required = false) String name,
				@RequestParam(value = "email",required = false) String email,
				HttpServletResponse response) throws IOException, InterruptedException, ExecutionException {
			Account = email;
			boolean check = ms.checkColume(Account);
			if(check==false) {		
			return false;
			}
			MemberBean loginMember = ms.select(Account);
				if(loginMember == null) {			
					model.addAttribute(Account);
					loginMember.setMb_Account(Account);
					loginMember.setMb_Name(name);
					ms.insertMember(loginMember);
			}
			//GlobalService.setLoginMember(loginMember);
			String sessionId = GlobalService.createSessionID(String.valueOf(loginMember.getMb_ID()),
					loginMember.getMb_Name(), loginMember.getMb_Account());
			Cookie memId = new Cookie("Member_ID", sessionId);
			memId.setMaxAge(120);
			response.addCookie(memId);
			logincheck = "c" ;
			return true;
		}
	// 會員登入
	@PostMapping("/login")
	public String login(Model model, HttpServletResponse response, 
			@RequestParam(value = "account",required = false) String account,
			@RequestParam(value = "pwd",required = false) String pwd) throws IOException, InterruptedException, ExecutionException {
		boolean mb = ms.Login(account, pwd);
		if (mb) {
			if("a123456".equals(account) && "a123456".equals(pwd)) {
				Account = account;
				MemberBean loginMember = ms.select(Account);
				List<MemberBean> memberall = ms.adminselect();
				model.addAttribute("adminaccount", Account);
				model.addAttribute("admin", memberall);
				String sessionId = GlobalService.createSessionID(String.valueOf(loginMember.getMb_ID()),
						loginMember.getMb_Name(), loginMember.getMb_Account());
				Cookie memId = new Cookie("Member_ID", sessionId);
				memId.setMaxAge(120);
				response.addCookie(memId);
				logincheck = "a" ;	
			}else {
			Account = account;
			MemberBean loginMember = ms.select(Account);
			String sessionId = GlobalService.createSessionID(String.valueOf(loginMember.getMb_ID()),
					loginMember.getMb_Name(), loginMember.getMb_Account());
			Cookie memId = new Cookie("Member_ID", sessionId);
			memId.setMaxAge(120);
			response.addCookie(memId);
			model.addAttribute("Account", Account);
			logincheck = "b" ;
			}
			return "redirect:toCity";
		}
		return "Member/login";
				}
	// 會員資料
	@PostMapping("/mb_inf")
	public String Mb_inf(Model model) {
		MemberBean memberbean = new MemberBean();
		model.addAttribute("MemberBean", memberbean);
		MemberBean select = ms.select(Account);
		System.out.println(select);
		model.addAttribute("login", select);
		return "Member/mb_inf";
	}

	// 會員修改
	@GetMapping("/MbUpdate")
	public String toUpdate(Model model) {
		MemberBean memberbean = new MemberBean();
		MemberBean mb_inf = ms.select(Account);
		model.addAttribute("mb_inf", mb_inf);
		model.addAttribute("account", Account);
		model.addAttribute("MemberBean", memberbean);
		return "Member/mb_modify";
	}

	// 會員修改
	@PostMapping("/MbUpdate")
	public String Update(Model model, @ModelAttribute("MemberBean") MemberBean MB,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file, HttpServletRequest request,
			RedirectAttributes attr) throws Exception {
		
		MemberBean mb_inf = ms.select(Account);
		System.out.println(GlobalService.saveImage("member", file, mb_inf.getMb_Account()));
		
//		String name =UUID.randomUUID().toString().replaceAll("-", "");//使用UUID給圖片重新命名，並去掉四個“-”
//		String name = mb_inf.getMb_Account();
//		System.out.println(name);
//		// 獲取檔案的副檔名
//		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
//		// 設定圖片上傳路徑
//		String filePath = "C:\\Users\\Student\\Documents\\GitHub\\finalQAQ\\BookWeb\\src\\main\\webapp\\Resource\\image";
//		System.out.println(request.getContextPath());
//		System.out.println(filePath);
//		File imagePath = new File(filePath);
//		File fileImage = new File(filePath + "/" + name + "." + ext);
//		if (!imagePath.exists() && !imagePath.isDirectory()) {
//			System.out.println(filePath);
//			imagePath.mkdir();
//		}
//		file.transferTo(fileImage);// 把圖片儲存路徑儲存到資料庫
		// 重定向到查詢所有使用者的Controller，測試圖片回顯
		
		mb_inf.setMb_pic(GlobalService.saveImage("member", file, mb_inf.getMb_Account()));
		mb_inf.setMb_Birthday(MB.getMb_Birthday());
		mb_inf.setMb_Address(MB.getMb_Address());
		mb_inf.setMb_Tel(MB.getMb_Tel());
		mb_inf.setMb_Mail(MB.getMb_Mail());
		mb_inf.setMb_type(MB.getMb_type());
		boolean update = ms.update(mb_inf);
		if (update) {
			System.out.println(mb_inf);
			model.addAttribute("login", mb_inf);
		}
		return "Member/mb_inf";
	}

	// 密碼修改介面
	@PostMapping("/Modify")
	public String Modify(Model model) {
		model.addAttribute("account", Account);
		return "Member/Modify";
	}

	// 密碼更新
	@PostMapping("/Update")
	public String Update(Model model, @RequestParam("pwd") String pwd) {
		MemberBean mb_inf = ms.select(Account);
		mb_inf.setMb_Password(pwd);
		ms.update(mb_inf);
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

	// 會員介面
	@GetMapping("/toCity")
	public String tocity(Model model) {
		System.out.println(logincheck);
		if(logincheck.equals("c")) {
			return "Member/third";
		}else if(logincheck.equals("a")) {
			return "Member/admin";
		}
		return "Member/city";
	}
	
}
