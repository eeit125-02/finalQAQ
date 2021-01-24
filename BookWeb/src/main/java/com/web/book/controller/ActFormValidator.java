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
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Name" , "actbean.actname.empty" , "請填寫活動名稱");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Theme", "actbean.acttheme.empty", "請選擇活動主題");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Guest", "actbean.actguest.empty", "請輸入活動嘉賓");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Image", "actbean.actimage.empty", "請上傳活動圖片");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Pax"  , "actbean.actpax.empty"  , "請輸入活動人數");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Place", "actbean.actplace.empty", "請選擇活動場所");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Date" , "actbean.actdate.empty" , "請選擇活動日期");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Time" , "actbean.acttime.empty" , "請選擇活動時間");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Loc"  , "actbean.actloc.empty"  , "請選擇縣市區域並輸入地址");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Tag"  , "actbean.acttag.empty"  , "請選擇活動標籤");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Rule" , "actbean.actrule.empty" , "請輸入活動規則");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Intro", "actbean.actintro.empty", "請輸入活動簡介");
		System.out.println("5151561561561");
		ActBean actbean = (ActBean) target;
//		String name = customer.getName();
//		if (name == null || name.trim().length() == 0) {
//			errors.rejectValue("name", "customerBean.name.size");
//		}	
		System.out.println("515156++++++++++++++++++");
		if (actbean.getact_Name() != null && actbean.getact_Name().length() < 2 && actbean.getact_Name().contains(" ")) {
			errors.rejectValue("act_Name", " ", "請填寫活動名稱");
		}

		if (actbean.getact_Theme().contentEquals("NONE")) {
			errors.rejectValue("act_Theme", " ", "請填寫活動主題");
		}
		
		if (actbean.getact_Guest() != null && actbean.getact_Guest().isEmpty() && actbean.getact_Guest().equals("0")) {
			errors.rejectValue("act_Guest", " ", "請填寫活動嘉賓");
		}		
		
		if (actbean.getact_Image().isEmpty() && actbean.getact_Image() != null) {
			errors.rejectValue("act_Image", " ", "actbean.actimage.empty");			
		}
		
		try {
			System.out.println("41414144++++++++++++++");
			Integer act_Pax = Integer.valueOf(actbean.getact_Pax());
			if (act_Pax<1) {
				errors.rejectValue("act_Pax", " ", "人數必須大於0");
			}
		} catch (Exception e) {
			errors.rejectValue("act_Pax", " ", "請填寫數字");	
		}
		System.out.println("515156+----------------");
		
//		if (actbean.getact_Pax() != null && actbean.getact_Pax().isEmpty() && actbean.getact_Pax() <= 0) {
//			errors.rejectValue("act_Pax", " ", "actbean.actpax.empty");
//		}			

		
		
		if (actbean.getact_Place() != null && actbean.getact_Place().isEmpty()) {
			errors.rejectValue("act_Place", " ", "actbean.actplace.empty");
		}

		if ( actbean.getact_Date().isEmpty()) {
			errors.rejectValue("act_Date", " ", "actbean.actdate.empty");
		}
		
		if ( actbean.getact_Time().isEmpty()  && actbean.getact_Time().length() < 5 && actbean.getact_Loc().length() > 15) {
			errors.rejectValue("act_Time", " ", "actbean.acttime.empty");
		}
		
		if (actbean.getact_Loc() != null && actbean.getact_Loc().isEmpty()) {
			errors.rejectValue("act_Loc", " ", "actbean.actloc.empty");
		}

		if (actbean.getact_Tag() != null && actbean.getact_Tag().isEmpty()) {
			errors.rejectValue("act_Tag", " ", "actbean.acttag.empty");
		}

		if (actbean.getact_Rule() != null && actbean.getact_Rule().isEmpty() && actbean.getact_Rule().contains(" ") && actbean.getact_Rule().length() < 2 || actbean.getact_Rule().length() > 200) {
			errors.rejectValue("act_Rule", " ", "actbean.actrule.empty");
		}
		
		if (actbean.getact_Intro().isEmpty()) {
			errors.rejectValue("act_Intro", " ", "actbean.actimage.empty");
		}
		System.out.println("578967867856786786+++++++++");	
	}

}
