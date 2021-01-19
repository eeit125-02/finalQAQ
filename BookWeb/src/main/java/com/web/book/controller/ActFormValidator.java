package com.web.book.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.web.book.model.ActBean;

public class ActFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ActBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Name", "actbean.actname.empty", "請填寫活動名稱");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Theme", "actbean.acttheme.empty", "請選擇活動主題");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Date", "actbean.actdate.empty", "請選擇活動日期");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Time", "actbean.acttime.empty", "請選擇活動時間");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Image", "actbean.actimage.empty", "請上傳活動照片");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Loc", "actbean.actloc.empty", "請選擇縣市區域並輸入地址");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Intro", "actbean.actintro.empty", "請輸入活動簡介");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Guest", "actbean.actguest.empty", "請輸入活動嘉賓");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Pax", "actbean.actpax.empty", "請輸入活動人數");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Rule", "actbean.actrule.empty", "請輸入活動規則");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Tag", "actbean.acttag.empty", "請選擇活動標籤");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Place", "actbean.actplace.empty", "請選擇活動場所");

		ActBean actbean = (ActBean) target;
//		String name = customer.getName();
//		if (name == null || name.trim().length() == 0) {
//			errors.rejectValue("name", "customerBean.name.size");
//		}	
		
		if (actbean.getact_Name() != null && actbean.getact_Name().length() > 2 && actbean.getact_Name().contains(" ")) {
			errors.rejectValue("act_Name", "actbean.actname.empty");
		}

		if (actbean.getact_Theme() != null && actbean.getact_Theme().equals("NONE")) {
			errors.rejectValue("act_Theme", "actbean.acttheme.empty");
		}

		if (actbean.getact_Date() != null && actbean.getact_Date().isEmpty()) {
			errors.rejectValue("act_Date", "actbean.actdate.empty");
		}
		
		if (actbean.getact_Time() != null && actbean.getact_Time().isEmpty()  && actbean.getact_Time().length() < 5 && actbean.getact_Loc().length() > 15) {
			errors.rejectValue("act_Time", "actbean.acttime.empty");
		}
		
		if (actbean.getact_Image() != null && actbean.getact_Image().isEmpty()) {
			errors.rejectValue("act_Image", "actbean.actimage.empty");			
		}
		
		if (actbean.getact_Loc() != null && actbean.getact_Loc().isEmpty()) {
			errors.rejectValue("act_Loc", "actbean.actloc.empty");
		}
		
		if (actbean.getact_Intro() != null && actbean.getact_Intro().isEmpty()) {
			errors.rejectValue("act_Intro", "actbean.actimage.empty");
		}
		
		if (actbean.getact_Guest() != null && actbean.getact_Guest().isEmpty()) {
			errors.rejectValue("act_Guest", "actbean.actguest.empty");
		}		
		
		if (actbean.getact_Pax() != null && actbean.getact_Pax().isEmpty() && actbean.getact_Pax().equals("0")) {
			errors.rejectValue("act_Pax", "actbean.actpax.empty");
		}		

		if (actbean.getact_Rule() != null && actbean.getact_Rule().isEmpty() && actbean.getact_Rule().contains(" ") && actbean.getact_Rule().length() < 2 || actbean.getact_Rule().length() > 30) {
			errors.rejectValue("act_Rule", "actbean.actrule.empty");
		}
		
		if (actbean.getact_Tag() != null && actbean.getact_Tag().isEmpty()) {
			errors.rejectValue("act_Tag", "actbean.acttag.empty");
		}
		
		if (actbean.getact_Place() != null && actbean.getact_Place().isEmpty()) {
			errors.rejectValue("act_Place", "actbean.actplace.empty");
		}

	}

}
