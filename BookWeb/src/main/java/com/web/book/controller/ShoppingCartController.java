package com.web.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.book.model.BookStoreBean;
import com.web.book.model.MemberBean;
import com.web.book.model.ShoppingCartBean;
import com.web.book.service.BookStoreService;
import com.web.book.service.ShoppingCartService;

@Controller
@SessionAttributes(value = { "loginUser" })
public class ShoppingCartController {

	@Autowired
	ShoppingCartService scService;

	@Autowired
	BookStoreService bsService;

	MemberBean loginUser;

	@ModelAttribute
	public void setLoginUser(Model model, SessionStatus status) {
		loginUser = (MemberBean) model.getAttribute("loginUser");

	}

	// 放入購物車
	@GetMapping("/addCart")
	@ResponseBody
	public Map<String, Object> inCar(@RequestParam(value = "bk", required = false) Integer bk,
			@RequestParam(value = "bp", required = false) Integer bp,
			@RequestParam(value = "bs", required = false) Integer bs,
			@RequestParam(value = "bks", required = false) Integer bks,
			@RequestParam(value = "qty", required = false) Integer qty) {
//		{ bk : bk_ID1, bp : bs_Price, bn : bs_Num, bks : $('bks_ID').val() }
//		System.out.println("------------------------------------------------");
//		System.out.println(bk);
//		System.out.println(bp);
//		System.out.println(bs);
//		System.out.println(bks);
//		System.out.println(qty);
//		System.out.println("------------------------------------------------");
		Integer amount = (bs - qty);
		Boolean qaq = true;
		Integer a = 0;
		Integer b = 0;
		Map<String, Object> map = new HashMap<>();
		map.put("qty", amount);
		List<ShoppingCartBean> list = scService.searchCart(loginUser.getMb_ID());
		for (ShoppingCartBean shoppingCartBean : list) {
//			 如果購物車已經有這筆資料更新
			System.out.println("---------------------------");
			System.out.println(shoppingCartBean.getBook().getBk_ID());
			System.out.println(shoppingCartBean.getCart_Num());
			a = shoppingCartBean.getBook().getBk_ID();
			b = shoppingCartBean.getCart_Num();
			if (bk == a && bs == b) {
				scService.updateCartAll(shoppingCartBean.getCart_Num() + qty, bk, loginUser.getMb_ID());
				qaq = false;
				System.out.println("---------------------------");
				System.out.println(qaq);				
			}
		}
//		 如果購物車沒有這筆資料則新增
		if (qaq) {
			scService.addToCart(qty, bp, bk, loginUser.getMb_ID());
		}
		return map;
	}

