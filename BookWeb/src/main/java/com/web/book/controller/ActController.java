package com.web.book.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.book.model.ActBean;
import com.web.book.service.ActJoinService;
import com.web.book.service.ActService;

@Controller
public class ActController {
	
	String keyword = null;
	
	@Autowired
	ActService actService;
	
	@Autowired
	ActJoinService actjoinService;

	@Autowired
	ServletContext context;

	// 顯示所有活動紀錄
	@GetMapping("/showActs")
	public String actlist(Model model) {
		List<ActBean> actlist = actService.getAllActs();
		model.addAttribute("allacts", actlist);
		return "Activity/ActHomepage";
	}


    // 搜尋關鍵字
	@GetMapping("Discussion/search_keyword")
	public String showSearchResult(Model model, @RequestParam(value = "keyword") String keyword) {
		List<ActBean> actlist = actService.getAllActs();
		model.addAttribute("allacts", actlist);
		return "/Discussion/search_result";
	}

	
	// 顯示新增活動頁面
	@GetMapping("/showCreateForm")
	public String showCreateForm(Model model) {
		ActBean ab = new ActBean();
		model.addAttribute("actbean", ab);
		return "Activity/ActForm";
	}
	
	
	// 新增活動
	@PostMapping("/showCreateForm")
	public String createAct(
	Model model,
	@ModelAttribute("actbean") ActBean ab,
	@RequestParam(value="file",required=false) CommonsMultipartFile file,
	HttpServletRequest request,
	RedirectAttributes attr)throws Exception {
		
	//圖片上傳用
	//GlobalService.saveImage("active", file, "member_ID");
	//
		
		
//	String name =UUID.randomUUID().toString().replaceAll("-", "");//使用UUID給圖片重新命名，並去掉四個“-”
	String name = ab.getact_Name();
	System.out.println(name);
	String ext = FilenameUtils.getExtension(file.getOriginalFilename());//獲取檔案的副檔名
	String filePath = "C:\\Users\\Student\\Documents\\GitHub\\finalQAQ\\BookWeb\\src\\main\\webapp\\Resource\\image";//設定圖片上傳路徑
	System.out.println(request.getContextPath());
	System.out.println(filePath);
	File imagePath = new File(filePath);
	File fileImage = new File(filePath+"/"+name + "." + ext);
	
	if (!imagePath .exists() && !imagePath .isDirectory())
	{
	System.out.println(filePath);
	imagePath.mkdir();                                                                                                         
	}
	file.transferTo(fileImage);//把圖片儲存路徑儲存到資料庫
	//重定向到查詢所有使用者的Controller，測試圖片回顯
	ab.setact_Image(name + "." + ext);
	actService.createAct(ab);
	model.addAttribute("name", name);

	return "redirect:/ActHomepage";
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
			@RequestParam(value = "act_ID", required = false) Integer act_ID) {
		actService.updateAct(ab);
		return "redirect:/showActs";

	}

	// 刪除活動後redirect所有活動紀錄
	@GetMapping("/deleteAct")
	public String deleteAct(@RequestParam("act_ID") Integer act_ID) {
		actService.deleteAct(act_ID);
		return "redirect:/showActs";
	}


}
