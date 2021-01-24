package com.web.book.controller;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.ActBean;
import com.web.book.model.ActJoinBean;
import com.web.book.model.MemberBean;
import com.web.book.service.ActJoinService;
import com.web.book.service.ActService;
import com.web.book.service.MemberService;

@Controller
@SessionAttributes(value = { "loginUser" })

public class ActJoinController {

	String keyword = null;

	@Autowired
	ActJoinService actjoinService;
	
	@Autowired
	MemberService memberService;

	@Autowired
	ActService actService;

	@Autowired
	ServletContext context;

	// 顯示所有報名紀錄
	@GetMapping("/showJoins")
	public String actjoinlist(Model model	
			) {
		System.out.println("123456");
		List<ActJoinBean> actjoinlist = actjoinService.getAllJoins();
		model.addAttribute("alljoinacts", actjoinlist);
//		System.out.println(actjoinlist.get(0).getAct().getMember().getMb_Account());
		return "Activity/showJoins";
	}
	
	//取得單一會員的報名紀錄
	@GetMapping("/showJoinbyID")
	public String showJoinbyID(
			Model model
			,@ModelAttribute("loginUser") MemberBean loginUser
			) {
		System.out.println("aaaaaaaa");
		List<ActJoinBean> mbjoinlist = actjoinService.getJoinRecords(loginUser.getMb_ID());
		model.addAttribute("name",loginUser.getMb_Name());
		model.addAttribute("mbjoinlist", mbjoinlist);		
		return "Activity/showJoinbyID";
		
	}
	
	

//	搜尋關鍵字
//	@GetMapping("Discussion/search_keyword")
//	public String showSearchResult(Model model, @RequestParam(value = "keyword") String keyword) {
//		List<ActJoinBean> actjoinlist = actService.getAllActs();
//		model.addAttribute("allacts", actlist);
//		return "/Discussion/search_result";
//	}

	// 顯示新增報名頁面
	@GetMapping("/showJoinForm")
	public String showJoinForm(
			@ModelAttribute("loginUser") MemberBean loginUser
			,Model model
			,@RequestParam("act_ID")Integer act_ID
			) {
		if(actjoinService.check(loginUser.getMb_ID(),act_ID)==false) {
		String act_Name = actService.getAct(act_ID).getact_Name();
		ActJoinBean ajb = new ActJoinBean();
		model.addAttribute("act_Name", act_Name);
		model.addAttribute("act_ID", act_ID);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("ajb", ajb);
		System.out.println(ajb);
		return "Activity/JoinForm";
		}else {
			List<ActBean> actlist = actService.getAllActs();
			model.addAttribute("allacts", actlist);
			model.addAttribute("check","repeat");
			return "Activity/ActHomepage";
		}
	}

	// 送出報名表
	@PostMapping("/showJoinForm")
	public String createActJoin(
			Model model
			, @ModelAttribute("loginUser") MemberBean loginUser
			, @ModelAttribute("ajb") ActJoinBean ajb
			, @RequestParam("act_ID") Integer act_ID
			)throws Exception {
		ActBean act = actService.getAct(act_ID);
		MemberBean mb = memberService.select(loginUser.getMb_Account());
		mb.setMb_Mail(ajb.getMember().getMb_Mail());
		mb.setMb_Tel(ajb.getMember().getMb_Tel());
		act.setAct_Differentpax(act.getAct_Differentpax()+1);
		ajb.setMember(mb);
		ajb.setMb_ID(loginUser.getMb_ID());
		ajb.setAct(act);
		System.out.println(ajb);
		actjoinService.createActJoin(ajb);
		JavaMail jm = new JavaMail();
		jm.SendAct(ajb.getMember().getMb_Mail(), act.getact_Name(), act.getact_Loc(),act.getact_Date(), act.getact_Time(),act.getact_Intro(),act.getact_Image(),loginUser.getMb_Name());
		System.out.println("---------");
		return "redirect:showJoinbyID";
	}

	@GetMapping("/showJoinUpdateForm")
	public String showUpdateForm(
			@ModelAttribute("loginUser") MemberBean loginUser,
			Model model
			, @RequestParam(value = "join_ID", required = false) Integer join_ID
			) {
		ActJoinBean ajb = actjoinService.getActJoin(join_ID);
		model.addAttribute("loginUser", loginUser);
//		model.addAttribute("mb_account", loginUser.getMb_Account());
		model.addAttribute("ajb", ajb);
		System.out.println(ajb);
		return "Activity/updateJoin";
	}

	// 修改成功後redirect所有報名紀錄
	@PostMapping("/showJoinUpdateForm")
	public String updateActJoin(
			Model model
			,@ModelAttribute("loginUser") MemberBean loginUser
			, @ModelAttribute("ajb") ActJoinBean ajb
			, @RequestParam(value = "act_ID") Integer act_ID
			,@RequestParam("join_ID")Integer join_ID
			, HttpServletRequest request
			) {
		ActJoinBean actjoin = actjoinService.getActJoin(join_ID);
		actjoin.getMember().setMb_Mail(ajb.getMember().getMb_Mail());
		actjoin.getMember().setMb_Tel(ajb.getMember().getMb_Tel());
//		ajb.getAct().getMember().setMb_Account(loginUser.getMb_Account());
		actjoinService.updateActJoin(actjoin);
		return "redirect:showJoinbyID";
	}

	// 刪除活動後redirect所有報名紀錄
	@GetMapping("/deleteJoin")
	public String deleteActJoin(
			@RequestParam(value = "join_ID", required = false) Integer join_ID,
			@RequestParam(value = "act_ID", required = false) Integer act_ID
			) {
		actjoinService.deleteActJoin(join_ID);
		ActBean act=actService.getAct(act_ID);
		act.setAct_Differentpax(act.getAct_Differentpax()-1);
		actService.updateAct(act);
		return "redirect:showJoinbyID";
	}

}
