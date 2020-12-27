//package com.web.book.controller;
//
//import java.util.List;
//import javax.servlet.ServletContext;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import com.web.book.model.ActJoinBean;
//import com.web.book.model.MemberBean;
//import com.web.book.service.ActJoinService;
//import com.web.book.service.MemberService;
//
//@Controller
//public class ActJoinController {
//
//	String keyword = null;
//
//	@Autowired
//	ActJoinService actjoinService;
//	
//	@Autowired
//	MemberService memberService;
//
//	@Autowired
//	ServletContext context;
//
//	// 顯示所有報名紀錄
//	@GetMapping("/showJoin")
//	public String actjoinlist(
//			Model model
//			
//			) {
//		List<ActJoinBean> actjoinlist = actjoinService.getAllJoins();
//		model.addAttribute("alljoinacts", actjoinlist);
//		return "Activity/JoinHomepage";
//	}
//
////	搜尋關鍵字
////	@GetMapping("Discussion/search_keyword")
////	public String showSearchResult(Model model, @RequestParam(value = "keyword") String keyword) {
////		List<ActJoinBean> actjoinlist = actService.getAllActs();
////		model.addAttribute("allacts", actlist);
////		return "/Discussion/search_result";
////	}
//
//	// 顯示新增報名頁面
//	@GetMapping("/showJoinForm")
//	public String showCreateForm(
//			Model model
//			,@RequestParam("mb_Account")String mb_Account
//
//			) {
//		MemberBean mb = memberService.select(mb_Account);
//		ActJoinBean ajb = new ActJoinBean();
//		ajb.setMember(mb);
//		System.out.println(ajb);
//		model.addAttribute("ajb", ajb);
//		return "Activity/JoinForm";
//	}
//
//	// 新增報名表
//	@PostMapping("/showJoinForm")
//	public String createActJoin(
//			Model model
//			, @ModelAttribute("ajb") ActJoinBean ajb
//			)throws Exception {
//		model.addAttribute("ajb", ajb);
//		actjoinService.createActJoin(ajb);
//		return "redirect:/JoinHomepage";
//	}
//
////	// 顯示修改報名資料頁面
////	@GetMapping("/showUpdateForm")
////	public String showUpdateForm(
////			Model model
////			, @RequestParam(value = "join_ID", required = false) Integer join_ID
////			) {
////		ActJoinBean ajb = actjoinService.getActJoin(join_ID);
////		model.addAttribute("ajb", ajb);
////		return "Activity/updateAct";
////	}
//
//	// 修改成功後redirect所有報名紀錄
//	@PostMapping("/showUpdateForm")
//	public String updateAct(Model model, @ModelAttribute("ajb") ActJoinBean ajb,
//			@RequestParam(value = "join_ID", required = false) Integer join_ID) {
//		actjoinService.updateActJoin(ajb);
//		return "redirect:/showActs";
//	}
//
//	// 刪除活動後redirect所有報名紀錄
//	@GetMapping("/deleteAct")
//	public String deleteAct(@RequestParam("join_ID") Integer join_ID) {
//		actjoinService.deleteActJoin(join_ID);
//		return "redirect:/showActs";
//	}
//
//}
