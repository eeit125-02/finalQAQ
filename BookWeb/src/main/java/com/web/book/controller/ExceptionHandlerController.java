package com.web.book.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//攔截錯誤
//@ControllerAdvice
public class ExceptionHandlerController {

    @ExceptionHandler(Throwable.class)
    public String ExHandler(Throwable e, Model model) {
    	model.addAttribute("exception", e);
        return "/ErrorPage"; 
    }
}