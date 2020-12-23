package com.web.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.BookBean;
import com.web.book.model.ShoppingCartBean;
import com.web.book.service.BookStoreService;
import com.web.book.service.ShoppingCartService;

@Controller
@SessionAttributes(value = "list")
public class ShoppingCartController {

	@Autowired
	ShoppingCartService scService;
	
	@Autowired
	BookStoreService bsService;

	@GetMapping("shopping")
	public String addCart(Model model,
			@RequestParam(value = "goToCart", defaultValue = "0") Integer bk_ID,
			@RequestParam(value = "addCart", defaultValue = "0") Integer bk_ID2
			) {
// 先搜尋購物車內容
		List<ShoppingCartBean> listCart = scService.searchCart(1);
// 判斷按哪種按鈕 bk_ID:直接購買
		if (bk_ID != 0 && bk_ID2 == 0) {
// 如果listCart沒內容新增		
			if (listCart.size() == 0) {
				scService.addToCart(1, 100, bk_ID, 1);
				listCart = scService.searchCart(1);
				model.addAttribute("list", listCart);
				return "Transation/shoppingCart";
// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面
			} else {
				for (ShoppingCartBean shoppingCartBean : listCart) {
					if (bk_ID == shoppingCartBean.getBook().getBk_ID()) {
						model.addAttribute("same", "已經加入購物車");
						List<BookBean> list = bsService.searchBookStore();
						model.addAttribute("bookstore", list);
						return "Transation/storeMain";
					}
				}
// 沒有內容新增
				scService.addToCart(1, 100, bk_ID, 1);
				listCart = scService.searchCart(1);
				model.addAttribute("list", listCart);
				return "Transation/shoppingCart";
			}
// 判斷按哪種按鈕 bk_ID2:放入購物車
		} else if (bk_ID == 0 && bk_ID2 != 0) {
// 如果listCart沒內容新增	
			if (listCart.size() == 0) {
				scService.addToCart(1, 100, bk_ID2, 1);
				listCart = scService.searchCart(1);
				model.addAttribute("list", listCart);
				return "Transation/shoppingCart";
			}
// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面
			for (ShoppingCartBean shoppingCartBean : listCart) {
				if (bk_ID2 == shoppingCartBean.getBook().getBk_ID()) {
					model.addAttribute("same", "已經加入購物車");
					List<BookBean> list = bsService.searchBookStore();
					model.addAttribute("bookstore", list);
					return "Transation/storeMain";
				}
			}
// 沒有內容新增
			scService.addToCart(1, 100, bk_ID2, 1);
			listCart = scService.searchCart(1);
			model.addAttribute("list", listCart);
			return "Transation/shoppingCart";
		} else {
			model.addAttribute("list", listCart);
			return "Transation/shoppingCart";
		}
	}

}
