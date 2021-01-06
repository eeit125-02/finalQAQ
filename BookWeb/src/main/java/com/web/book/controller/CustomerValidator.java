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
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "act_Name", "actbean.name.empty", "姓名欄位不正確");
		ValidationUtils.rejectIfEmpty(errors, "password", "actbean.password.empty");
		ValidationUtils.rejectIfEmpty(errors, "password1", "actbean.password1.empty");
		ValidationUtils.rejectIfEmpty(errors, "email", "actbean.email.empty", "email欄不能空白");

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
