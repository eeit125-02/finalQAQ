package com.web.book.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.book.model.ActBean;
import com.web.book.service.ActService;


@Controller
public class ActController {
//	String noImage = "/images/NoImage.png";
//	String noImageFemale = "/images/NoImage_Female.jpg";
//	String noImageMale = "/images/NoImage_Male.png";

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
	
	//測試商品頁用的 還要修改
	@GetMapping("/products")
	public String list(Model model) {
		List<ActBean> list = actService.getAllActs();
		model.addAttribute("products", list);
		return "Activity/products";
	}


	// 顯示新增活動頁面
	@GetMapping("/showCreateForm")
	public String showCreateForm(Model model) {
		ActBean ab = new ActBean();
		model.addAttribute("actbean", ab);
		return "Activity/ActForm";
	}

	// 新增成功後redirect所有活動紀錄
	@PostMapping("/showCreateForm")
	public String createAct(Model model, 
			@ModelAttribute("ab") ActBean ab,@RequestParam(value="file",required=false) MultipartFile  file
			) throws IOException {
		
		
		//儲存資料庫的路徑
//		  String sqlPath = null; 
//		  //定義檔案儲存的本地路徑
//	      String localPath="C:\\File\\";
//	      //定義 檔名
//	      String filename=null;  
//	      if(!ab.getfile().isEmpty()){  
//
//	          String uuid = UUID.randomUUID().toString().replaceAll("-","");  
//	          //獲得檔案型別(可以判斷如果不是圖片,禁止上傳)  
//	          String contentType=ab.getfile().getContentType();  
//	          //獲得檔案字尾名 
//	          String suffixName=contentType.substring(contentType.indexOf("/")+1);
//	          //得到 檔名
//	          filename=uuid+"."+suffixName; 
//	          System.out.println(filename);
//	          //檔案儲存路徑
//	          ab.getfile().transferTo(new File(localPath+filename));  
//	      }
//	      //把圖片的相對路徑儲存至資料庫
//	      sqlPath = "/images/"+filename;
//	      System.out.println(sqlPath);
//	      ab.setact_Image(sqlPath);
	      actService.createAct(ab);
	      model.addAttribute("ab", ab);
	      return "redirect:/showActs";
	
		
	}
	

	// 顯示修改活動頁面
	@GetMapping("/showUpdateForm")
	public String showUpdateForm(
			Model model, 
			@RequestParam(value="act_ID",required=false) Integer act_ID) {
		ActBean ab = actService.getAct(act_ID);
		model.addAttribute("ab", ab);
		return "Activity/updateAct";
	}

	// 修改成功後redirect所有活動紀錄
	@PostMapping("/showUpdateForm")
	public String updateAct(
			Model model, 
			@ModelAttribute("ab")ActBean ab,
	@RequestParam(value="act_ID",required=false) Integer act_ID) {
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
