package com.web.book.controller;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.book.model.ActBean;


public class CustomerValidator implements Validator {
	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");

	@Override
	public boolean supports(Class<?> clazz) {
		return ActBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Name", "actbean.actname.empty", "請填寫活動名稱");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Theme", "actbean.acttheme.empty", "請選擇活動主題");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Date", "actbean.actdate.empty", "請選擇活動日期");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Time", "actbean.acttime.empty", "請上傳活動時間");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Image", "actbean.actimage.empty", "請上傳活動照片");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Loc", "actbean.actloc.empty", "請輸入地址");
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
		
		
		if (actbean.getact_Name() != null && actbean.getact_Name().length() < 2 || actbean.getact_Name().length() > 30) {
			errors.rejectValue("act_Name", "actbean.name.size");
		}

		if (actbean.getact_Theme() != null && actbean.getact_Theme().contains(" ")) {
			errors.rejectValue("password", "customerBean.password.space");
		}

		if (actbean.getact_Date() != null && actbean.getact_Date().contains(" ")) {
			errors.rejectValue("password1", "customerBean.password1.space");
		}
		
		if (actbean.getact_Loc() != null && actbean.getact_Loc().length() < 5 && actbean.getact_Loc().length() > 15) {
			errors.rejectValue("password1", "customerBean.password1.size");
		}
		if (actbean.getact_Intro() != null && actbean.getact_Intro() != null &&
			!actbean.getact_Intro().equals(actbean.getact_Intro())
		) {
			errors.rejectValue("password", "customerBean.password.mustEqual");
		}

		if (actbean.getact_Place() != null && !EMAIL_REGEX.matcher(actbean.getact_Place()).matches()) {
			errors.rejectValue("email", "customerBean.email.invalid");
		}

	}

}
