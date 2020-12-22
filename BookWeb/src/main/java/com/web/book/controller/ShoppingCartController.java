package com.web.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.book.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	
	@Autowired
	ShoppingCartService service;
	
	@PostMapping("shopping")
	public String addCart(Model model
			) {
		return "Transation/shoppingCart";
	}

}
