package com.web.book.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.web.book.model.ActBean;
import com.web.book.service.ActService;

@Controller
@RequestMapping("/act")
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
		return "allacts";
	}
	//顯示新增活動頁面
	@GetMapping("/showCreateForm")
	public String showCreateForm(Model model) {
		ActBean actbean = new ActBean();
		model.addAttribute("actbean", actbean);
		return "/ActForm";
	}
	
	//新增成功後redirect所有活動紀錄
	@PostMapping("/createAct")
	public String createAct(@ModelAttribute("actbean") ActBean actbean) {
		actService.createAct(actbean);
		return "redirect:/act/showActs";
		
	}
	
	//修改活動頁面
	@GetMapping("/updateAct")
	public String showUpdateForm(@RequestParam("act_Name") String act_Name,Model model) {
		ActBean actbean = actService.getAct(act_Name);
		model.addAttribute("actbean",actbean);
		return "/ActForm";	
	}
	
	//刪除活動後redirect所有活動紀錄
	@GetMapping("/deleteAct")
	public String deleteAct(@RequestParam("act_ID")Integer act_ID) {
		actService.deleteAct(act_ID);
		return "redirect:/act/showActs";
	}
	

}