	@PostMapping("shopping")
	public String addCart(Model model,
			@RequestParam(value = "bk_ID", defaultValue = "0", required = false) Integer bk_ID,
			@RequestParam(value = "bk_ID1", defaultValue = "0", required = false) Integer bk_ID2,
			@RequestParam(value = "bk_Price", required = false) Integer bk_Price) {

		Integer tatolMoney = 0;
		System.out.println("-------------------------------------");
		System.out.println("bk_ID=" + bk_ID);
		System.out.println("bk_ID1=" + bk_ID2);
		System.out.println("bk_Price=" + bk_Price);
		System.out.println("-------------------------------------");
// 先搜尋購物車內容
		List<ShoppingCartBean> listCart = scService.searchCart(loginUser.getMb_ID());
// 判斷按哪種按鈕 bk_ID:直接購買
		if (bk_ID != 0 && bk_ID2 == 0) {
// 如果listCart沒內容新增		
			if (listCart.size() == 0) {
				scService.addToCart(1, bk_Price, bk_ID, loginUser.getMb_ID());
				listCart = scService.searchCart(loginUser.getMb_ID());
				model.addAttribute("list", listCart);
				for (ShoppingCartBean shoppingCartBean : listCart) {
					tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
				}
				model.addAttribute("totalCart", tatolMoney);
				return "Transation/shoppingCart";
// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面 -> 改成跳到購物車
			} else {
				for (ShoppingCartBean shoppingCartBean : listCart) {
					if (bk_ID == shoppingCartBean.getBook().getBk_ID()) {
//						List<BookBean> list = bsService.searchBookStore(1);
//						model.addAttribute("store", list);
						listCart = scService.searchCart(loginUser.getMb_ID());
						model.addAttribute("list", listCart);
						return "Transation/shoppingCart";
					}
				}
// 沒有內容新增
				scService.addToCart(1, bk_Price, bk_ID, loginUser.getMb_ID());
				listCart = scService.searchCart(loginUser.getMb_ID());
				model.addAttribute("list", listCart);
				for (ShoppingCartBean shoppingCartBean : listCart) {
					tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
				}
				model.addAttribute("totalCart", tatolMoney);
				return "Transation/shoppingCart";
			}
// 判斷按哪種按鈕 bk_ID2:放入購物車
		} else if (bk_ID == 0 && bk_ID2 != 0) {
// 如果listCart沒內容新增	
			if (listCart.size() == 0) {
				scService.addToCart(1, bk_Price, bk_ID2, loginUser.getMb_ID());
				listCart = scService.searchCart(loginUser.getMb_ID());
				model.addAttribute("list", listCart);
				for (ShoppingCartBean shoppingCartBean : listCart) {
					tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
				}
				model.addAttribute("totalCart", tatolMoney);
				return "Transation/shoppingCart";
			}
// 有內容判斷購物車裡是否已經有那本書，有就跳轉回去原頁面
			for (ShoppingCartBean shoppingCartBean : listCart) {
				if (bk_ID2 == shoppingCartBean.getBook().getBk_ID()) {
					model.addAttribute("same", "已經加入購物車");
					List<BookStoreBean> list = bsService.searchBookStore(1);
					model.addAttribute("bookstore", list);
					return "Transation/qaqMain";
				}
			}
// 沒有內容新增
			scService.addToCart(1, bk_Price, bk_ID2, loginUser.getMb_ID());
			listCart = scService.searchCart(loginUser.getMb_ID());
			model.addAttribute("list", listCart);
			for (ShoppingCartBean shoppingCartBean : listCart) {
				tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
			}
			model.addAttribute("totalCart", tatolMoney);
			return "Transation/shoppingCart";
		} else {
			model.addAttribute("list", listCart);
			for (ShoppingCartBean shoppingCartBean : listCart) {
				tatolMoney += shoppingCartBean.getCart_Num() * shoppingCartBean.getCart_Price();
			}
			model.addAttribute("totalCart", tatolMoney);
			return "Transation/shoppingCart";
		}
	}

	@PostMapping("updateCart.do")
	public String updateOrDelete(@RequestParam String cmd,
			@RequestParam(value = "cart_ID", required = false) Integer cart_ID,
			@RequestParam(value = "cart_Num", required = false) Integer cart_Num, Model model) {
		List<ShoppingCartBean> listCart = scService.searchCart(loginUser.getMb_ID());
		if (cmd.equalsIgnoreCase("DEL")) {
			scService.deleteCart(cart_ID); // 刪除購物車內的某項商品
			listCart = scService.searchCart(loginUser.getMb_ID());
			model.addAttribute("list", listCart);
			return "Transation/shoppingCart";
		} else if (cmd.equalsIgnoreCase("MOD")) {
			scService.updateCart(cart_ID, cart_Num); // 修改某項商品的數項
			listCart = scService.searchCart(loginUser.getMb_ID());
			model.addAttribute("list", listCart);
			return "Transation/shoppingCart";
		} else {
			listCart = scService.searchCart(loginUser.getMb_ID());
			model.addAttribute("list", listCart);
			return "Transation/shoppingCart";
		}
	}

	@PostMapping("checkout")
	public String checkoutTest(Model model, @RequestParam String bko_Name, @RequestParam String bko_Add,
			@RequestParam String bko_Cel) {
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
