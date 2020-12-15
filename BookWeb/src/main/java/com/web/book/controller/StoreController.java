package com.web.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	@RequestMapping("/Transation/storeMain")
	public String mainPage(Model model) {
		return "/Transation/storeMain";
	}
	
	
}
