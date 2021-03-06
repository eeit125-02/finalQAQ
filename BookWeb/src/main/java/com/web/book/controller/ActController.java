package com.web.book.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.book.model.ActBean;
import com.web.book.model.MemberBean;
import com.web.book.service.ActJoinService;
import com.web.book.service.ActService;
import com.web.book.service.GlobalService;

@Controller
@SessionAttributes(value = { "loginUser" })
public class ActController {

	String keyword = null;

	@Autowired
	ActService actService;

	@Autowired
	ActJoinService actjoinService;
	
//	@Autowired
//	MemberService memberService;

	@Autowired
	ServletContext context;

	// 顯示所有活動紀錄
	@GetMapping("/showActs")
	public String actlist(Model model) {
		List<ActBean> actlist = actService.getAllActs();
		model.addAttribute("allacts", actlist);
		model.addAttribute("check","");
		return "Activity/ActHomepage";
	}
	
	
	//取得單一會員的活動創建紀錄
		@GetMapping("/showActbyID")
		public String showActbyID(
				Model model
				,@ModelAttribute("loginUser") MemberBean loginUser
				) {
			List<ActBean> mbactlist = actService.getActRecords(loginUser.getMb_ID());
			model.addAttribute("mbactlist", mbactlist);	
			model.addAttribute("aib",loginUser);
			return "Activity/showActbyID";
			
		}
		
	

	// 搜尋關鍵字
	@GetMapping("/searchkeyword")
	@ResponseBody
	public List<ActBean> showSearchResult(
			Model model, 
			@RequestParam(value = "keyword") String keyword) {
		List<ActBean> actlist = actService.searchKeyword(keyword);
		return actlist;
	}

	// 顯示新增活動頁面
	@GetMapping("/showCreateForm")
	public String showCreateForm(
			@ModelAttribute("loginUser") MemberBean loginUser, Model model
			) {
		ActBean ab = new ActBean();
		model.addAttribute("actbean", ab);
		model.addAttribute("mb_ID", loginUser.getMb_ID());
		model.addAttribute("mb_Name", loginUser.getMb_Name());
		return "Activity/ActForm";
	}

	// 送出活動
	@PostMapping("/showCreateForm")
	public String createAct(Model model
							, @ModelAttribute("actbean") ActBean ab
							, BindingResult bindingResult
							, @ModelAttribute("loginUser") MemberBean loginUser
							, @RequestParam(value = "file", required = false) CommonsMultipartFile file
							, HttpServletRequest request
							, RedirectAttributes attr) throws Exception {
		System.out.println("++++++++++++++++++++++");
		if (file.isEmpty()) {
			bindingResult.rejectValue("act_Image", "", "請上傳圖片");
//			return "Activity/ActForm";
		}
		System.out.println(file);
		System.out.println("++++++++++++++++++++++");
		System.out.println(ab.getact_Image());
		GlobalService.saveImage("active", file, ab.getact_Name());
		System.out.println(ab.getact_Image());
		ab.setact_Image(GlobalService.saveImage("active", file, ab.getact_Name()));
		System.out.println("++++++++++++++++++++++");
		System.out.println(ab.getact_Image());
		new ActFormValidator().validate(ab, bindingResult);	
		System.out.println("51456156156");
		if (bindingResult.hasErrors()) {
		// 圖片上傳用
			System.out.println("======================");
			List<ObjectError> list = bindingResult.getAllErrors();
			for(ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			System.out.println("======================");
			return "Activity/ActForm";
		}
		System.out.println("--------------------------");
		ab.setMb_ID(loginUser.getMb_ID());
		ab.setAct_Differentpax(0);
		actService.createAct(ab);	
		
		return "redirect:/showActs";
	}

	// 顯示修改活動頁面
	@GetMapping("/showUpdateForm")
	public String showUpdateForm(Model model, @RequestParam(value = "act_ID", required = false) Integer act_ID) {
		ActBean ab = actService.getAct(act_ID);
		model.addAttribute("ab", ab);
		return "Activity/updateAct";
	}

	// 修改成功後redirect所有活動紀錄
	@PostMapping("/showUpdateForm")
	public String updateAct(Model model, @ModelAttribute("ab") ActBean ab,
			@RequestParam(value = "act_ID", required = false) Integer act_ID,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file, HttpServletRequest request,
			@RequestParam(value = "picpath", required = false) String picpath,
			RedirectAttributes attr) throws Exception {
		System.out.println("--------------------");
		// 圖片上傳用
		System.out.println(picpath);
		ActBean act = actService.getAct(act_ID);
		if(picpath.equals("abc")) {
			act.setact_Image(GlobalService.saveImage("active", file, ab.getact_Name()));
		}
		
		act.setact_Name(ab.getact_Name());
		act.setact_Theme(ab.getact_Theme());
		act.setact_Date(ab.getact_Date());
		act.setact_Loc(ab.getact_Loc());
		act.setact_Intro(ab.getact_Intro());
		act.setact_Guest(ab.getact_Guest());
		act.setact_Pax(ab.getact_Pax());
		act.setact_Rule(ab.getact_Rule());
		act.setact_Tag(ab.getact_Tag());
		act.setact_Place(ab.getact_Place());
		actService.updateAct(act);
		return "redirect:/showActs";

	}

	// 刪除活動後redirect所有活動紀錄
	@GetMapping("/deleteAct")
	public String deleteAct(@RequestParam("act_ID") Integer act_ID) {
		actService.deleteAct(act_ID);
		return "redirect:/showActs";
	}
	
	// 刪除活動後redirect所有活動紀錄
		@GetMapping("/deleteAct1")
		public String deleteAct1(@RequestParam("act_ID") Integer act_ID) {
			System.out.println("123445");
			actService.deleteAct(act_ID);
			return "redirect:/showActbyID";
		}
	
	

}
