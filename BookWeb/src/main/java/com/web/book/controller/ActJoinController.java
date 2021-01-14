package com.web.book.controller;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
		List<ActJoinBean> actjoinlist = actjoinService.getAllJoins();
		model.addAttribute("alljoinacts", actjoinlist);


		return "Activity/showJoins";
	}
	
	//取得單一會員的報名紀錄
	@GetMapping("/showjoinbyID")
	public String showjoinbyID(
			Model model,
			@RequestParam(value = "mb_ID")Integer mb_ID
			) {
		List<ActJoinBean> mbjoinlist = actjoinService.getJoinRecords(mb_ID);
		model.addAttribute("mbjoinlist", mbjoinlist);		
		return "Activity/showjoinbyID";
		
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
//			,@RequestParam("mb_Account")String mb_Account
			) {
		System.out.println("--------"+act_ID);
		String act_Name = actService.getAct(act_ID).getact_Name();
		ActJoinBean ajb = new ActJoinBean();
		model.addAttribute("act_Name", act_Name);
		model.addAttribute("act_ID", act_ID);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("ajb", ajb);
		System.out.println(ajb.getAct());
		return "Activity/JoinForm";
	}

	// 送出報名表
	@PostMapping("/showJoinForm")
	public String createActJoin(
			Model model
			, @ModelAttribute("loginUser") MemberBean loginUser
			, @ModelAttribute("ajb") ActJoinBean ajb
			, @RequestParam("act_ID") Integer act_ID
//			,@RequestParam("mb_Account")String mb_Account
			)throws Exception {
		System.out.println("++++++++++++++");
		ActBean act = actService.getAct(act_ID);
		act.setAct_Differentpax(ajb.getjoin_Pax());
		ajb.setAct(act);
		ajb.getAct().getMember().setMb_Account(loginUser.getMb_Account());
		model.addAttribute("ajb", ajb);
		System.out.println(ajb);
		actjoinService.createActJoin(ajb);
		System.out.println("---------");
		return "redirect:/showJoins";
	}

	// 顯示修改報名資料頁面
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
		return "Activity/updateJoin";
	}

	// 修改成功後redirect所有報名紀錄
	@PostMapping("/showJoinUpdateForm")
	public String updateActJoin(
			Model model
			,@ModelAttribute("loginUser") MemberBean loginUser
			, @ModelAttribute("ajb") ActJoinBean ajb
			, @RequestParam(value = "act_ID") Integer act_ID
			, @RequestParam(value = "mb_ID") Integer mb_ID
			, HttpServletRequest request
			) {
		ajb.setAct(actService.getAct(act_ID));
		ajb.getAct().getMember().setMb_Account(loginUser.getMb_Account());
		actjoinService.updateActJoin(ajb);
		return "redirect:/showJoins";
	}

	// 刪除活動後redirect所有報名紀錄
	@GetMapping("/deleteJoin")
	public String deleteActJoin(
			@RequestParam(value = "join_ID", required = false) Integer join_ID
			) {
		actjoinService.deleteActJoin(join_ID);
		return "redirect:/showJoins";
	}

}
