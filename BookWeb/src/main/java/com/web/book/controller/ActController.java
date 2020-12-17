package com.web.book.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.book.model.ActBean;
import com.web.book.service.ActService;

@Controller
public class ActController {
	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";

	@Autowired
	ActService actService;

	@Autowired
	ServletContext context;

	// 顯示所有活動紀錄
	@GetMapping("/showActs")
	public String actlist(Model model) {
		List<ActBean> actlist = actService.getAllActs();
		model.addAttribute("allacts", actlist);
		return "Activity/showActs";
	}

	// 顯示新增活動頁面
	@GetMapping("/showCreateForm")
	public String showCreateForm(Model model) {
		ActBean actbean = new ActBean();
		model.addAttribute("actbean", actbean);
		return "Activity/ActForm";
	}

	// 新增成功後redirect所有活動紀錄
	@PostMapping("/saveActs")
	public String createAct(@ModelAttribute("actbean") ActBean actbean) {
		actService.createAct(actbean);
		return "redirect:/showActs";

	}

	// 修改活動頁面
	@GetMapping("/updateAct")
	public String showUpdateForm(@RequestParam("act_Name") String act_Name, Model model) {
		ActBean actbean = actService.getAct(act_Name);
		model.addAttribute("actbean", actbean);
		return "Activity/ActForm";
	}

	// 刪除活動後redirect所有活動紀錄
	@GetMapping("/deleteAct")
	public String deleteAct(@RequestParam("act_ID") Integer act_ID) {
		actService.deleteAct(act_ID);
		return "redirect:/showActs";
	}

	@GetMapping("/555")
	public String p555(Model model) {
		ActBean actbean = new ActBean();
		model.addAttribute("actbean", actbean);
		return "Activity/ActForm";
	}

}
