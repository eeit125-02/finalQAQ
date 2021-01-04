package com.web.book.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
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
		Integer tatolMoney = 0;
// 先搜尋購物車內容
		List<ShoppingCartBean> listCart = scService.searchCart(13);
// 判斷按哪種按鈕 bk_ID:直接購買
		if (bk_ID != 0 && bk_ID2 == 0) {
// 如果listCart沒內容新增		
			if (listCart.size() == 0) {
				scService.addToCart(1, 100, bk_ID, 9);
				listCart = scService.searchCart(13);
				model.addAttribute("list", listCart);
				for (ShoppingCartBean shoppingCartBean : listCart) {
					tatolMoney += shoppingCartBean.getCart_Num()*shoppingCartBean.getCart_Price();
				}
				model.addAttribute("totalCart", tatolMoney);
				return "Transation/shoppingCart";
// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面
			} else {
				for (ShoppingCartBean shoppingCartBean : listCart) {
					if (bk_ID == shoppingCartBean.getBook().getBk_ID()) {
						model.addAttribute("same", "已經加入購物車");
						List<BookStoreBean> list = bsService.searchBookStore();
						model.addAttribute("bookstore", list);
						return "Transation/storeMain";
					}
				}
// 沒有內容新增
				scService.addToCart(1, 100, bk_ID, 9);
				listCart = scService.searchCart(9);
				model.addAttribute("list", listCart);
				for (ShoppingCartBean shoppingCartBean : listCart) {
					tatolMoney += shoppingCartBean.getCart_Num()*shoppingCartBean.getCart_Price();
				}
				model.addAttribute("totalCart", tatolMoney);
				return "Transation/shoppingCart";
			}
// 判斷按哪種按鈕 bk_ID2:放入購物車
		} else if (bk_ID == 0 && bk_ID2 != 0) {
// 如果listCart沒內容新增	
			if (listCart.size() == 0) {
				scService.addToCart(1, 100, bk_ID2, 9);
				listCart = scService.searchCart(9);
				model.addAttribute("list", listCart);
				for (ShoppingCartBean shoppingCartBean : listCart) {
					tatolMoney += shoppingCartBean.getCart_Num()*shoppingCartBean.getCart_Price();
				}
				model.addAttribute("totalCart", tatolMoney);
				return "Transation/shoppingCart";
			}
// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面
			for (ShoppingCartBean shoppingCartBean : listCart) {
				if (bk_ID2 == shoppingCartBean.getBook().getBk_ID()) {
					model.addAttribute("same", "已經加入購物車");
					List<BookStoreBean> list = bsService.searchBookStore();
					model.addAttribute("bookstore", list);
					return "Transation/storeMain";
				}
			}
// 沒有內容新增
			scService.addToCart(1, 100, bk_ID2, 9);
			listCart = scService.searchCart(9);
			model.addAttribute("list", listCart);
			for (ShoppingCartBean shoppingCartBean : listCart) {
				tatolMoney += shoppingCartBean.getCart_Num()*shoppingCartBean.getCart_Price();
			}
			model.addAttribute("totalCart", tatolMoney);
			return "Transation/shoppingCart";
		} else {
			model.addAttribute("list", listCart);
			for (ShoppingCartBean shoppingCartBean : listCart) {
				tatolMoney += shoppingCartBean.getCart_Num()*shoppingCartBean.getCart_Price();
			}
			model.addAttribute("totalCart", tatolMoney);
			return "Transation/shoppingCart";
		}
	}
	
	@PostMapping("updateCart.do")
	public String updateOrDelete(
			@RequestParam String cmd,
			@RequestParam (value = "cart_ID", required = false) Integer cart_ID,
			@RequestParam (value = "cart_Num", required = false) Integer cart_Num,
			Model model
			) {
		if (cmd.equalsIgnoreCase("DEL")) {
	        scService.deleteCart(cart_ID); // 刪除購物車內的某項商品
		    return "redirect:/shopping";
		} else if (cmd.equalsIgnoreCase("MOD")) {
			scService.updateCart(cart_ID, cart_Num);   // 修改某項商品的數項
		    return "redirect:/shopping";
		} else {
			return "redirect:/shopping";
		}
	}
	
	@GetMapping("checkout")
	public String checkoutTest(Model model,
			@RequestParam String bko_Name,
			@RequestParam String bko_Add,
			@RequestParam String bko_Cel,
			@ModelAttribute("list") List<ShoppingCartBean> list
			) {
		System.out.println(list);
//		Integer qoq = 0;
//		for (ShoppingCartBean shoppingCartBean : list) {
//			qoq += shoppingCartBean.getCart_Num()*shoppingCartBean.getCart_Price();
//		}
//		System.out.println(qoq);
		System.out.println(bko_Name);
		System.out.println(bko_Add);
		System.out.println(bko_Cel);
		return "Transation/bkCheckout";
	}
	
}
